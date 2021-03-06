EESchema Schematic File Version 4
LIBS:sixtemp_sensor-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0101
U 1 1 5C672DFC
P 4700 4350
F 0 "#PWR0101" H 4700 4100 50  0001 C CNN
F 1 "GND" H 4705 4177 50  0000 C CNN
F 2 "" H 4700 4350 50  0001 C CNN
F 3 "" H 4700 4350 50  0001 C CNN
	1    4700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3850 4700 3850
$Comp
L Connector:Conn_01x01_Female J8
U 1 1 5C6735DF
P 3350 3550
F 0 "J8" H 3244 3325 50  0000 C CNN
F 1 "1wire" H 3244 3416 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3350 3550 50  0001 C CNN
F 3 "~" H 3350 3550 50  0001 C CNN
	1    3350 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R101
U 1 1 5C67383A
P 4700 3700
F 0 "R101" H 4770 3746 50  0000 L CNN
F 1 "4k7" H 4770 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4630 3700 50  0001 C CNN
F 3 "~" H 4700 3700 50  0001 C CNN
	1    4700 3700
	1    0    0    -1  
$EndComp
Connection ~ 4700 3850
$Comp
L Device:R R61
U 1 1 5C67488C
P 4200 1600
F 0 "R61" V 3993 1600 50  0000 C CNN
F 1 "1k" V 4084 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 1600 50  0001 C CNN
F 3 "~" H 4200 1600 50  0001 C CNN
	1    4200 1600
	0    -1   1    0   
$EndComp
$Comp
L Device:R R62
U 1 1 5C674892
P 4200 2000
F 0 "R62" V 3993 2000 50  0000 C CNN
F 1 "1k" V 4084 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 2000 50  0001 C CNN
F 3 "~" H 4200 2000 50  0001 C CNN
	1    4200 2000
	0    -1   1    0   
$EndComp
Wire Wire Line
	5000 1600 5000 3050
Wire Wire Line
	5000 3050 5150 3050
Wire Wire Line
	4900 2000 4900 3250
Wire Wire Line
	4900 3250 5150 3250
Wire Wire Line
	4600 2500 4600 3150
Wire Wire Line
	4600 3150 4750 3150
Wire Wire Line
	5150 3450 4750 3450
Wire Wire Line
	4500 3450 4500 2900
$Comp
L Device:R R51
U 1 1 5C67F9F1
P 4200 2500
F 0 "R51" V 3993 2500 50  0000 C CNN
F 1 "1k" V 4084 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 2500 50  0001 C CNN
F 3 "~" H 4200 2500 50  0001 C CNN
	1    4200 2500
	0    -1   1    0   
$EndComp
$Comp
L Device:R R52
U 1 1 5C67F9F7
P 4200 2900
F 0 "R52" V 3993 2900 50  0000 C CNN
F 1 "1k" V 4084 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 2900 50  0001 C CNN
F 3 "~" H 4200 2900 50  0001 C CNN
	1    4200 2900
	0    -1   1    0   
$EndComp
Wire Wire Line
	4700 4050 4700 4350
$Comp
L Device:R R41
U 1 1 5C68BF5D
P 7350 1650
F 0 "R41" V 7143 1650 50  0000 C CNN
F 1 "1k" V 7234 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 1650 50  0001 C CNN
F 3 "~" H 7350 1650 50  0001 C CNN
	1    7350 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R42
U 1 1 5C68BF63
P 7350 2050
F 0 "R42" V 7143 2050 50  0000 C CNN
F 1 "1k" V 7234 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2050 50  0001 C CNN
F 3 "~" H 7350 2050 50  0001 C CNN
	1    7350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R31
U 1 1 5C68BF7E
P 7350 2550
F 0 "R31" V 7143 2550 50  0000 C CNN
F 1 "1k" V 7234 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2550 50  0001 C CNN
F 3 "~" H 7350 2550 50  0001 C CNN
	1    7350 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 5C68BF84
P 7350 2950
F 0 "R32" V 7143 2950 50  0000 C CNN
F 1 "1k" V 7234 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2950 50  0001 C CNN
F 3 "~" H 7350 2950 50  0001 C CNN
	1    7350 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 5C68E696
P 7350 3450
F 0 "R21" V 7143 3450 50  0000 C CNN
F 1 "1k" V 7234 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 3450 50  0001 C CNN
F 3 "~" H 7350 3450 50  0001 C CNN
	1    7350 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R22
U 1 1 5C68E69C
P 7350 3850
F 0 "R22" V 7143 3850 50  0000 C CNN
F 1 "1k" V 7234 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 3850 50  0001 C CNN
F 3 "~" H 7350 3850 50  0001 C CNN
	1    7350 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5C68E6AF
P 7350 4350
F 0 "R11" V 7143 4350 50  0000 C CNN
F 1 "1k" V 7234 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 4350 50  0001 C CNN
F 3 "~" H 7350 4350 50  0001 C CNN
	1    7350 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5C68E6B5
P 7350 4750
F 0 "R12" V 7143 4750 50  0000 C CNN
F 1 "1k" V 7234 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 4750 50  0001 C CNN
F 3 "~" H 7350 4750 50  0001 C CNN
	1    7350 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 3050 6700 3050
Wire Wire Line
	6700 3050 6700 1650
Wire Wire Line
	6550 3150 6800 3150
Wire Wire Line
	6800 3150 6800 2050
Wire Wire Line
	6550 3350 6950 3350
