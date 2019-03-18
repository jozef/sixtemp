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
L Connector:Conn_01x02_Female J7
U 1 1 5C673376
P 5850 2300
F 0 "J7" V 5790 2112 50  0000 R CNN
F 1 "I2C" V 5699 2112 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 5850 2300 50  0001 C CNN
F 3 "~" H 5850 2300 50  0001 C CNN
	1    5850 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 2750 5950 2550
Wire Wire Line
	5850 2750 5850 2550
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
L Device:R R11
U 1 1 5C67488C
P 4200 1600
F 0 "R11" V 3993 1600 50  0000 C CNN
F 1 "1k" V 4084 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 1600 50  0001 C CNN
F 3 "~" H 4200 1600 50  0001 C CNN
	1    4200 1600
	0    -1   1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5C674892
P 4200 2000
F 0 "R12" V 3993 2000 50  0000 C CNN
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
L Device:R R21
U 1 1 5C67F9F1
P 4200 2500
F 0 "R21" V 3993 2500 50  0000 C CNN
F 1 "1k" V 4084 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 2500 50  0001 C CNN
F 3 "~" H 4200 2500 50  0001 C CNN
	1    4200 2500
	0    -1   1    0   
$EndComp
$Comp
L Device:R R22
U 1 1 5C67F9F7
P 4200 2900
F 0 "R22" V 3993 2900 50  0000 C CNN
F 1 "1k" V 4084 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4130 2900 50  0001 C CNN
F 3 "~" H 4200 2900 50  0001 C CNN
	1    4200 2900
	0    -1   1    0   
$EndComp
Wire Wire Line
	4700 4050 4700 4350
$Comp
L Device:R R31
U 1 1 5C68BF5D
P 7350 1650
F 0 "R31" V 7143 1650 50  0000 C CNN
F 1 "1k" V 7234 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 1650 50  0001 C CNN
F 3 "~" H 7350 1650 50  0001 C CNN
	1    7350 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 5C68BF63
P 7350 2050
F 0 "R32" V 7143 2050 50  0000 C CNN
F 1 "1k" V 7234 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2050 50  0001 C CNN
F 3 "~" H 7350 2050 50  0001 C CNN
	1    7350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R41
U 1 1 5C68BF7E
P 7350 2550
F 0 "R41" V 7143 2550 50  0000 C CNN
F 1 "1k" V 7234 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2550 50  0001 C CNN
F 3 "~" H 7350 2550 50  0001 C CNN
	1    7350 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R42
U 1 1 5C68BF84
P 7350 2950
F 0 "R42" V 7143 2950 50  0000 C CNN
F 1 "1k" V 7234 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 2950 50  0001 C CNN
F 3 "~" H 7350 2950 50  0001 C CNN
	1    7350 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R R51
U 1 1 5C68E696
P 7350 3450
F 0 "R51" V 7143 3450 50  0000 C CNN
F 1 "1k" V 7234 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 3450 50  0001 C CNN
F 3 "~" H 7350 3450 50  0001 C CNN
	1    7350 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R52
U 1 1 5C68E69C
P 7350 3850
F 0 "R52" V 7143 3850 50  0000 C CNN
F 1 "1k" V 7234 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 3850 50  0001 C CNN
F 3 "~" H 7350 3850 50  0001 C CNN
	1    7350 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R61
U 1 1 5C68E6AF
P 7350 4350
F 0 "R61" V 7143 4350 50  0000 C CNN
F 1 "1k" V 7234 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 4350 50  0001 C CNN
F 3 "~" H 7350 4350 50  0001 C CNN
	1    7350 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R62
U 1 1 5C68E6B5
P 7350 4750
F 0 "R62" V 7143 4750 50  0000 C CNN
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
L Device:Jumper JP1
U 1 1 5C6B160A
P 2100 1600
F 0 "JP1" H 2100 1773 50  0000 C CNN
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
L Device:LED_Dual_AACC D1
U 1 1 5C6F5674
P 2700 1700
F 0 "D1" H 2700 2125 50  0000 C CNN
F 1 "LED_Dual_AACC" H 2700 2034 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 2730 1700 50  0001 C CNN
F 3 "~" H 2730 1700 50  0001 C CNN
	1    2700 1700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 5C6FE54F
