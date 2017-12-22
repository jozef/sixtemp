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

void setup () {
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].init(ntemp_pins[i].red, ntemp_pins[i].blue,sensors);
        rb1wtemps[i].refresh(0);
    }

    pinMode(ALARM_PIN, OUTPUT);

    Serial.begin(9600);

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

    // do_test_led();

    // re-read sensor addresses
    if (tick++ % 10 == 0) {
        refresh_one_wire();
    }

    // update temperatures
    for (uint8_t i = 0; i < MAX_SENSORS; i++) {
        rb1wtemps[i].refresh(tick);
    }

    delay(100);
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