Wire Wire Line
	6950 3350 6950 2550
Wire Wire Line
	6550 3250 7050 3250
Wire Wire Line
	7050 3250 7050 2950
Wire Wire Line
	6550 3550 7050 3550
Wire Wire Line
	7050 3550 7050 3850
Wire Wire Line
	4350 2900 4500 2900
$Comp
L Device:Jumper JP6
U 1 1 5C6B160A
P 2100 1600
F 0 "JP6" H 2100 1773 50  0000 C CNN
F 1 "Jumper" H 2100 1773 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2100 1600 50  0001 C CNN
F 3 "~" H 2100 1600 50  0001 C CNN
	1    2100 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1600 4750 1600
Wire Wire Line
	4350 2000 4750 2000
Wire Wire Line
	4350 2500 4600 2500
Wire Wire Line
	3550 3550 4250 3550
Connection ~ 4700 3550
$Comp
L Device:LED_Dual_AACC D6
U 1 1 5C6F5674
P 2700 1700
F 0 "D6" H 2700 2125 50  0000 C CNN
F 1 "LED_Dual_AACC" H 2700 2034 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 2730 1700 50  0001 C CNN
F 3 "~" H 2730 1700 50  0001 C CNN
	1    2700 1700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C710314
P 1750 1700
F 0 "#PWR0104" H 1750 1450 50  0001 C CNN
F 1 "GND" H 1755 1527 50  0000 C CNN
F 2 "" H 1750 1700 50  0001 C CNN
F 3 "" H 1750 1700 50  0001 C CNN
	1    1750 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5C71A531
P 1750 1350
F 0 "#PWR0106" H 1750 1200 50  0001 C CNN
F 1 "+5V" H 1765 1523 50  0000 C CNN
F 2 "" H 1750 1350 50  0001 C CNN
F 3 "" H 1750 1350 50  0001 C CNN
	1    1750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5C71A91C
P 4450 3850
F 0 "#PWR0108" H 4450 3700 50  0001 C CNN
F 1 "+5V" H 4465 4023 50  0000 C CNN
F 2 "" H 4450 3850 50  0001 C CNN
F 3 "" H 4450 3850 50  0001 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3850 4700 3850
Text GLabel 4000 3400 0    50   Input ~ 0
1wire
Wire Wire Line
	4000 3400 4250 3400
Wire Wire Line
	4250 3400 4250 3550
Connection ~ 4250 3550
Wire Wire Line
	4250 3550 4700 3550
Wire Wire Line
	4700 3550 5150 3550
Text GLabel 1200 1300 2    50   Input ~ 0
1wire
$Comp
L Device:Jumper JP5
U 1 1 5C738FA0
P 2100 2700
F 0 "JP5" H 2100 2873 50  0000 C CNN
F 1 "Jumper" H 2100 2873 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2100 2700 50  0001 C CNN
F 3 "~" H 2100 2700 50  0001 C CNN
	1    2100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D5
U 1 1 5C738FA6
P 2700 2600
F 0 "D5" H 2700 3025 50  0000 C CNN
F 1 "LED_Dual_AACC" H 2700 2934 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 2730 2600 50  0001 C CNN
F 3 "~" H 2730 2600 50  0001 C CNN
	1    2700 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 2900 3000 2700
$Comp
L Device:Jumper JP4
U 1 1 5C740F91
P 9450 1650
F 0 "JP4" H 9450 1823 50  0000 C CNN
F 1 "Jumper" H 9450 1823 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 1650 50  0001 C CNN
F 3 "~" H 9450 1650 50  0001 C CNN
	1    9450 1650
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D4
U 1 1 5C740F97
P 8850 1750
F 0 "D4" H 8850 2175 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 2084 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 1750 50  0001 C CNN
F 3 "~" H 8880 1750 50  0001 C CNN
	1    8850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2050 8550 1850
Wire Wire Line
	6700 1650 7150 1650
Wire Wire Line
	6800 2050 7150 2050
Wire Wire Line
	6950 2550 7150 2550
Wire Wire Line
	7050 2950 7150 2950
Wire Wire Line
	6550 3450 7150 3450
Wire Wire Line
	7050 3850 7150 3850
$Comp
L Device:Jumper JP3
U 1 1 5C76956C
P 9450 2750
F 0 "JP3" H 9450 2923 50  0000 C CNN
F 1 "Jumper" H 9450 2923 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 2750 50  0001 C CNN
F 3 "~" H 9450 2750 50  0001 C CNN
	1    9450 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D3
U 1 1 5C769573
P 8850 2650
F 0 "D3" H 8850 3075 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 2984 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 2650 50  0001 C CNN
F 3 "~" H 8880 2650 50  0001 C CNN
	1    8850 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 5C76CA96
P 9450 3650
F 0 "JP2" H 9450 3823 50  0000 C CNN
F 1 "Jumper" H 9450 3823 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 3650 50  0001 C CNN
F 3 "~" H 9450 3650 50  0001 C CNN
	1    9450 3650
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D2
U 1 1 5C76CA9D
P 8850 3750
F 0 "D2" H 8850 4175 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 4084 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 3750 50  0001 C CNN
F 3 "~" H 8880 3750 50  0001 C CNN
	1    8850 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5C770B64