P 3500 1700
F 0 "J1" H 3394 1985 50  0000 C CNN
F 1 "Conn_Led_1" H 3394 1894 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 3500 1700 50  0001 C CNN
F 3 "~" H 3500 1700 50  0001 C CNN
	1    3500 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 1600 3800 1350
Wire Wire Line
	3800 1350 3000 1350
Wire Wire Line
	3000 1350 3000 1600
Wire Wire Line
	3800 1600 3700 1600
Wire Wire Line
	3000 2000 3000 1800
Wire Wire Line
	3700 1900 3700 2000
Wire Wire Line
	3700 2000 3000 2000
$Comp
L power:GND #PWR0104
U 1 1 5C710314
P 1800 1600
F 0 "#PWR0104" H 1800 1350 50  0001 C CNN
F 1 "GND" H 1805 1427 50  0000 C CNN
F 2 "" H 1800 1600 50  0001 C CNN
F 3 "" H 1800 1600 50  0001 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1700 3800 1700
$Comp
L power:GND #PWR0105
U 1 1 5C711EE0
P 3800 1700
F 0 "#PWR0105" H 3800 1450 50  0001 C CNN
F 1 "GND" H 3805 1527 50  0000 C CNN
F 2 "" H 3800 1700 50  0001 C CNN
F 3 "" H 3800 1700 50  0001 C CNN
	1    3800 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J71
U 1 1 5C7127F3
P 750 1700
F 0 "J71" H 644 1985 50  0000 C CNN
F 1 "Temp1" H 644 1894 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 750 1700 50  0001 C CNN
F 3 "~" H 750 1700 50  0001 C CNN
	1    750  1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	950  1600 1300 1600
Wire Wire Line
	950  1800 1300 1800
$Comp
L power:+5V #PWR0106
U 1 1 5C71A531
P 1300 1600
F 0 "#PWR0106" H 1300 1450 50  0001 C CNN
F 1 "+5V" H 1315 1773 50  0000 C CNN
F 2 "" H 1300 1600 50  0001 C CNN
F 3 "" H 1300 1600 50  0001 C CNN
	1    1300 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C71A61D
P 1300 1800
F 0 "#PWR0107" H 1300 1550 50  0001 C CNN
F 1 "GND" H 1305 1627 50  0000 C CNN
F 2 "" H 1300 1800 50  0001 C CNN
F 3 "" H 1300 1800 50  0001 C CNN
	1    1300 1800
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
Text GLabel 1400 1700 2    50   Input ~ 0
1wire
Wire Wire Line
	950  1700 1400 1700
Wire Wire Line
	4050 1600 3800 1600
Connection ~ 3800 1600
Wire Wire Line
	4050 2000 3700 2000
Connection ~ 3700 2000
$Comp
L Device:Jumper JP2
U 1 1 5C738FA0
P 2100 2700
F 0 "JP2" H 2100 2873 50  0000 C CNN
F 1 "Jumper" H 2100 2873 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2100 2700 50  0001 C CNN
F 3 "~" H 2100 2700 50  0001 C CNN
	1    2100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D2
U 1 1 5C738FA6
P 2700 2600
F 0 "D2" H 2700 3025 50  0000 C CNN
F 1 "LED_Dual_AACC" H 2700 2934 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 2730 2600 50  0001 C CNN
F 3 "~" H 2730 2600 50  0001 C CNN
	1    2700 2600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 5C738FAC
P 3500 2600
F 0 "J2" H 3394 2885 50  0000 C CNN
F 1 "Conn_Led_2" H 3394 2794 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 3500 2600 50  0001 C CNN
F 3 "~" H 3500 2600 50  0001 C CNN
	1    3500 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 2500 3800 2250
Wire Wire Line
	3800 2250 3000 2250
Wire Wire Line
	3000 2250 3000 2500
Wire Wire Line
	3800 2500 3700 2500
Wire Wire Line
	3000 2900 3000 2700
Wire Wire Line
	3700 2800 3700 2900
Wire Wire Line
	3700 2900 3000 2900
