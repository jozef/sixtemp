/*
  sixtemp_sensor.ino - read up to six 1-wire temperature sensors using Arduino
                       and show their status using R(G)B led
  (see below for documentation)
*/

#include <Arduino.h>
#include <Wire.h>
#include <OneWire.h>
#include <EEPROM.h>
#include <DallasTemperature.h>
#include <UpTime.h>             // https://github.com/jozef/Arduino-Uptime
#include "RB1WTemp.h"
#include <TextCMD.h>            // https://github.com/jozef/Arduino-TextCMD

const char MAGIC[] = "6temp 0.03";

// temperature vars
#define ONE_WIRE_BUS A1    // data one wire port A1
#define TEMPERATURE_PRECISION 12
#define MAX_SENSORS 6
const bool non_verbose = false;
const bool be_verbose = true;
const bool update_temp_leds = false;
const bool update_leds_only = true;
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);

#define DFT_I2C_ADDR 0x18
struct sixtemp_config {
    uint8_t i2c_addr;
    bool led_on;
    uint8_t future_conf[30];
};
uint8_t i2c_register = 0;

sixtemp_config config = {
    DFT_I2C_ADDR,    // i2c_addr
    true,            // led_on
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  // place-holder for future config options
};

DeviceAddress temp_sensors[MAX_SENSORS];

#define MAX_CMD_LINE 0x1F
uint8_t current_line_end = 0;
char current_line[MAX_CMD_LINE+1];

struct ntemp_pin {
    uint8_t red;
    uint8_t blue;
};
ntemp_pin ntemp_pins[] = {
    { 3, 2 },
    { 5, 4 },
    { 6, 7 },
    { 9, 8 },
    { 11, A0 },
    { 10, 12 }
};

RB1WTemp rb1wtemps[MAX_SENSORS];

char to_send_reg0[2+sizeof(rb1wtemps[0].tdeg)+sizeof(DeviceAddress)];

#define ALARM_R_PIN A3
#define ALARM_B_PIN A2
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
        "cfg reset",
        &cmd_cfg_reset
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
        "set i2c",
        &cmd_set_i2c
    },
    {
        "led",
        &cmd_led
    },
    {
        "tled",
        &cmd_tled
    }
};

TextCMD cmd((sizeof(commands)/sizeof(commands[0])),commands);

const uint8_t refresh_interval = 20;
const uint8_t lookup_interval = 60;
unsigned long inactivity_ts = 0;
unsigned long next_refresh_ts = 0;
unsigned long next_lookup_ts = 0;

void setup () {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].init(ntemp_pins[i].red, ntemp_pins[i].blue,sensors);
    }

    pinMode(ALARM_R_PIN, OUTPUT);
    pinMode(ALARM_B_PIN, OUTPUT);

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
    Serial.print(F("> "));

    Wire.begin(config.i2c_addr);
    Wire.onRequest(i2c_request);
    Wire.onReceive(i2c_receive);
}

uint8_t blink_idx = 0;
uint8_t blink_value = 1;

unsigned long tick = 0;

void loop () {
    unsigned long cur_uptime = uptime();

    // blink alarm on error
    if (no_reading_errors()) {
        digitalWrite(ALARM_R_PIN, 0);
        digitalWrite(ALARM_B_PIN, 0);
    }
    else {
        digitalWrite(ALARM_R_PIN, (alarm_value ? 1 : 0));
        digitalWrite(ALARM_B_PIN, (alarm_value ? 1 : 0));
        alarm_value = !alarm_value;
        update_temperatures(non_verbose, update_leds_only);
    }

    // re-read sensor addresses every minute
    if (next_lookup_ts < cur_uptime) {
        next_lookup_ts += lookup_interval;
        if (inactivity_ts < cur_uptime) {
            refresh_one_wire();
        }
    }
    if (next_refresh_ts < cur_uptime) {
        next_refresh_ts += refresh_interval;
        if (inactivity_ts < cur_uptime) {
            update_temperatures(non_verbose, update_temp_leds);
        }
    }

    if (inactivity_ts < cur_uptime) {
        delay(250);
    }

    while (Serial.available()) {
        static char prev_ch = 0;
        inactivity_ts = cur_uptime + 10;
        char ch = Serial.read();
        if (ch == '\b') {
            if (current_line_end) {
                Serial.print(F("\b \b"));
                current_line_end--;
                current_line[current_line_end] = '\0';
            }
        }
        else if ((ch == '\n') || (ch == '\r')) {
            if (ch == '\n' && (prev_ch == '\r')) {
                break;
            }
            Serial.println();
            if (current_line_end != 0) {
                int8_t cmd_ret = cmd.do_dispatch(current_line);
                switch (cmd_ret) {
                    case -1: Serial.println(F("unknown command or syntax error. send '?' for help")); break;
                }
                Serial.println();
            }
            Serial.print(F("> "));
            current_line[0] = '\0';
            current_line_end = 0;
        }
        else {
            if (current_line_end < MAX_CMD_LINE) {
                current_line[current_line_end++] = ch;
                current_line[current_line_end] = '\0';
                Serial.print(ch);
            }
        }
        prev_ch = ch;
    }
}