P 9450 4750
F 0 "JP1" H 9450 4923 50  0000 C CNN
F 1 "Jumper" H 9450 4923 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 4750 50  0001 C CNN
F 3 "~" H 9450 4750 50  0001 C CNN
	1    9450 4750
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D1
U 1 1 5C770B6B
P 8850 4650
F 0 "D1" H 8850 5075 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 4984 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 4650 50  0001 C CNN
F 3 "~" H 8880 4650 50  0001 C CNN
	1    8850 4650
	1    0    0    -1  
$EndComp
Text GLabel 1350 6350 0    50   Input ~ 0
SDA
Text GLabel 1350 6550 0    50   Input ~ 0
SCL
Wire Wire Line
	1350 6350 1450 6350
Wire Wire Line
	1350 6550 1450 6550
Text GLabel 5850 1600 1    50   Input ~ 0
SCL
Text GLabel 5950 1600 1    50   Input ~ 0
SDA
Text GLabel 1350 5850 0    50   Input ~ 0
RAW
Wire Wire Line
	1350 5850 1550 5850
$Comp
L power:+5V #PWR0127
U 1 1 5C78FC03
P 1350 5550
F 0 "#PWR0127" H 1350 5400 50  0001 C CNN
F 1 "+5V" H 1365 5723 50  0000 C CNN
F 2 "" H 1350 5550 50  0001 C CNN
F 3 "" H 1350 5550 50  0001 C CNN
	1    1350 5550
	1    0    0    -1  
$EndComp
Text GLabel 5050 4150 0    50   Input ~ 0
RAW
Wire Wire Line
	1550 5750 1500 5750
Wire Wire Line
	950  5750 950  5800
Wire Wire Line
	2750 5250 3150 5250
Wire Wire Line
	3150 5250 3150 5300
$Comp
L power:GND #PWR0128
U 1 1 5C7AFAE8
P 3150 5300
F 0 "#PWR0128" H 3150 5050 50  0001 C CNN
F 1 "GND" H 3155 5127 50  0000 C CNN
F 2 "" H 3150 5300 50  0001 C CNN
F 3 "" H 3150 5300 50  0001 C CNN
	1    3150 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5C7AFB78
P 950 5800
F 0 "#PWR0129" H 950 5550 50  0001 C CNN
F 1 "GND" H 955 5627 50  0000 C CNN
F 2 "" H 950 5800 50  0001 C CNN
F 3 "" H 950 5800 50  0001 C CNN
	1    950  5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2750 6050 2650
Wire Wire Line
	6050 2650 6300 2650
$Comp
L power:GND #PWR0130
U 1 1 5C7C50B0
P 6300 2650
F 0 "#PWR0130" H 6300 2400 50  0001 C CNN
F 1 "GND" H 6305 2477 50  0000 C CNN
F 2 "" H 6300 2650 50  0001 C CNN
F 3 "" H 6300 2650 50  0001 C CNN
	1    6300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5C7C5150
P 6900 4900
F 0 "#PWR0131" H 6900 4650 50  0001 C CNN
F 1 "GND" H 6905 4727 50  0000 C CNN
F 2 "" H 6900 4900 50  0001 C CNN
F 3 "" H 6900 4900 50  0001 C CNN
	1    6900 4900
	1    0    0    -1  
$EndComp
$Comp
L Arduino_Shields:Arduino_Uno_Black U2
U 1 1 5C778017
P 2150 5900
F 0 "U2" H 2150 6915 50  0000 C CNN
F 1 "Arduino_Uno_Black" H 2150 6824 50  0000 C CNN
F 2 "Arduino_Shields:Arduino_Uno_Black_2rows" H 2150 6100 50  0001 C CNN
F 3 "" H 2150 6100 50  0001 C CNN
	1    2150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5550 1550 5550
$Comp
L Device:Jumper JP99
U 1 1 5C89834F
P 9450 5900
F 0 "JP99" H 9450 6073 50  0000 C CNN
F 1 "Jumper" H 9450 6073 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 5900 50  0001 C CNN
F 3 "~" H 9450 5900 50  0001 C CNN
	1    9450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5C898355
P 9150 5900
F 0 "#PWR0132" H 9150 5650 50  0001 C CNN
F 1 "GND" H 9155 5727 50  0000 C CNN
F 2 "" H 9150 5900 50  0001 C CNN
F 3 "" H 9150 5900 50  0001 C CNN
	1    9150 5900
	1    0    0    -1  
$EndComp
Text GLabel 9900 5900 2    50   Input ~ 0
en_all_led
Wire Wire Line
	9750 5900 9900 5900
Text GLabel 9700 2200 2    50   Input ~ 0
en_all_led
Connection ~ 9150 2750
Wire Wire Line
	9150 2550 9150 2750
Connection ~ 9150 1650
Wire Wire Line
	9150 1650 9150 1850
Connection ~ 9150 3650
Wire Wire Line
	9150 3650 9150 3850
Connection ~ 9150 4750
Wire Wire Line
	9150 4550 9150 4750
Wire Wire Line
	9550 2200 9700 2200
Text GLabel 1800 2150 0    50   Input ~ 0
en_all_led
Wire Wire Line
	1800 2150 2000 2150
Wire Wire Line
	2000 2150 2000 2350
Connection ~ 2400 1600
Wire Wire Line
	2400 1600 2400 1800
Wire Wire Line
	2400 1950 2400 1800
Connection ~ 2400 1800
Wire Wire Line
	2000 1950 2000 2150
Connection ~ 2000 2150
Connection ~ 9550 2200
Wire Wire Line
	9550 2200 9550 2400
Wire Wire Line
	9550 2000 9550 2200