$Comp
L power:GND #PWR0102
U 1 1 5C738FBA
P 1800 2700
F 0 "#PWR0102" H 1800 2450 50  0001 C CNN
F 1 "GND" H 1805 2527 50  0000 C CNN
F 2 "" H 1800 2700 50  0001 C CNN
F 3 "" H 1800 2700 50  0001 C CNN
	1    1800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2600 3800 2600
$Comp
L power:GND #PWR0103
U 1 1 5C738FC1
P 3800 2600
F 0 "#PWR0103" H 3800 2350 50  0001 C CNN
F 1 "GND" H 3805 2427 50  0000 C CNN
F 2 "" H 3800 2600 50  0001 C CNN
F 3 "" H 3800 2600 50  0001 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J72
U 1 1 5C738FC7
P 650 2600
F 0 "J72" H 544 2885 50  0000 C CNN
F 1 "Temp2" H 544 2794 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 650 2600 50  0001 C CNN
F 3 "~" H 650 2600 50  0001 C CNN
	1    650  2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	850  2500 1200 2500
Wire Wire Line
	850  2700 1200 2700
$Comp
L power:+5V #PWR0109
U 1 1 5C738FCF
P 1200 2500
F 0 "#PWR0109" H 1200 2350 50  0001 C CNN
F 1 "+5V" H 1215 2673 50  0000 C CNN
F 2 "" H 1200 2500 50  0001 C CNN
F 3 "" H 1200 2500 50  0001 C CNN
	1    1200 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5C738FD5
P 1200 2700
F 0 "#PWR0110" H 1200 2450 50  0001 C CNN
F 1 "GND" H 1205 2527 50  0000 C CNN
F 2 "" H 1200 2700 50  0001 C CNN
F 3 "" H 1200 2700 50  0001 C CNN
	1    1200 2700
	1    0    0    -1  
$EndComp
Text GLabel 1300 2600 2    50   Input ~ 0
1wire
Wire Wire Line
	850  2600 1300 2600
Wire Wire Line
	4050 2500 3800 2500
Connection ~ 3800 2500
Wire Wire Line
	4050 2900 3700 2900
Connection ~ 3700 2900
$Comp
L Device:Jumper JP3
U 1 1 5C740F91
P 9450 1650
F 0 "JP3" H 9450 1823 50  0000 C CNN
F 1 "Jumper" H 9450 1823 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 1650 50  0001 C CNN
F 3 "~" H 9450 1650 50  0001 C CNN
	1    9450 1650
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D3
U 1 1 5C740F97
P 8850 1750
F 0 "D3" H 8850 2175 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 2084 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 1750 50  0001 C CNN
F 3 "~" H 8880 1750 50  0001 C CNN
	1    8850 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5C740F9D
P 8050 1750
F 0 "J3" H 8077 1726 50  0000 L CNN
F 1 "Conn_Led_2" H 8077 1635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8050 1750 50  0001 C CNN
F 3 "~" H 8050 1750 50  0001 C CNN
	1    8050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1650 7750 1400
Wire Wire Line
	7750 1400 8550 1400
Wire Wire Line
	8550 1400 8550 1650
Wire Wire Line
	7750 1650 7850 1650
Wire Wire Line
	8550 2050 8550 1850
Wire Wire Line
	7850 1950 7850 2050
Wire Wire Line
	7850 2050 8550 2050
$Comp
L power:GND #PWR0111
U 1 1 5C740FAB
P 9750 1650
F 0 "#PWR0111" H 9750 1400 50  0001 C CNN
F 1 "GND" H 9755 1477 50  0000 C CNN
F 2 "" H 9750 1650 50  0001 C CNN
F 3 "" H 9750 1650 50  0001 C CNN
	1    9750 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 1750 7750 1750
$Comp
L power:GND #PWR0112
U 1 1 5C740FB2
P 7750 1750
F 0 "#PWR0112" H 7750 1500 50  0001 C CNN
F 1 "GND" H 7755 1577 50  0000 C CNN
F 2 "" H 7750 1750 50  0001 C CNN
F 3 "" H 7750 1750 50  0001 C CNN
	1    7750 1750
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J73
U 1 1 5C740FB8
P 10800 1750
F 0 "J73" H 10827 1776 50  0000 L CNN
F 1 "Temp3" H 10827 1685 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10800 1750 50  0001 C CNN
F 3 "~" H 10800 1750 50  0001 C CNN
	1    10800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1650 10250 1650