void update_temperatures(bool verbose, bool leds_only) {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        if (verbose) {
            Serial.print('.');
        }
        rb1wtemps[i].led_on = config.led_on;
        if (leds_only) {
            rb1wtemps[i].update_led_color(uptime());
        }
        else {
            rb1wtemps[i].refresh(uptime());
        }
    }
    if (verbose) {
        Serial.println();
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
    digitalWrite(ALARM_R_PIN, false);
    digitalWrite(ALARM_B_PIN, false);

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
    digitalWrite(ALARM_R_PIN, true);
    Serial.println(F(" red alarm"));
    delay(500);
    digitalWrite(ALARM_R_PIN, false);
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
    digitalWrite(ALARM_B_PIN, true);
    Serial.println(F(" blue alarm"));
    delay(500);
    digitalWrite(ALARM_B_PIN, false);
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
            Serial.println(free_slot_idx+1);
            Serial.println(F("> "));
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

int8_t cmd_forget(uint8_t argc, const char* argv[]) {
    if (argc < 2) {
        return -1;
    }
    uint8_t idx = String(argv[1]).toInt();
    if (!idx || (idx > MAX_SENSORS)) {
        Serial.print(F("failed, max sensors count is "));
        Serial.println(MAX_SENSORS);
        return 1;
    }
    rb1wtemps[idx-1].reset_address();
    uint8_t base = strlen(MAGIC)+sizeof(config)+(1+sizeof(DeviceAddress))*(idx-1);
    EEPROM.write(base, 0);
    Serial.print(F("temp address "));
    Serial.print(idx);
    Serial.println(F(" forgotten"));
    return 0;
}

int8_t cmd_tled(uint8_t argc, const char* argv[]) {
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
    return 0;
}

int8_t cmd_led(uint8_t argc, const char* argv[]) {
    if (argc < 2) {
        return -1;
    }
    if (strcmp(argv[1],"on")) {
        config.led_on = false;
    }
    else if (strcmp(argv[1],"off")) {
        config.led_on = true;
    }

    uint8_t base = strlen(MAGIC)+1;
    if (EEPROM.read(base) != config.led_on) {
        EEPROM.write(base, config.led_on);
        Serial.print(F("led set to "));
        if (config.led_on) {
            Serial.println(F("on"));
        }
        else {
            Serial.println(F("off"));
        }
    }
    return 0;
}

int8_t cmd_help(uint8_t argc, const char* argv[]) {
    Serial.println(MAGIC);
    Serial.println(F("supported commands:"));
    Serial.println(F("  temp            - show temperatures from all sensors"));
    Serial.println(F("  forget idx      - forget sensor on position idx"));
    Serial.println(F("  led on/off      - turn all led temperature indication on or off"));
    Serial.println(F("  info            - show sram usage and configuration"));
    Serial.println(F("  set i2c [num]   - set i2c address (0x18 is default)"));
    Serial.println(F("  tled [num]      - do led blink test num times (1 is default)"));
    Serial.println(F("  cfg reset       - factory reset configuration"));
    Serial.println(F("  help/?          - print this help"));
    return 0;
}

int8_t cmd_temp(uint8_t argc, const char* argv[]) {
    refresh_one_wire();
    update_temperatures(be_verbose, update_temp_leds);
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
                Serial.print(rb1wtemps[i].tdeg/10);
                Serial.print(F("."));
                Serial.print(abs(rb1wtemps[i].tdeg % 10));
                Serial.print(F(" "));
                Serial.println(F("C"));
            }
        }
        else {
            Serial.println(F(": n/a"));
        }
    }
    return 0;
}

int8_t cmd_info(uint8_t argc, const char* argv[]) {
    Serial.println(MAGIC);
    Serial.print(F("sram free: "));
    Serial.println(freeRam());
    Serial.print(F("uptime: "));
    Serial.println(uptime_as_string());
    Serial.println(F("current configuration:"));
    Serial.print(F("    i2c_addr: 0x"));
    Serial.println(String(config.i2c_addr, HEX));
    Serial.print(F("    i2c_register: 0x"));
    Serial.println(String(i2c_register, HEX));
    if (!config.led_on) {
        Serial.println(F("    led indication: off"));
    }
    return 0;
}

int8_t cmd_set_i2c(uint8_t argc, const char* argv[]) {
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
        return 1;
    }
    Serial.print(F("setting i2c address to: 0x"));
    Serial.println(String(new_i2c_addr, HEX));
    if (config.i2c_addr != new_i2c_addr) {
        config.i2c_addr = new_i2c_addr;
        EEPROM.write(strlen(MAGIC)+0, config.i2c_addr);
        Wire.begin(config.i2c_addr);
    }
    return 0;
}