Text GLabel 9700 4200 2    50   Input ~ 0
en_all_led
Wire Wire Line
	9550 4200 9700 4200
Connection ~ 9550 4200
Wire Wire Line
	9550 4200 9550 4400
Wire Wire Line
	9550 4000 9550 4200
Wire Wire Line
	9150 2000 9150 1850
Connection ~ 9150 1850
Wire Wire Line
	9150 2400 9150 2550
Connection ~ 9150 2550
Wire Wire Line
	9150 4000 9150 3850
Connection ~ 9150 3850
Wire Wire Line
	9150 4550 9150 4400
Connection ~ 9150 4550
$Comp
L Device:D D69
U 1 1 5CA426C5
P 2200 1950
F 0 "D69" H 2200 2166 50  0000 C CNN
F 1 "D" H 2200 2075 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2200 1950 50  0001 C CNN
F 3 "~" H 2200 1950 50  0001 C CNN
	1    2200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1950 2400 1950
Wire Wire Line
	2050 1950 2000 1950
$Comp
L Device:D D59
U 1 1 5CA5F0DA
P 2200 2350
F 0 "D59" H 2200 2566 50  0000 C CNN
F 1 "D" H 2200 2475 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2200 2350 50  0001 C CNN
F 3 "~" H 2200 2350 50  0001 C CNN
	1    2200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2350 2400 2350
Wire Wire Line
	2050 2350 2000 2350
$Comp
L Device:D D49
U 1 1 5CA6FD1E
P 9350 2000
F 0 "D49" H 9350 1784 50  0000 C CNN
F 1 "D" H 9350 1875 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 2000 50  0001 C CNN
F 3 "~" H 9350 2000 50  0001 C CNN
	1    9350 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:D D39
U 1 1 5CA80C1E
P 9350 2400
F 0 "D39" H 9350 2184 50  0000 C CNN
F 1 "D" H 9350 2275 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 2400 50  0001 C CNN
F 3 "~" H 9350 2400 50  0001 C CNN
	1    9350 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:D D29
U 1 1 5CA80D25
P 9350 4000
F 0 "D29" H 9350 3784 50  0000 C CNN
F 1 "D" H 9350 3875 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 4000 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9350 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:D D19
U 1 1 5CA80DCD
P 9350 4400
F 0 "D19" H 9350 4184 50  0000 C CNN
F 1 "D" H 9350 4275 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 4400 50  0001 C CNN
F 3 "~" H 9350 4400 50  0001 C CNN
	1    9350 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 4000 9200 4000
Wire Wire Line
	9500 4000 9550 4000
Wire Wire Line
	9550 4400 9500 4400
Wire Wire Line
	9200 4400 9150 4400
Wire Wire Line
	9150 2000 9200 2000
Wire Wire Line
	9500 2000 9550 2000
Wire Wire Line
	9550 2400 9500 2400
Wire Wire Line
	9200 2400 9150 2400
Wire Wire Line
	1550 6450 1450 6450
Wire Wire Line
	1450 6450 1450 6350
Connection ~ 1450 6350
Wire Wire Line
	1450 6350 1550 6350
Wire Wire Line
	1550 6650 1450 6650
Wire Wire Line
	1450 6650 1450 6550
Connection ~ 1450 6550
Wire Wire Line
	1450 6550 1550 6550
Wire Wire Line
	1550 5650 1500 5650
Wire Wire Line
	1500 5650 1500 5750
Connection ~ 1500 5750
Wire Wire Line
	1500 5750 950  5750
Wire Wire Line
	7000 3650 7000 4350
Wire Wire Line
	7000 4350 7150 4350
Wire Wire Line
	6550 3650 7000 3650
Wire Wire Line
	6950 3750 6950 4750
Wire Wire Line
	6950 4750 7150 4750
Wire Wire Line
	6550 3750 6950 3750
Wire Wire Line
	6900 4900 6900 4800
Wire Wire Line
	6550 3850 6900 3850
$Comp
L Arduino_Shields:Arduino_Pro_Mini_12_12_5_1 U1
U 1 1 5CB7CBA3
P 5850 3550
F 0 "U1" H 5850 2678 50  0000 C CNN
F 1 "Arduino_Pro_Mini_12_12_5_1" H 5850 2587 50  0000 C CNN
F 2 "Arduino_Shields:Shield_Arduino_Pro_Mini_12+12+5+1_pins" H 5850 3550 50  0001 C CNN
F 3 "https://www.aliexpress.com/item/New-Pro-Mini-atmega328-Board-5V-16M-Replace-ATmega128-For-Arduino-Compatible-Nano/2031903258.html" H 5850 3550 50  0001 C CNN
	1    5850 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Female J10
U 1 1 5CB7CCD0
P 7000 5500
F 0 "J10" H 6900 5800 50  0000 C CNN
F 1 "debug" H 6900 5900 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 7000 5500 50  0001 C CNN
F 3 "~" H 7000 5500 50  0001 C CNN
	1    7000 5500
	1    0    0    1   
$EndComp
Wire Wire Line
	6550 4250 6550 5700
Wire Wire Line
	6550 5700 6800 5700
Wire Wire Line
	6550 4150 6650 4150
Wire Wire Line
	6650 4150 6650 5600
Wire Wire Line
	6650 5600 6800 5600
Wire Wire Line
	6550 4050 6750 4050
Wire Wire Line
	6750 4050 6750 5500
Wire Wire Line
	6750 5500 6800 5500