Wire Wire Line
	10600 1850 10250 1850
$Comp
L power:+5V #PWR0113
U 1 1 5C740FC0
P 10250 1650
F 0 "#PWR0113" H 10250 1500 50  0001 C CNN
F 1 "+5V" H 10265 1823 50  0000 C CNN
F 2 "" H 10250 1650 50  0001 C CNN
F 3 "" H 10250 1650 50  0001 C CNN
	1    10250 1650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5C740FC6
P 10250 1850
F 0 "#PWR0114" H 10250 1600 50  0001 C CNN
F 1 "GND" H 10255 1677 50  0000 C CNN
F 2 "" H 10250 1850 50  0001 C CNN
F 3 "" H 10250 1850 50  0001 C CNN
	1    10250 1850
	-1   0    0    -1  
$EndComp
Text GLabel 10150 1750 0    50   Input ~ 0
1wire
Wire Wire Line
	10600 1750 10150 1750
Wire Wire Line
	7500 1650 7750 1650
Connection ~ 7750 1650
Wire Wire Line
	7500 2050 7850 2050
Connection ~ 7850 2050
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
L Device:Jumper JP4
U 1 1 5C76956C
P 9450 2750
F 0 "JP4" H 9450 2923 50  0000 C CNN
F 1 "Jumper" H 9450 2923 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 2750 50  0001 C CNN
F 3 "~" H 9450 2750 50  0001 C CNN
	1    9450 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D4
U 1 1 5C769573
P 8850 2650
F 0 "D4" H 8850 3075 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 2984 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 2650 50  0001 C CNN
F 3 "~" H 8880 2650 50  0001 C CNN
	1    8850 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5C76957A
P 8050 2650
F 0 "J4" H 8077 2626 50  0000 L CNN
F 1 "Conn_Led_3" H 8077 2535 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8050 2650 50  0001 C CNN
F 3 "~" H 8050 2650 50  0001 C CNN
	1    8050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2550 7750 2300
Wire Wire Line
	7750 2300 8550 2300
Wire Wire Line
	8550 2300 8550 2550
Wire Wire Line
	7750 2550 7850 2550
Wire Wire Line
	8550 2950 8550 2750
Wire Wire Line
	7850 2850 7850 2950
Wire Wire Line
	7850 2950 8550 2950
$Comp
L power:GND #PWR0115
U 1 1 5C769589
P 9750 2750
F 0 "#PWR0115" H 9750 2500 50  0001 C CNN
F 1 "GND" H 9755 2577 50  0000 C CNN
F 2 "" H 9750 2750 50  0001 C CNN
F 3 "" H 9750 2750 50  0001 C CNN
	1    9750 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 2650 7750 2650
$Comp
L power:GND #PWR0116
U 1 1 5C769590
P 7750 2650
F 0 "#PWR0116" H 7750 2400 50  0001 C CNN
F 1 "GND" H 7755 2477 50  0000 C CNN
F 2 "" H 7750 2650 50  0001 C CNN
F 3 "" H 7750 2650 50  0001 C CNN
	1    7750 2650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J74
U 1 1 5C769596
P 10800 2650
F 0 "J74" H 10827 2676 50  0000 L CNN
F 1 "Temp4" H 10827 2585 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10800 2650 50  0001 C CNN
F 3 "~" H 10800 2650 50  0001 C CNN
	1    10800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 2550 10250 2550
Wire Wire Line
	10600 2750 10250 2750
$Comp
L power:+5V #PWR0117
U 1 1 5C76959F
P 10250 2550
F 0 "#PWR0117" H 10250 2400 50  0001 C CNN
F 1 "+5V" H 10265 2723 50  0000 C CNN
F 2 "" H 10250 2550 50  0001 C CNN
F 3 "" H 10250 2550 50  0001 C CNN
	1    10250 2550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5C7695A5
P 10250 2750
F 0 "#PWR0118" H 10250 2500 50  0001 C CNN
F 1 "GND" H 10255 2577 50  0000 C CNN
F 2 "" H 10250 2750 50  0001 C CNN
F 3 "" H 10250 2750 50  0001 C CNN
	1    10250 2750
	-1   0    0    -1  
