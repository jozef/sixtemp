/*
  sixtemp.ino - read up to six temperature sensors using Arduino
                and show their status using RGB led

  Created by Jozef Kutej, 22 December 2017.
  Released into the public domain.
*/

#include <Arduino.h>
#include <Wire.h>
#include <OneWire.h>
#include <EEPROM.h>
#include <DallasTemperature.h>
#include "RB1WTemp.h"
#include "TextCMD.h"

const char MAGIC[] = "6temp 0.01\0";

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

DeviceAddress temp_sensors[MAX_SENSORS];

String current_line = "";

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
        "tled",
        &cmd_tled
    }
};

TextCMD cmd((sizeof(commands)/sizeof(commands[0])),commands);

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
        Serial.println("eeprom magic found");
        // read sensors addresses
        for (uint8_t i = 0; i < MAX_SENSORS; i++) {
            uint8_t base = strlen(MAGIC)+(1+sizeof(DeviceAddress))*i;
            rb1wtemps[i].has_address = EEPROM.read(base);
            for (uint8_t si = 0; si < sizeof(DeviceAddress); si++) {
                rb1wtemps[i].address[si] = EEPROM.read(base+1+si);
            }
        }
    }
    else {
        Serial.println("eeprom magic missmatch, doing init");
        // after magic, there is MAX_SENSORS of bool has_address and DeviceAddress
        // write magic
        for (uint8_t i=0; i<strlen(MAGIC); i++) {
            EEPROM.write(i,MAGIC[i]);
        }
        // zero out
        for (uint8_t i=strlen(MAGIC); i<(strlen(MAGIC)+MAX_SENSORS+MAX_SENSORS*sizeof(DeviceAddress)); i++) {
            EEPROM.write(i,0);
        }
    }
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
        else if (ch != '\n') {
            current_line += ch;
            Serial.print(ch);
            continue;
        }
        if (current_line.length() == 0) {
            continue;
        }

        Serial.println("");
        cmd.do_dispatch(current_line);
        current_line = "";
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
    Serial.println("fade all in/out red");
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

    Serial.println("blink red");
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].set_red(255);
        Serial.println(" red "+String(i+1));
        delay(500);
        rb1wtemps[i].set_red(false);
        delay(100);
    }
    delay(500);

    Serial.println("LED test.");
    Serial.println("blink blue");
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].set_blue(true);
        Serial.println(" blue "+String(i+1));
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
            Serial.println("new sensor found, storing at: "+String(free_slot_idx));
            rb1wtemps[free_slot_idx].set_address(found_sensor);
            uint8_t base = strlen(MAGIC)+(1+sizeof(DeviceAddress))*free_slot_idx;
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

void cmd_forget(uint8_t argc, String argv[]) {
    if (argc < 2) {
        return;
    }
    uint8_t idx = argv[1].toInt();
    if (!idx || (idx > MAX_SENSORS)) {
        return;
    }
    rb1wtemps[idx-1].reset_address();
    uint8_t base = strlen(MAGIC)+(1+sizeof(DeviceAddress))*(idx-1);
    EEPROM.write(base, 0);
    Serial.println("temp address "+String(idx)+" forgotten");
}

void cmd_tled(uint8_t argc, String argv[]) {
    uint8_t loops = 1;
    if (argc > 1) {
        loops = argv[1].toInt();
    }
    for (uint8_t i=1; i <= loops; i++) {
        Serial.println("led testing "+String(i)+"/"+String(loops));
        do_test_led();
    }
    delay(3000);
    Serial.println("done led testing");
}

void cmd_help(uint8_t argc, String argv[]) {
    Serial.println("supported commands:");
    Serial.println("    temp            - show temperatures from all sensors");
    Serial.println("    forget idx      - forget sensor on position idx");
    Serial.println("    tled [num]      - do led blink test num times (1 is default)");
    Serial.println("    help/?          - print this help");
}

void cmd_temp(uint8_t argc, String argv[]) {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        Serial.print("sensor "+String(i+1)+"/"+String(MAX_SENSORS));
        if (rb1wtemps[i].has_address) {
            Serial.print(" [");
            for (uint8_t i2 = 0;i2<8;i2++) {
                Serial.print(uint8_tToString(rb1wtemps[i].address[i2]));
            }
            Serial.print("]: ");
            if (rb1wtemps[i].has_error) {
                Serial.println("ERROR");
            }
            else {
                Serial.println(
                        String(int(rb1wtemps[i].temp_c))
                        +"."+String(int(rb1wtemps[i].temp_c*10)-(int(rb1wtemps[i].temp_c)*10))
                        +" "+char(0xB0)+"C"
                );
            }
        }
        else {
            Serial.println(": n/a");
        }
    }
}
