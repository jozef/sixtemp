/*
  RB1WTemp.h - Library for reading and showing temp via 1 wire and RGB led.
  Created by Jozef Kutej, 17 December 2017.
  Released into the public domain.
*/
#ifndef RB1WTemp_h
#define RB1WTemp_h

#include <Wire.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include "Arduino.h"

class RB1WTemp {
    public:
        bool has_error = false;
        bool has_address = false;
        float temp_c = -127;
        RB1WTemp();
        void init(uint8_t rpin, uint8_t bpin, DallasTemperature sensors);
        void refresh(unsigned long tick);
        void reset_address();
        void set_address(DeviceAddress new_address);
        void set_blue(bool blue);
        void set_red(uint8_t red);
        DeviceAddress address = {0,0,0,0,0,0,0,0};
    private:
        uint8_t _red_pin;
        uint8_t _blue_pin;
        DallasTemperature _sensors;
};

#endif