$EndComp
Text GLabel 10150 2650 0    50   Input ~ 0
1wire
Wire Wire Line
	10600 2650 10150 2650
Wire Wire Line
	7500 2550 7750 2550
Connection ~ 7750 2550
Wire Wire Line
	7500 2950 7850 2950
Connection ~ 7850 2950
$Comp
L Device:Jumper JP5
U 1 1 5C76CA96
P 9450 3450
F 0 "JP5" H 9450 3623 50  0000 C CNN
F 1 "Jumper" H 9450 3623 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 3450 50  0001 C CNN
F 3 "~" H 9450 3450 50  0001 C CNN
	1    9450 3450
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D5
U 1 1 5C76CA9D
P 8850 3550
F 0 "D5" H 8850 3975 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 3884 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 3550 50  0001 C CNN
F 3 "~" H 8880 3550 50  0001 C CNN
	1    8850 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5C76CAA4
P 8050 3550
F 0 "J5" H 8077 3526 50  0000 L CNN
F 1 "Conn_Led_5" H 8077 3435 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8050 3550 50  0001 C CNN
F 3 "~" H 8050 3550 50  0001 C CNN
	1    8050 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3450 7750 3200
Wire Wire Line
	7750 3200 8550 3200
Wire Wire Line
	8550 3200 8550 3450
Wire Wire Line
	7750 3450 7850 3450
Wire Wire Line
	8550 3850 8550 3650
Wire Wire Line
	7850 3750 7850 3850
Wire Wire Line
	7850 3850 8550 3850
$Comp
L power:GND #PWR0119
U 1 1 5C76CAB3
P 9750 3450
F 0 "#PWR0119" H 9750 3200 50  0001 C CNN
F 1 "GND" H 9755 3277 50  0000 C CNN
F 2 "" H 9750 3450 50  0001 C CNN
F 3 "" H 9750 3450 50  0001 C CNN
	1    9750 3450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 3550 7750 3550
$Comp
L power:GND #PWR0120
U 1 1 5C76CABA
P 7750 3550
F 0 "#PWR0120" H 7750 3300 50  0001 C CNN
F 1 "GND" H 7755 3377 50  0000 C CNN
F 2 "" H 7750 3550 50  0001 C CNN
F 3 "" H 7750 3550 50  0001 C CNN
	1    7750 3550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J75
U 1 1 5C76CAC0
P 10800 3550
F 0 "J75" H 10827 3576 50  0000 L CNN
F 1 "Temp5" H 10827 3485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10800 3550 50  0001 C CNN
F 3 "~" H 10800 3550 50  0001 C CNN
	1    10800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 3450 10250 3450
Wire Wire Line
	10600 3650 10250 3650
$Comp
L power:+5V #PWR0121
U 1 1 5C76CAC9
P 10250 3450
F 0 "#PWR0121" H 10250 3300 50  0001 C CNN
F 1 "+5V" H 10265 3623 50  0000 C CNN
F 2 "" H 10250 3450 50  0001 C CNN
F 3 "" H 10250 3450 50  0001 C CNN
	1    10250 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5C76CACF
P 10250 3650
F 0 "#PWR0122" H 10250 3400 50  0001 C CNN
F 1 "GND" H 10255 3477 50  0000 C CNN
F 2 "" H 10250 3650 50  0001 C CNN
F 3 "" H 10250 3650 50  0001 C CNN
	1    10250 3650
	-1   0    0    -1  
$EndComp
Text GLabel 10150 3550 0    50   Input ~ 0
1wire
Wire Wire Line
	10600 3550 10150 3550
Wire Wire Line
	7500 3450 7750 3450
Connection ~ 7750 3450
Wire Wire Line
	7500 3850 7850 3850
Connection ~ 7850 3850
$Comp
L Device:Jumper JP6
U 1 1 5C770B64
P 9450 4550
F 0 "JP6" H 9450 4723 50  0000 C CNN
F 1 "Jumper" H 9450 4723 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 4550 50  0001 C CNN
F 3 "~" H 9450 4550 50  0001 C CNN
	1    9450 4550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Dual_AACC D6
