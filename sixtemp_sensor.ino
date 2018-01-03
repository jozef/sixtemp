/*
  sixtemp.ino - read up to six temperature sensors using Arduino
                and show their status using RGB led

  Created by Jozef Kutej, 22 December 2017.
  Released into the public domain.

  I2C address defaults to 0x18, send one byte to set read address register, one of:
        0x60        read 1 byte with number of sensors
        0x61..0x66  read 14 bytes of sensor 1..6 data:
                        struct sixtemp_sensor {
                            bool has_error;
                            bool has_address;
                            float temp_c;
                            char address[8];
                        };

*/

#include <Arduino.h>
#include <Wire.h>
#include <OneWire.h>
#include <EEPROM.h>
#include <DallasTemperature.h>
#include "RB1WTemp.h"
#include "TextCMD.h"

const char MAGIC[] = "6temp 0.02";

// temperature vars
#define ONE_WIRE_BUS A1    // data one wire port A1
#define TEMPERATURE_PRECISION 12
#define MAX_SENSORS 6
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
float cur_temp;
float min_temp = -127;
float max_temp;
uint8_t temp_sensor_current = 0;
uint8_t temp_sensors_count = 0;
uint8_t temp_sensors_count_prev = 0;

#define DFT_I2C_ADDR 0x18
struct sixtemp_config {
    uint8_t i2c_addr;
    uint8_t future_conf[31];
};
uint8_t i2c_register = 0;

sixtemp_config config = {
    DFT_I2C_ADDR,    // i2c_addr
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  // place-holder for future config options
};

char to_send_reg0[2+sizeof(float)+sizeof(DeviceAddress)];

DeviceAddress temp_sensors[MAX_SENSORS];

#define MAX_CMD_LINE 0x1F
uint8_t current_line_end = 0;
char current_line[MAX_CMD_LINE+1];

struct ntemp_pin {
    uint8_t red;
    uint8_t blue;
};
ntemp_pin ntemp_pins[] = {
    { 10, 12 },
    { 11, A0 },
    { 9, 8 },
    { 6, 7 },
    { 5, 4 },
    { 3, 2 }
};

RB1WTemp rb1wtemps[MAX_SENSORS];

#define ALARM_PIN A2
uint8_t alarm_value = 0;

cmd_dispatch commands[] = {
    {
        "help",
        &cmd_help
    },
    {
        "?",
        &cmd_help
    },
    {
        "forget",
        &cmd_forget
    },
    {
        "temp",
        &cmd_temp
    },
    {
        "info",
        &cmd_info
    },
    {
        "set",
        &cmd_set_dispatch
    },
    {
        "tled",
        &cmd_tled
    }
};
cmd_dispatch commands_set[] = {
    {
        "i2c",
        &cmd_set_i2c
    }
};

TextCMD cmd((sizeof(commands)/sizeof(commands[0])),commands);
TextCMD cmd_set((sizeof(commands_set)/sizeof(commands_set[0])),commands_set);

void setup () {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].init(ntemp_pins[i].red, ntemp_pins[i].blue,sensors);
        rb1wtemps[i].refresh(0);
    }

    pinMode(ALARM_PIN, OUTPUT);

    Serial.begin(9600);
    while (Serial.available()) { Serial.read(); }

    char magic[strlen(MAGIC)];
    for (uint8_t i=0; i<strlen(MAGIC); i++) {
        magic[i] = EEPROM.read(i);
    }

    if (memcmp(MAGIC,magic,strlen(MAGIC)) == 0) {
        Serial.print(F("eeprom magic found: "));
        Serial.println(MAGIC);

        // read config
        for (uint8_t i = 0; i < sizeof(config); i++) {
            *((char*)&config+i) = EEPROM.read(strlen(MAGIC)+i);
        }
        // read sensors addresses
        for (uint8_t i = 0; i < MAX_SENSORS; i++) {
            uint8_t base = strlen(MAGIC)+sizeof(config)+(1+sizeof(DeviceAddress))*i;
            rb1wtemps[i].has_address = EEPROM.read(base);
            for (uint8_t si = 0; si < sizeof(DeviceAddress); si++) {
                rb1wtemps[i].address[si] = EEPROM.read(base+1+si);
            }
        }
    }
    else {
        Serial.println(F("eeprom magic missmatch, doing init"));
        // after magic, there is MAX_SENSORS of bool has_address and DeviceAddress
        // write magic
        for (uint8_t i=0; i<strlen(MAGIC); i++) {
            EEPROM.write(i,MAGIC[i]);
        }
        // write config
        for (uint8_t i = 0; i < sizeof(config); i++) {
            EEPROM.write(strlen(MAGIC)+i, *((char*)&config+i));
        }
        // zero out the rest
        for (uint8_t i=(strlen(MAGIC)+sizeof(config)); i<(strlen(MAGIC)+sizeof(config)+MAX_SENSORS+MAX_SENSORS*sizeof(DeviceAddress)); i++) {
            EEPROM.write(i,0);
        }
    }

    Wire.begin(config.i2c_addr);
    Wire.onRequest(i2c_request);
    Wire.onReceive(i2c_receive);
}