Text GLabel 7150 1600 1    50   Input ~ 0
D9~~
Text GLabel 7150 2000 1    50   Input ~ 0
D8
Text GLabel 7150 2500 1    50   Input ~ 0
D6~~
Text GLabel 7150 2900 1    50   Input ~ 0
D7
Wire Wire Line
	7150 1600 7150 1650
Connection ~ 7150 1650
Wire Wire Line
	7150 1650 7200 1650
Wire Wire Line
	7150 2000 7150 2050
Connection ~ 7150 2050
Wire Wire Line
	7150 2050 7200 2050
Wire Wire Line
	7150 2500 7150 2550
Connection ~ 7150 2550
Wire Wire Line
	7150 2550 7200 2550
Wire Wire Line
	7150 2900 7150 2950
Connection ~ 7150 2950
Wire Wire Line
	7150 2950 7200 2950
$Comp
L Connector:Conn_01x12_Female J12
U 1 1 5C908D24
P 5700 750
F 0 "J12" V 5865 680 50  0000 C CNN
F 1 "Conn_01x12_Female" V 5774 680 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x12_P2.54mm_Vertical" H 5700 750 50  0001 C CNN
F 3 "~" H 5700 750 50  0001 C CNN
	1    5700 750 
	0    -1   -1   0   
$EndComp
Text GLabel 4750 1550 1    50   Input ~ 0
10_~SS~~
Text GLabel 5200 950  3    50   Input ~ 0
10_~SS~~
Text GLabel 4750 2050 3    50   Input ~ 0
12_MISO
Text GLabel 5300 950  3    50   Input ~ 0
12_MISO
Text GLabel 4750 3100 1    50   Input ~ 0
11_MISO~~
Text GLabel 5400 950  3    50   Input ~ 0
11_MISO~~
Text GLabel 4750 3400 1    50   Input ~ 0
A0
Text GLabel 5500 950  3    50   Input ~ 0
A0
Text GLabel 5600 950  3    50   Input ~ 0
D9~~
Text GLabel 5700 950  3    50   Input ~ 0
D8
Text GLabel 5800 950  3    50   Input ~ 0
D6~~
Text GLabel 5900 950  3    50   Input ~ 0
D7
Text GLabel 7150 3400 1    50   Input ~ 0
D5~~
Text GLabel 6000 950  3    50   Input ~ 0
D5~~
Text GLabel 7150 3800 1    50   Input ~ 0
D4
Text GLabel 6100 950  3    50   Input ~ 0
D4
Text GLabel 7150 4300 1    50   Input ~ 0
D3~~
Text GLabel 6200 950  3    50   Input ~ 0
D3~~
Text GLabel 7150 4700 1    50   Input ~ 0
D2
Text GLabel 6300 950  3    50   Input ~ 0
D2
Wire Wire Line
	7150 3400 7150 3450
Connection ~ 7150 3450
Wire Wire Line
	7150 3450 7200 3450
Wire Wire Line
	7150 3800 7150 3850
Connection ~ 7150 3850
Wire Wire Line
	7150 3850 7200 3850
Wire Wire Line
	7150 4300 7150 4350
Connection ~ 7150 4350
Wire Wire Line
	7150 4350 7200 4350
Wire Wire Line
	7150 4700 7150 4750
Connection ~ 7150 4750
Wire Wire Line
	7150 4750 7200 4750
Wire Wire Line
	4750 1550 4750 1600
Connection ~ 4750 1600
Wire Wire Line
	4750 1600 5000 1600
Wire Wire Line
	4750 2050 4750 2000
Connection ~ 4750 2000
Wire Wire Line
	4750 2000 4900 2000
Wire Wire Line
	4750 3100 4750 3150
Connection ~ 4750 3150
Wire Wire Line
	4750 3150 5150 3150
Wire Wire Line
	4750 3400 4750 3450
Connection ~ 4750 3450
Wire Wire Line
	4750 3450 4500 3450
Wire Wire Line
	4700 4050 5150 4050
Wire Wire Line
	5050 4150 5150 4150
$Comp
L Connector:Conn_01x07_Female J6
U 1 1 5CA19DA8
P 750 1500
F 0 "J6" H 644 1985 50  0000 C CNN
F 1 "1W/D_1" H 644 1894 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 750 1500 50  0001 C CNN
F 3 "~" H 750 1500 50  0001 C CNN
	1    750  1500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2000 3800 2000
Wire Wire Line
	3800 2000 3800 1800
Wire Wire Line
	950  1200 1050 1200
Wire Wire Line
	950  1300 1200 1300
Wire Wire Line
	950  1400 1750 1400
Wire Wire Line
	950  1500 2000 1500
Wire Wire Line
	2000 1500 2000 1100
Wire Wire Line
	950  1800 1150 1800
Wire Wire Line
	1150 1800 1150 1050
Wire Wire Line
	950  1600 1050 1600
Wire Wire Line
	1050 1600 1050 1200
Connection ~ 1050 1600
Wire Wire Line
	1050 1600 1750 1600
Wire Wire Line
	3000 2900 4050 2900
Wire Wire Line
	3000 2500 3200 2500
Wire Wire Line
	3000 1800 3150 1800
Wire Wire Line
	3000 1600 3100 1600
Wire Wire Line
	2000 1100 3100 1100
Wire Wire Line
	1150 1050 3150 1050
Wire Wire Line
	3150 1050 3150 1800
Connection ~ 3150 1800
Wire Wire Line
	3150 1800 3800 1800
Wire Wire Line
	3100 1100 3100 1600