U 1 1 5C770B6B
P 8850 4450
F 0 "D6" H 8850 4875 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8850 4784 50  0000 C CNN
F 2 "LED_SMD:LED_WL_SBTW_PLCC4_2.4x2.4mm_P1.7mm" H 8880 4450 50  0001 C CNN
F 3 "~" H 8880 4450 50  0001 C CNN
	1    8850 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J6
U 1 1 5C770B72
P 8050 4450
F 0 "J6" H 8077 4426 50  0000 L CNN
F 1 "Conn_Led_6" H 8077 4335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8050 4450 50  0001 C CNN
F 3 "~" H 8050 4450 50  0001 C CNN
	1    8050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4350 7750 4100
Wire Wire Line
	7750 4100 8550 4100
Wire Wire Line
	8550 4100 8550 4350
Wire Wire Line
	7750 4350 7850 4350
Wire Wire Line
	8550 4750 8550 4550
Wire Wire Line
	7850 4650 7850 4750
Wire Wire Line
	7850 4750 8550 4750
$Comp
L power:GND #PWR0123
U 1 1 5C770B81
P 9750 4550
F 0 "#PWR0123" H 9750 4300 50  0001 C CNN
F 1 "GND" H 9755 4377 50  0000 C CNN
F 2 "" H 9750 4550 50  0001 C CNN
F 3 "" H 9750 4550 50  0001 C CNN
	1    9750 4550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 4450 7750 4450
$Comp
L power:GND #PWR0124
U 1 1 5C770B88
P 7750 4450
F 0 "#PWR0124" H 7750 4200 50  0001 C CNN
F 1 "GND" H 7755 4277 50  0000 C CNN
F 2 "" H 7750 4450 50  0001 C CNN
F 3 "" H 7750 4450 50  0001 C CNN
	1    7750 4450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J76
U 1 1 5C770B8E
P 10800 4450
F 0 "J76" H 10827 4476 50  0000 L CNN
F 1 "Temp6" H 10827 4385 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 10800 4450 50  0001 C CNN
F 3 "~" H 10800 4450 50  0001 C CNN
	1    10800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 4350 10250 4350
Wire Wire Line
	10600 4550 10250 4550
$Comp
L power:+5V #PWR0125
U 1 1 5C770B97
P 10250 4350
F 0 "#PWR0125" H 10250 4200 50  0001 C CNN
F 1 "+5V" H 10265 4523 50  0000 C CNN
F 2 "" H 10250 4350 50  0001 C CNN
F 3 "" H 10250 4350 50  0001 C CNN
	1    10250 4350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5C770B9D
P 10250 4550
F 0 "#PWR0126" H 10250 4300 50  0001 C CNN
F 1 "GND" H 10255 4377 50  0000 C CNN
F 2 "" H 10250 4550 50  0001 C CNN
F 3 "" H 10250 4550 50  0001 C CNN
	1    10250 4550
	-1   0    0    -1  
$EndComp
Text GLabel 10150 4450 0    50   Input ~ 0
1wire
Wire Wire Line
	10600 4450 10150 4450
Wire Wire Line
	7500 4350 7750 4350
Connection ~ 7750 4350
Wire Wire Line
	7500 4750 7850 4750
Connection ~ 7850 4750
Text GLabel 1350 6350 0    50   Input ~ 0
SDA
Text GLabel 1350 6550 0    50   Input ~ 0
SCL
Wire Wire Line
	1350 6350 1450 6350
Wire Wire Line
	1350 6550 1450 6550
Text GLabel 5750 2550 0    50   Input ~ 0
SCL
Wire Wire Line
	5750 2550 5850 2550
Connection ~ 5850 2550
Wire Wire Line
	5850 2550 5850 2500
Text GLabel 6050 2550 2    50   Input ~ 0
SDA
Wire Wire Line
	6050 2550 5950 2550
Connection ~ 5950 2550
Wire Wire Line
	5950 2550 5950 2500
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
F 2 "Arduino_Shields:Arduino_Uno_Black" H 2150 6100 50  0001 C CNN
F 3 "" H 2150 6100 50  0001 C CNN
	1    2150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5550 1550 5550