void i2c_request() {
    if (i2c_register == 0x60) {
        uint8_t count = 0;
        for (uint8_t i = 0; i < MAX_SENSORS; i++) {
            if (rb1wtemps[i].has_address) {
                count++;
            }
        }
        Wire.write(count);
    }
    else if (i2c_register == 0x01) {
        Wire.write(config.led_on);
    }
    else if ((i2c_register >= 0x60+1) && (i2c_register <= 0x60+MAX_SENSORS)) {
        uint8_t idx = i2c_register - 0x60 - 1;
        to_send_reg0[0] = rb1wtemps[idx].has_error;
        to_send_reg0[1] = rb1wtemps[idx].has_address;
        memcpy(
            &to_send_reg0[2],
            &rb1wtemps[idx].tdeg,
            sizeof(rb1wtemps[idx].tdeg)
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
    while (num_bytes--) {
        if (i2c_register == 0x21) {
            config.led_on = Wire.read();
            i2c_register = 0x01;
            next_refresh_ts = uptime();
        }
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

int8_t cmd_cfg_reset(uint8_t argc, const char* argv[]) {
    EEPROM.write(0, 0);
    Serial.print(F("magic cleared, now doing reset"));
    void (*do_reset)(void) = 0;
    do_reset();
    return 0;
}

/*

=head1 NAME

sixtemp_sensor.ino - read up to six 1-wire temperature sensors using Arduino and show their status using R(G)B led

=head1 SYNOPSIS

See L<https://github.com/jozef/sixtemp_i2c> for example and usage.

=head1 DESCRIPTION

Arduino based sensor that can read up to six 1-wire DS18B20 temperatures.
Temperature sensors addresses are permanently stored in eeprom so that
same positions are assigned between power-cycles. It provides the
temperature readings via I2C interface and it also shows the temperature
using 6xred-blue leds.

It's work-in-progress -> will provide more description & images later on.

=head1 I2C CLIENT

Connected to I2C, by default, responds on 0x18 address.

First I2C master has to send one byte which is the read/write address. Addresses are:

    0x01        led on/off bool flag
    0x21        set led on/off flag. second byte is flag value
    0x60        read 1 byte with number of sensors
    0x61..0x66  read 14 bytes of sensor 1..6 data:
                    struct sixtemp_sensor {
                        bool has_error;
                        bool has_address;
                        int16_t tdeg;
                        char address[8];
                    };

=head1 SERIAL INTERFACE

Using Arduino serial port:

    $ minicom --device /dev/ttyUSB1
    eeprom magic found: 6temp 0.02

^^^ start-up message in case if sensors and configuration was read
successfully from eeprom.

=head2 help/?

Prints version and available commands:

    > ?
    6temp 0.02
    supported commands:
      temp            - show temperatures from all sensors
      forget idx      - forget sensor on position idx
      info            - show sram usage and configuration
      set i2c [num]   - set i2c address (0x18 is default)
      tled [num]      - do led blink test num times (1 is default)
      help/?          - print this help

=head2 info

Prints version and debug/info:

    > info
    6temp 0.02
    sram free: 1158
    current configuration:
        i2c_addr: 0x18
        i2c_register: 0x0

=head2 temp

Prints all available temparature sensor readings:

    > temp
    sensor 1/6 [286164122f910528]: ERROR
    sensor 2/6 [28ff3ff6a1160322]: 22.0 C
    sensor 3/6 [286164122e7c499a]: 24.0 C
    sensor 4/6 [286164122f88f163]: 24.0 C
    sensor 5/6 [28ffa59492160558]: ERROR
    sensor 6/6 [286164122f89682a]: 24.0 C

=head2 forget

Forget one temperature sensor:

    > forget 1
    temp address 1 forgotten

    > temp
    sensor 1/6: n/a
    sensor 2/6 [28ff3ff6a1160322]: 22.0 C
    sensor 3/6 [286164122e7c499a]: 24.0 C
    sensor 4/6 [286164122f88f163]: 24.0 C
    sensor 5/6 [28ffa59492160558]: ERROR
    sensor 6/6 [286164122f89682a]: 24.0 C

head2 set i2c

Change I2C client address:

    > set i2c 0x20
    setting i2c address to: 0x20

    > info
    6temp 0.02
    sram free: 1158
    current configuration:
        i2c_addr: 0x20
        i2c_register: 0x0

    > set i2c
    setting i2c address to: 0x18

=head2 tled

Will fade-in/out red leds and sequentially (1 to 6) blink with both red/blue
leds to test if all are wired correctly:

    > tled 2
    testing 1/2
    fade all in/out red
    blink red
     red 1
     red 2
     red 3
     red 4
     red 5
     red 6
    LED test.
    blink blue
     blue 1
     blue 2
     blue 3
     blue 4
     blue 5
     blue 6
    testing 2/2
    ...

=head1 INSTALL

Clone the repository folder into F<sketchbook/sixtemp_sensor> and upload to Arduino.

=head1 SEE ALSO

L<https://github.com/jozef/sixtemp_i2c>

=head1 TODO

    - info show number of errors per sensor

=head1 LICENSE

This is free software, licensed under the MIT License.

=head1 AUTHOR

    Jozef Kutej

=cut

*/