Connection ~ 3100 1600
Wire Wire Line
	3100 1600 4050 1600
$Comp
L power:GND #PWR0102
U 1 1 5CB67546
P 1750 2750
F 0 "#PWR0102" H 1750 2500 50  0001 C CNN
F 1 "GND" H 1755 2577 50  0000 C CNN
F 2 "" H 1750 2750 50  0001 C CNN
F 3 "" H 1750 2750 50  0001 C CNN
	1    1750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 5CB6754C
P 1750 2450
F 0 "#PWR0103" H 1750 2300 50  0001 C CNN
F 1 "+5V" H 1765 2623 50  0000 C CNN
F 2 "" H 1750 2450 50  0001 C CNN
F 3 "" H 1750 2450 50  0001 C CNN
	1    1750 2450
	1    0    0    -1  
$EndComp
Text GLabel 1200 2400 2    50   Input ~ 0
1wire
$Comp
L Connector:Conn_01x07_Female J5
U 1 1 5CB67553
P 750 2600
F 0 "J5" H 644 3085 50  0000 C CNN
F 1 "1W/D_2" H 644 2994 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 750 2600 50  0001 C CNN
F 3 "~" H 750 2600 50  0001 C CNN
	1    750  2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	950  2300 1050 2300
Wire Wire Line
	950  2400 1200 2400
Wire Wire Line
	950  2500 1750 2500
Wire Wire Line
	950  2700 1050 2700
Wire Wire Line
	1050 2700 1050 2300
Connection ~ 1050 2700
Wire Wire Line
	1050 2700 1750 2700
Wire Wire Line
	950  2600 1350 2600
Wire Wire Line
	1350 2600 1350 3100
Wire Wire Line
	1350 3100 3200 3100
Wire Wire Line
	3200 3100 3200 2500
Connection ~ 3200 2500
Wire Wire Line
	3200 2500 4050 2500
Connection ~ 3000 2900
Wire Wire Line
	950  2900 3000 2900
Wire Wire Line
	1750 2700 1750 2750
Connection ~ 1750 2700
Wire Wire Line
	1750 2700 1800 2700
Wire Wire Line
	1750 1600 1750 1700
Connection ~ 1750 1600
Wire Wire Line
	1750 1600 1800 1600
Wire Wire Line
	1750 1350 1750 1400
Wire Wire Line
	1750 2450 1750 2500
$Comp
L power:GND #PWR0105
U 1 1 5CBFA852
P 9800 1750
F 0 "#PWR0105" H 9800 1500 50  0001 C CNN
F 1 "GND" H 9805 1577 50  0000 C CNN
F 2 "" H 9800 1750 50  0001 C CNN
F 3 "" H 9800 1750 50  0001 C CNN
	1    9800 1750
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5CBFA858
P 9800 1400
F 0 "#PWR0107" H 9800 1250 50  0001 C CNN
F 1 "+5V" H 9815 1573 50  0000 C CNN
F 2 "" H 9800 1400 50  0001 C CNN
F 3 "" H 9800 1400 50  0001 C CNN
	1    9800 1400
	-1   0    0    -1  
$EndComp
Text GLabel 10350 1350 0    50   Input ~ 0
1wire
$Comp
L Connector:Conn_01x07_Female J4
U 1 1 5CBFA85F
P 10800 1550
F 0 "J4" H 10694 2035 50  0000 C CNN
F 1 "1W/D_1" H 10694 1944 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 10800 1550 50  0001 C CNN
F 3 "~" H 10800 1550 50  0001 C CNN
	1    10800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1250 10500 1250
Wire Wire Line
	10600 1350 10350 1350
Wire Wire Line
	10600 1450 9800 1450
Wire Wire Line
	10600 1850 10400 1850
Wire Wire Line
	10600 1650 10500 1650
Wire Wire Line
	10500 1650 10500 1250
Connection ~ 10500 1650
Wire Wire Line
	10500 1650 9800 1650
Wire Wire Line
	9800 1650 9800 1750
Wire Wire Line
	9800 1400 9800 1450
Wire Wire Line
	7500 2050 8350 2050
Text Notes 10550 1550 0    50   ~ 0
R
Text Notes 10550 1850 0    50   ~ 0
B
$Comp
L power:GND #PWR0109
U 1 1 5CC40C16
P 9800 3750
F 0 "#PWR0109" H 9800 3500 50  0001 C CNN
F 1 "GND" H 9805 3577 50  0000 C CNN
F 2 "" H 9800 3750 50  0001 C CNN
F 3 "" H 9800 3750 50  0001 C CNN
	1    9800 3750
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5CC40C1C
P 9800 3400
F 0 "#PWR0110" H 9800 3250 50  0001 C CNN
F 1 "+5V" H 9815 3573 50  0000 C CNN
F 2 "" H 9800 3400 50  0001 C CNN
F 3 "" H 9800 3400 50  0001 C CNN
	1    9800 3400
	-1   0    0    -1  
$EndComp
Text GLabel 10350 3350 0    50   Input ~ 0
1wire
$Comp
L Connector:Conn_01x07_Female J2
U 1 1 5CC40C23
P 10800 3550
F 0 "J2" H 10694 4035 50  0000 C CNN
F 1 "1W/D_5" H 10694 3944 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 10800 3550 50  0001 C CNN
F 3 "~" H 10800 3550 50  0001 C CNN
	1    10800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 3250 10500 3250
Wire Wire Line
	10600 3350 10350 3350