$Comp
L Device:Jumper JP99
U 1 1 5C89834F
P 9450 5450
F 0 "JP99" H 9450 5623 50  0000 C CNN
F 1 "Jumper" H 9450 5623 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 5450 50  0001 C CNN
F 3 "~" H 9450 5450 50  0001 C CNN
	1    9450 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5C898355
P 9150 5450
F 0 "#PWR0132" H 9150 5200 50  0001 C CNN
F 1 "GND" H 9155 5277 50  0000 C CNN
F 2 "" H 9150 5450 50  0001 C CNN
F 3 "" H 9150 5450 50  0001 C CNN
	1    9150 5450
	1    0    0    -1  
$EndComp
Text GLabel 9900 5450 2    50   Input ~ 0
en_all_led
Wire Wire Line
	9750 5450 9900 5450
Text GLabel 9700 2200 2    50   Input ~ 0
en_all_led
Connection ~ 9150 2750
Wire Wire Line
	9150 2550 9150 2750
Connection ~ 9150 1650
Wire Wire Line
	9150 1650 9150 1850
Connection ~ 9150 3450
Wire Wire Line
	9150 3450 9150 3650
Connection ~ 9150 4550
Wire Wire Line
	9150 4350 9150 4550
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
Connection ~ 2400 2700
Wire Wire Line
	2400 2500 2400 2700
Wire Wire Line
	2400 2350 2400 2500
Connection ~ 2400 2500
Wire Wire Line
	2400 2450 2400 2500
Wire Wire Line
	2400 2500 2400 2600
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
Text GLabel 9700 4000 2    50   Input ~ 0
en_all_led
Wire Wire Line
	9550 4000 9700 4000
Connection ~ 9550 4000
Wire Wire Line
	9550 4000 9550 4200
Wire Wire Line
	9550 3800 9550 4000
Wire Wire Line
	9150 2000 9150 1850
Connection ~ 9150 1850
Wire Wire Line
	9150 2400 9150 2550
Connection ~ 9150 2550
Wire Wire Line
	9150 3800 9150 3650
Connection ~ 9150 3650
Wire Wire Line
	9150 4350 9150 4200
Connection ~ 9150 4350
$Comp
L Device:D D19
U 1 1 5CA426C5
P 2200 1950
F 0 "D19" H 2200 2166 50  0000 C CNN
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
L Device:D D29
U 1 1 5CA5F0DA
P 2200 2350
F 0 "D29" H 2200 2566 50  0000 C CNN
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
L Device:D D39
U 1 1 5CA6FD1E
P 9350 2000
F 0 "D39" H 9350 1784 50  0000 C CNN
F 1 "D" H 9350 1875 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 2000 50  0001 C CNN
F 3 "~" H 9350 2000 50  0001 C CNN
	1    9350 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:D D49
U 1 1 5CA80C1E
P 9350 2400
F 0 "D49" H 9350 2184 50  0000 C CNN
F 1 "D" H 9350 2275 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 2400 50  0001 C CNN
F 3 "~" H 9350 2400 50  0001 C CNN
	1    9350 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:D D59
U 1 1 5CA80D25
P 9350 3800
F 0 "D59" H 9350 3584 50  0000 C CNN
F 1 "D" H 9350 3675 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 3800 50  0001 C CNN
F 3 "~" H 9350 3800 50  0001 C CNN
	1    9350 3800
	-1   0    0    1   
$EndComp
$Comp
L Device:D D69
U 1 1 5CA80DCD
P 9350 4200
F 0 "D69" H 9350 3984 50  0000 C CNN
F 1 "D" H 9350 4075 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9350 4200 50  0001 C CNN
F 3 "~" H 9350 4200 50  0001 C CNN
	1    9350 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 3800 9200 3800
Wire Wire Line
	9500 3800 9550 3800
Wire Wire Line
	9550 4200 9500 4200
Wire Wire Line
	9200 4200 9150 4200
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
	6900 4900 6900 3850
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
L Connector:Conn_01x03_Female J10
U 1 1 5CB7CCD0
P 7000 5600
F 0 "J10" H 6893 5275 50  0000 C CNN
F 1 "debug" H 6893 5366 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7000 5600 50  0001 C CNN
F 3 "~" H 7000 5600 50  0001 C CNN
	1    7000 5600
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
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 5700 750 50  0001 C CNN
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
$EndSCHEMATC