uint8_t blink_idx = 0;
uint8_t blink_value = 1;

unsigned long tick = 0;

void loop () {
    // blink alarm on error
    if (no_reading_errors()) {
        digitalWrite(ALARM_PIN, 0);
    }
    else {
        digitalWrite(ALARM_PIN, alarm_value);
        alarm_value = !alarm_value;
    }

    // re-read sensor addresses
    if (tick++ % 10 == 0) {
        refresh_one_wire();
    }

    // update temperatures
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].refresh(tick);
    }

    delay(100);

    while (Serial.available()) {
        char ch = Serial.read();
        if (ch == '\r') {
        }
        else if ((ch != '\n') && (current_line_end < MAX_CMD_LINE)) {
            current_line[current_line_end++] = ch;
            current_line[current_line_end] = '\0';
            Serial.print(ch);
            continue;
        }
        if (current_line_end == 0) {
            continue;
        }

        Serial.println();
        cmd.do_dispatch(current_line);
        current_line[0] = '\0';
        current_line_end = 0;
    }
}

bool no_reading_errors() {
    bool one_plus_sensors = false;
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        if (rb1wtemps[i].has_error) {
            return false;
        }
        if (rb1wtemps[i].has_address) {
            one_plus_sensors = true;
        }
    }
    if (one_plus_sensors) {
        return true;
    }
    return false;
}

void do_test_led() {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].set_red(0);
        rb1wtemps[i].set_blue(false);
    }
    Serial.println(F("fade all in/out red"));
    for (int r = 0; r < 255; r = r + 8) {
        for (uint8_t i = 0; i < MAX_SENSORS; i++) {
            rb1wtemps[i].set_red(r);
        }
        delay(30);
    }
    delay(500);
    for (int r = 255; r > 16; r = r - 8) {
        for (uint8_t i = 0; i < MAX_SENSORS; i++) {
            rb1wtemps[i].set_red(r);
        }
        delay(30);
    }
    delay(500);

    Serial.println(F("blink red"));
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].set_red(255);
        Serial.print(F(" red "));
        Serial.println(i+1);
        delay(500);
        rb1wtemps[i].set_red(false);
        delay(100);
    }
    delay(500);

    Serial.println(F("LED test."));
    Serial.println(F("blink blue"));
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].set_blue(true);
        Serial.print(F(" blue "));
        Serial.println(i+1);
        delay(500);
        rb1wtemps[i].set_blue(false);
        delay(100);
    }
    delay(500);
}

void refresh_one_wire() {
    sensors.begin();
    uint8_t temp_sensors_count = sensors.getDeviceCount();
    for (uint8_t i = 0;i<temp_sensors_count;i++) {
        DeviceAddress found_sensor;
        sensors.getAddress(found_sensor,i);

        // check for known sensors and free sensor slots
        int sensor_idx = -1;
        int free_slot_idx = -1;
        for (uint8_t known_i = 0; known_i < MAX_SENSORS; known_i++) {
            if (rb1wtemps[known_i].has_address) {
                if (memcmp(rb1wtemps[known_i].address, found_sensor, sizeof(DeviceAddress)) == 0) {
                    sensor_idx = known_i;
                    break;
                }
            }
            else if (free_slot_idx == -1) {
                free_slot_idx = known_i;
            }
        }

        // save and use new found sensor
        if ((sensor_idx == -1) && (free_slot_idx != -1)) {
            Serial.print(F("new sensor found, storing at: "));
            Serial.println(free_slot_idx);
            rb1wtemps[free_slot_idx].set_address(found_sensor);
            uint8_t base = strlen(MAGIC)+sizeof(config)+(1+sizeof(DeviceAddress))*free_slot_idx;
            EEPROM.write(base, 1);
            for (uint8_t si = 0; si < sizeof(DeviceAddress); si++) {
                EEPROM.write(base+si+1, rb1wtemps[free_slot_idx].address[si]);
            }
        }
    }
}

String uint8_tToString (uint8_t num) {
    if (num < 16) {
        return String("0"+String(num, HEX));
    }
    else {
        return String(num, HEX);
    }
}

void cmd_forget(uint8_t argc, char* argv[]) {
    if (argc < 2) {
        return;
    }
    uint8_t idx = String(argv[1]).toInt();
    if (!idx || (idx > MAX_SENSORS)) {
        return;
    }
    rb1wtemps[idx-1].reset_address();
    uint8_t base = strlen(MAGIC)+sizeof(config)+(1+sizeof(DeviceAddress))*(idx-1);
    EEPROM.write(base, 0);
    Serial.print(F("temp address "));
    Serial.print(idx);
    Serial.println(F(" forgotten"));
}

void cmd_tled(uint8_t argc, char* argv[]) {
    uint8_t loops = 1;
    if (argc > 1) {
        loops = String(argv[1]).toInt();
    }
    for (uint8_t i=1; i <= loops; i++) {
        Serial.print(F("testing "));
        Serial.print(i);
        Serial.print(F("/"));
        Serial.println(loops);
        do_test_led();
    }
    delay(1000);
}