Wire Wire Line
	10600 3450 9800 3450
Wire Wire Line
	10600 3850 10400 3850
Wire Wire Line
	10400 3850 10400 3100
Wire Wire Line
	10600 3650 10500 3650
Wire Wire Line
	10500 3650 10500 3250
Connection ~ 10500 3650
Wire Wire Line
	10500 3650 9800 3650
Wire Wire Line
	9800 3650 9800 3750
Wire Wire Line
	9800 3400 9800 3450
Text Notes 10550 3550 0    50   ~ 0
R
Text Notes 10550 3850 0    50   ~ 0
B
Wire Wire Line
	10600 1550 9650 1550
Wire Wire Line
	9650 1550 9650 1100
Wire Wire Line
	9650 1100 8450 1100
Wire Wire Line
	8450 1100 8450 1650
Wire Wire Line
	7500 1650 8450 1650
Connection ~ 8450 1650
Wire Wire Line
	8450 1650 8550 1650
Wire Wire Line
	10400 1000 8350 1000
Wire Wire Line
	8350 1000 8350 2050
Wire Wire Line
	10400 1000 10400 1850
Connection ~ 8350 2050
Wire Wire Line
	8350 2050 8550 2050
Wire Wire Line
	9750 1650 9800 1650
Connection ~ 9800 1650
Wire Wire Line
	7500 2950 8550 2950
Wire Wire Line
	7500 2550 8300 2550
Wire Wire Line
	7500 3850 8300 3850
Wire Wire Line
	7500 4750 8400 4750
$Comp
L power:GND #PWR0111
U 1 1 5CCFF868
P 9800 2800
F 0 "#PWR0111" H 9800 2550 50  0001 C CNN
F 1 "GND" H 9805 2627 50  0000 C CNN
F 2 "" H 9800 2800 50  0001 C CNN
F 3 "" H 9800 2800 50  0001 C CNN
	1    9800 2800
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 5CCFF86E
P 9800 2500
F 0 "#PWR0112" H 9800 2350 50  0001 C CNN
F 1 "+5V" H 9815 2673 50  0000 C CNN
F 2 "" H 9800 2500 50  0001 C CNN
F 3 "" H 9800 2500 50  0001 C CNN
	1    9800 2500
	-1   0    0    -1  
$EndComp
Text GLabel 10350 2450 0    50   Input ~ 0
1wire
$Comp
L Connector:Conn_01x07_Female J3
U 1 1 5CCFF875
P 10800 2650
F 0 "J3" H 10694 3135 50  0000 C CNN
F 1 "1W/D_4" H 10694 3044 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 10800 2650 50  0001 C CNN
F 3 "~" H 10800 2650 50  0001 C CNN
	1    10800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 2350 10500 2350
Wire Wire Line
	10600 2450 10350 2450
Wire Wire Line
	10600 2550 9800 2550
Wire Wire Line
	10600 2750 10500 2750
Wire Wire Line
	10500 2750 10500 2350
Connection ~ 10500 2750
Wire Wire Line
	9800 2500 9800 2550
Text Notes 10550 2650 0    50   ~ 0
R
Text Notes 10550 2950 0    50   ~ 0
B
$Comp
L power:GND #PWR0113
U 1 1 5CD0DE18
P 9800 4800
F 0 "#PWR0113" H 9800 4550 50  0001 C CNN
F 1 "GND" H 9805 4627 50  0000 C CNN
F 2 "" H 9800 4800 50  0001 C CNN
F 3 "" H 9800 4800 50  0001 C CNN
	1    9800 4800
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5CD0DE1E
P 9800 4500
F 0 "#PWR0114" H 9800 4350 50  0001 C CNN
F 1 "+5V" H 9815 4673 50  0000 C CNN
F 2 "" H 9800 4500 50  0001 C CNN
F 3 "" H 9800 4500 50  0001 C CNN
	1    9800 4500
	-1   0    0    -1  
$EndComp
Text GLabel 10350 4450 0    50   Input ~ 0
1wire
$Comp
L Connector:Conn_01x07_Female J1
U 1 1 5CD0DE25
P 10800 4650
F 0 "J1" H 10694 5135 50  0000 C CNN
F 1 "1W/D_6" H 10694 5044 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 10800 4650 50  0001 C CNN
F 3 "~" H 10800 4650 50  0001 C CNN
	1    10800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 4350 10500 4350
Wire Wire Line
	10600 4450 10350 4450
Wire Wire Line
	10600 4550 9800 4550
Wire Wire Line
	10600 4750 10500 4750
Wire Wire Line
	10500 4750 10500 4350
Connection ~ 10500 4750
Wire Wire Line
	9800 4500 9800 4550
Text Notes 10550 4650 0    50   ~ 0
R
Text Notes 10550 4950 0    50   ~ 0
B
Wire Wire Line
	7500 3450 8400 3450
Wire Wire Line
	8400 3450 8400 3650
Wire Wire Line
	8400 3650 8550 3650
Wire Wire Line
	7500 4350 8300 4350
Wire Wire Line
	8400 4350 8400 4550
Wire Wire Line
	8400 4550 8550 4550
Wire Wire Line
	9750 3650 9800 3650
Connection ~ 9800 3650
Wire Wire Line
	10600 3550 9650 3550
Wire Wire Line
	9650 3550 9650 3200
Wire Wire Line
	9650 3200 8400 3200
Wire Wire Line
	8400 3200 8400 3450
Connection ~ 8400 3450
Wire Wire Line
	10400 3100 8300 3100
Wire Wire Line
	8300 3100 8300 3850
Connection ~ 8300 3850
Wire Wire Line
	8300 3850 8550 3850
Wire Wire Line
	8400 4750 8400 4950
Wire Wire Line
	8400 4950 10600 4950
Connection ~ 8400 4750
Wire Wire Line
	8400 4750 8550 4750
Wire Wire Line
	9750 4750 9800 4750
Wire Wire Line
	9800 4800 9800 4750
Connection ~ 9800 4750
Wire Wire Line
	9800 4750 10500 4750
Wire Wire Line
	10600 4650 10400 4650
Wire Wire Line
	10400 4650 10400 5100
Wire Wire Line
	10400 5100 8300 5100
Wire Wire Line
	8300 5100 8300 4350
Connection ~ 8300 4350
Wire Wire Line
	8300 4350 8400 4350
Text Notes 950  1500 0    50   ~ 0
R
Text Notes 950  2600 0    50   ~ 0
R
Text Notes 950  1800 0    50   ~ 0
B
Text Notes 950  2900 0    50   ~ 0
B
Wire Wire Line
	9750 2750 9800 2750
Wire Wire Line
	9800 2800 9800 2750
Connection ~ 9800 2750
Wire Wire Line
	9800 2750 10500 2750
Wire Wire Line
	8550 2950 10600 2950
Connection ~ 8550 2950
NoConn ~ 5150 3950
Wire Wire Line
	8550 2750 8550 2950
NoConn ~ 5150 3750
NoConn ~ 5150 3650
NoConn ~ 5150 3350
NoConn ~ 5650 2750
NoConn ~ 5750 2750
NoConn ~ 6550 3950
NoConn ~ 950  2800
NoConn ~ 950  1700
NoConn ~ 10600 1750
NoConn ~ 10600 3750
NoConn ~ 10600 2850
Wire Wire Line
	10600 2650 10400 2650
Wire Wire Line
	10400 2650 10400 3000
Wire Wire Line
	10400 3000 8300 3000
Wire Wire Line
	8300 3000 8300 2550
Connection ~ 8300 2550
Wire Wire Line
	8300 2550 8550 2550
NoConn ~ 10600 4850
NoConn ~ 1550 5150
NoConn ~ 1550 5250
NoConn ~ 1550 5350
NoConn ~ 1550 5450
NoConn ~ 1550 5950
NoConn ~ 1550 6050
NoConn ~ 1550 6150
NoConn ~ 1550 6250
NoConn ~ 2750 6650
NoConn ~ 2750 6550
NoConn ~ 2750 6450
NoConn ~ 2750 6350
NoConn ~ 2750 6250
NoConn ~ 2750 6150
NoConn ~ 2750 6050
NoConn ~ 2750 5950
NoConn ~ 2750 5850
NoConn ~ 2750 5750
NoConn ~ 2750 5650
NoConn ~ 2750 5550
NoConn ~ 2750 5450
NoConn ~ 2750 5350
NoConn ~ 2750 5150
Wire Wire Line
	6800 5300 6800 4800
Wire Wire Line
	6800 4800 6900 4800
Connection ~ 6900 4800
Wire Wire Line
	6900 4800 6900 3850
Wire Wire Line
	6800 5400 6400 5400
$Comp
L power:+5V #PWR0115
U 1 1 5C942B34
P 6400 5350
F 0 "#PWR0115" H 6400 5200 50  0001 C CNN
F 1 "+5V" H 6415 5523 50  0000 C CNN
F 2 "" H 6400 5350 50  0001 C CNN
F 3 "" H 6400 5350 50  0001 C CNN
	1    6400 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6400 5400 6400 5350
Wire Wire Line
	2400 2350 2400 2500
Wire Wire Line
	2400 2500 2400 2700
Connection ~ 2400 2500
Connection ~ 2400 2700
$Comp
L Device:R_Small R81
U 1 1 5CEE31EC
P 6200 1950
F 0 "R81" V 6004 1950 50  0000 C CNN
F 1 "4k7" V 6095 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6200 1950 50  0001 C CNN
F 3 "~" H 6200 1950 50  0001 C CNN
	1    6200 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R82
U 1 1 5CEE3295
P 6200 2250
F 0 "R82" V 6004 2250 50  0000 C CNN
F 1 "4k7" V 6095 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6200 2250 50  0001 C CNN
F 3 "~" H 6200 2250 50  0001 C CNN
	1    6200 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 1600 5950 1950
Wire Wire Line
	5850 1600 5850 2250
Wire Wire Line
	5950 1950 6100 1950
Connection ~ 5950 1950
Wire Wire Line
	5950 1950 5950 2750
Wire Wire Line
	6300 1950 6400 1950
Wire Wire Line
	6400 1950 6400 1600
Wire Wire Line
	6300 2250 6400 2250
Wire Wire Line
	6400 2250 6400 1950
Connection ~ 6400 1950
Wire Wire Line
	5850 2250 6100 2250
Connection ~ 5850 2250
Wire Wire Line
	5850 2250 5850 2750
$Comp
L power:+5V #PWR0116
U 1 1 5CF7CC52
P 6400 1600
F 0 "#PWR0116" H 6400 1450 50  0001 C CNN
F 1 "+5V" H 6415 1773 50  0000 C CNN
F 2 "" H 6400 1600 50  0001 C CNN
F 3 "" H 6400 1600 50  0001 C CNN
	1    6400 1600
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