void cmd_help(uint8_t argc, char* argv[]) {
    Serial.println(MAGIC);
    Serial.println(F("supported commands:"));
    Serial.println(F("  temp            - show temperatures from all sensors"));
    Serial.println(F("  forget idx      - forget sensor on position idx"));
    Serial.println(F("  info            - show sram usage and configuration"));
    Serial.println(F("  set i2c [num]   - set i2c address (0x18 is default)"));
    Serial.println(F("  tled [num]      - do led blink test num times (1 is default)"));
    Serial.println(F("  help/?          - print this help"));
}

void cmd_temp(uint8_t argc, char* argv[]) {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        Serial.print(F("sensor "));
        Serial.print(i+1);
        Serial.print(F("/"));
        Serial.print(MAX_SENSORS);
        if (rb1wtemps[i].has_address) {
            Serial.print(F(" ["));
            for (uint8_t i2 = 0;i2<8;i2++) {
                Serial.print(uint8_tToString(rb1wtemps[i].address[i2]));
            }
            Serial.print(F("]: "));
            if (rb1wtemps[i].has_error) {
                Serial.println(F("ERROR"));
            }
            else {
                Serial.print(int(rb1wtemps[i].temp_c));
                Serial.print(F("."));
                Serial.print(int(rb1wtemps[i].temp_c*10)-(int(rb1wtemps[i].temp_c)*10));
                Serial.print(F(" "));
                Serial.print(char(0xB0));
                Serial.println(F("C"));
            }
        }
        else {
            Serial.println(F(": n/a"));
        }
    }
}

void cmd_info(uint8_t argc, char* argv[]) {
    Serial.println(MAGIC);
    Serial.print(F("sram free: "));
    Serial.println(freeRam());
    Serial.println(F("current configuration:"));
    Serial.print(F("    i2c_addr: 0x"));
    Serial.println(String(config.i2c_addr, HEX));
}

void cmd_set_dispatch(uint8_t argc, char* argv[]) {
    if (argc < 2) {
        return;
    }
    cmd_set.set_argv(argc-1, argv+1);
    cmd_set.do_dispatch();
}

void cmd_set_i2c(uint8_t argc, char* argv[]) {
    uint32_t new_i2c_addr = DFT_I2C_ADDR;
    if (argc > 1) {
        if ((argv[1][0] == '0') && (argv[1][1] == 'x')) {
            new_i2c_addr = 0;
            for (uint8_t i = 2; i < strlen(argv[1]); i++) {
                new_i2c_addr = new_i2c_addr*0x10 + hex_char_to_int(argv[1][i]);
            }
        }
        else {
            new_i2c_addr = String(argv[1]).toInt();
        }
    }
    if ((new_i2c_addr < 0x0E) || (new_i2c_addr > 0x7F)) {
        Serial.print(F("i2c address 0x"));
        Serial.print(String(new_i2c_addr, HEX));
        Serial.println(F(" invalid, must be greater then 0x0E and smaller then 0x7F"));
        return;
    }
    Serial.print(F("setting i2c address to: 0x"));
    Serial.println(String(new_i2c_addr, HEX));
    if (config.i2c_addr != new_i2c_addr) {
        config.i2c_addr = new_i2c_addr;
        EEPROM.write(strlen(MAGIC)+0, config.i2c_addr);
        Wire.begin(config.i2c_addr);
    }
}

void i2c_request() {
    if (i2c_register == 0x60) {
        Wire.write(MAX_SENSORS);
    }
    else if ((i2c_register >= 0x60+1) && (i2c_register <= 0x60+MAX_SENSORS)) {
        uint8_t idx = i2c_register - 0x60 - 1;
        to_send_reg0[0] = rb1wtemps[idx].has_error;
        to_send_reg0[1] = rb1wtemps[idx].has_address;
        memcpy(
            &to_send_reg0[2],
            &rb1wtemps[idx].temp_c,
            sizeof(float)
        );
        memcpy(
            &to_send_reg0[2+sizeof(float)],
            &rb1wtemps[idx].address,
            sizeof(rb1wtemps[idx].address)
        );
        Wire.write((uint8_t*)to_send_reg0, sizeof(to_send_reg0));
    }
    else {
        Wire.write(0xff);
    }
}

void i2c_receive(int num_bytes) {
    while (Wire.available()) {
        i2c_register = Wire.read();
    }
}

int freeRam () {
  extern int __heap_start, *__brkval;
  int v;
  return (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);
}

uint8_t hex_char_to_int(char digit_char) {
    if ((digit_char >= '0') && (digit_char <= '9')) {
        return digit_char - '0';
    }
    if ((digit_char >= 'a') && (digit_char <= 'f')) {
        return 10+(digit_char - 'a');
    }
    if ((digit_char >= 'A') && (digit_char <= 'F')) {
        return 10+(digit_char - 'A');
    }
    return 0;
}
