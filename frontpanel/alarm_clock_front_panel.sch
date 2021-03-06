EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:tpic2810
LIBS:as1115
LIBS:ltc-4727jr
LIBS:nhd-c0220biz-
LIBS:tactile
LIBS:alarm_clock_front_panel-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Alarm Clock Front Panel"
Date "24/01/2017"
Rev "A1"
Comp "Cameron MacGregor"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NHD-C0220BiZ- DS2
U 1 1 58718800
P 9900 1550
F 0 "DS2" H 9600 1750 60  0000 C CNN
F 1 "NHD-C0220BiZ-" H 9700 1500 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:NHD-C0220BIZ-FS(RGB)-FBW-3VM" H 10200 1500 60  0001 C CNN
F 3 "" H 10200 1500 60  0001 C CNN
	1    9900 1550
	1    0    0    -1  
$EndComp
$Comp
L AS1115 U1
U 1 1 587188C7
P 2850 3900
F 0 "U1" H 2750 4850 60  0000 C CNN
F 1 "AS1115" H 2750 3450 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-24_3.9x8.7mm_Pitch0.635mm" H 2850 3900 60  0001 C CNN
F 3 "" H 2850 3900 60  0001 C CNN
	1    2850 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 58719CF3
P 1950 4650
F 0 "#PWR01" H 1950 4400 50  0001 C CNN
F 1 "GND" H 1950 4500 50  0000 C CNN
F 2 "" H 1950 4650 50  0000 C CNN
F 3 "" H 1950 4650 50  0000 C CNN
	1    1950 4650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR02
U 1 1 58719F3C
P 3750 3000
F 0 "#PWR02" H 3750 2850 50  0001 C CNN
F 1 "+3V3" H 3750 3140 50  0000 C CNN
F 2 "" H 3750 3000 50  0000 C CNN
F 3 "" H 3750 3000 50  0000 C CNN
	1    3750 3000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5871A485
P 3450 4300
F 0 "R1" V 3530 4300 50  0000 C CNN
F 1 "27.4k" V 3450 4300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3380 4300 50  0001 C CNN
F 3 "" H 3450 4300 50  0000 C CNN
F 4 "1%" V 3450 4300 60  0001 C CNN "Tolerance"
	1    3450 4300
	0    1    1    0   
$EndComp
Text GLabel 3300 4100 2    60   Input ~ 0
SCL
Text GLabel 1400 3100 0    60   Input ~ 0
SDA
Text GLabel 7950 2150 0    60   Input ~ 0
SCL
Text GLabel 7950 2350 0    60   Input ~ 0
SDA
$Comp
L GND #PWR03
U 1 1 5871B354
P 10350 3100
F 0 "#PWR03" H 10350 2850 50  0001 C CNN
F 1 "GND" H 10350 2950 50  0000 C CNN
F 2 "" H 10350 3100 50  0000 C CNN
F 3 "" H 10350 3100 50  0000 C CNN
	1    10350 3100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR04
U 1 1 5871B3DF
P 8050 1350
F 0 "#PWR04" H 8050 1200 50  0001 C CNN
F 1 "+3V3" H 8050 1490 50  0000 C CNN
F 2 "" H 8050 1350 50  0000 C CNN
F 3 "" H 8050 1350 50  0000 C CNN
	1    8050 1350
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5871B634
P 9650 2600
F 0 "C1" H 9675 2700 50  0000 L CNN
F 1 "1uF" H 9675 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9688 2450 50  0001 C CNN
F 3 "" H 9650 2600 50  0000 C CNN
	1    9650 2600
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5871B71F
P 10100 2400
F 0 "C2" H 10125 2500 50  0000 L CNN
F 1 "1uF" H 10125 2300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 10138 2250 50  0001 C CNN
F 3 "" H 10100 2400 50  0000 C CNN
	1    10100 2400
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5871BAF0
P 8400 2150
F 0 "R2" V 8480 2150 50  0000 C CNN
F 1 "10k" V 8400 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8330 2150 50  0001 C CNN
F 3 "" H 8400 2150 50  0000 C CNN
	1    8400 2150
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5871BB4B
P 8400 2350
F 0 "R3" V 8480 2350 50  0000 C CNN
F 1 "10k" V 8400 2350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8330 2350 50  0001 C CNN
F 3 "" H 8400 2350 50  0000 C CNN
	1    8400 2350
	0    1    1    0   
$EndComp
Text GLabel 1400 2850 0    60   Input ~ 0
BUTTONS_IRQ
$Comp
L TACTILE SW3
U 1 1 58726B17
P 1450 7350
F 0 "SW3" H 1450 7450 60  0000 C CNN
F 1 "DOWN" H 1450 7050 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:TL1105SPF160Q" H 1450 7350 60  0001 C CNN
F 3 "" H 1450 7350 60  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW2
U 1 1 58726B60
P 1450 6100
F 0 "SW2" H 1450 6200 60  0000 C CNN
F 1 "UP" H 1450 5800 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:TL1105SPF160Q" H 1450 6100 60  0001 C CNN
F 3 "" H 1450 6100 60  0001 C CNN
	1    1450 6100
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW1
U 1 1 58726BB5
P 1050 6750
F 0 "SW1" H 1050 6850 60  0000 C CNN
F 1 "LEFT" H 1050 6450 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:TL1105SPF160Q" H 1050 6750 60  0001 C CNN
F 3 "" H 1050 6750 60  0001 C CNN
	1    1050 6750
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW4
U 1 1 58726C20
P 2550 6750
F 0 "SW4" H 2550 6850 60  0000 C CNN
F 1 "RIGHT" H 2550 6450 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:TL1105SPF160Q" H 2550 6750 60  0001 C CNN
F 3 "" H 2550 6750 60  0001 C CNN
	1    2550 6750
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW5
U 1 1 58728581
P 3900 6850
F 0 "SW5" H 3900 6950 60  0000 C CNN
F 1 "WEATHER (GREEN)" H 3900 6550 60  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled" H 3900 6850 60  0001 C CNN
F 3 "" H 3900 6850 60  0001 C CNN
	1    3900 6850
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW6
U 1 1 587285F0
P 5050 6850
F 0 "SW6" H 5050 6950 60  0000 C CNN
F 1 "TIME (RED)" H 5050 6550 60  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled" H 5050 6850 60  0001 C CNN
F 3 "" H 5050 6850 60  0001 C CNN
	1    5050 6850
	1    0    0    -1  
$EndComp
$Comp
L TACTILE SW7
U 1 1 58728637
P 6150 6850
F 0 "SW7" H 6150 6950 60  0000 C CNN
F 1 "TRANSIT (BLUE)" H 6150 6550 60  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled" H 6150 6850 60  0001 C CNN
F 3 "" H 6150 6850 60  0001 C CNN
	1    6150 6850
	1    0    0    -1  
$EndComp
Text Label 4300 7000 0    60   ~ 0
KEYA
Text Label 5450 7000 0    60   ~ 0
KEYA
Text Label 6550 7000 0    60   ~ 0
KEYA
Text Label 2150 6900 2    60   ~ 0
KEYB
Text Label 1050 7500 2    60   ~ 0
KEYB
Text Label 650  6900 2    60   ~ 0
KEYB
Text Label 1050 6250 2    60   ~ 0
KEYB
Text Label 1800 4100 2    60   ~ 0
KEYA
Text Label 1800 4200 2    60   ~ 0
KEYB
$Comp
L CONN_01X06 P1
U 1 1 5872ED04
P 1050 1400
F 0 "P1" H 1050 1750 50  0000 C CNN
F 1 "CONN_01X06" V 1150 1400 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_6pins" H 1050 1400 50  0001 C CNN
F 3 "" H 1050 1400 50  0000 C CNN
	1    1050 1400
	-1   0    0    1   
$EndComp
Text GLabel 1850 1650 2    60   Input ~ 0
SDA
$Comp
L +3V3 #PWR05
U 1 1 5872FF00
P 1500 850
F 0 "#PWR05" H 1500 700 50  0001 C CNN
F 1 "+3V3" H 1500 990 50  0000 C CNN
F 2 "" H 1500 850 50  0000 C CNN
F 3 "" H 1500 850 50  0000 C CNN
	1    1500 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5872FF3C
P 1400 1900
F 0 "#PWR06" H 1400 1650 50  0001 C CNN
F 1 "GND" H 1400 1750 50  0000 C CNN
F 2 "" H 1400 1900 50  0000 C CNN
F 3 "" H 1400 1900 50  0000 C CNN
	1    1400 1900
	1    0    0    -1  
$EndComp
Text GLabel 1850 1350 2    60   Input ~ 0
SCL
Text GLabel 1850 1150 2    60   Input ~ 0
BUTTONS_IRQ
$Comp
L C C3
U 1 1 587340A0
P 2450 4500
F 0 "C3" H 2475 4600 50  0000 L CNN
F 1 "10uF" H 2475 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2488 4350 50  0001 C CNN
F 3 "" H 2450 4500 50  0000 C CNN
	1    2450 4500
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 58734CA0
P 10100 2850
F 0 "C4" H 10125 2950 50  0000 L CNN
F 1 "1uF" H 10125 2750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 10138 2700 50  0001 C CNN
F 3 "" H 10100 2850 50  0000 C CNN
	1    10100 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 1350 8050 2000
Wire Wire Line
	8050 2000 8750 2000
Wire Wire Line
	1950 3600 1950 4650
Wire Wire Line
	1950 3600 2200 3600
Wire Wire Line
	3300 3600 3750 3600
Wire Wire Line
	3750 3000 3750 4300
Wire Wire Line
	3750 4300 3600 4300
Connection ~ 3750 3600
Wire Wire Line
	3300 4300 3300 4200
Wire Wire Line
	1400 3100 2200 3100
Wire Wire Line
	8850 1950 8850 2400
Wire Wire Line
	7950 2150 8250 2150
Wire Wire Line
	8100 2150 8100 2550
Wire Wire Line
	8100 2550 9250 2550
Wire Wire Line
	9250 2550 9250 2400
Wire Wire Line
	7950 2350 8250 2350
Wire Wire Line
	8050 2350 8050 2600
Wire Wire Line
	8050 2600 9350 2600
Wire Wire Line
	9350 2600 9350 2400
Wire Wire Line
	8850 2400 9150 2400
Wire Wire Line
	9550 2400 9550 2850
Wire Wire Line
	8750 2500 9550 2500
Wire Wire Line
	8750 2000 8750 2500
Wire Wire Line
	9450 2400 9450 3000
Wire Wire Line
	9650 2750 9450 2750
Connection ~ 9450 2750
Wire Wire Line
	9650 2450 9650 2400
Wire Wire Line
	9850 2400 9950 2400
Wire Wire Line
	10250 2400 10250 2550
Wire Wire Line
	10250 2550 9800 2550
Wire Wire Line
	9800 2550 9800 2450
Wire Wire Line
	9800 2450 9750 2450
Wire Wire Line
	9750 2450 9750 2400
Connection ~ 8100 2150
Wire Wire Line
	8750 2150 8550 2150
Connection ~ 8750 2150
Connection ~ 8050 2350
Wire Wire Line
	8550 2350 8750 2350
Connection ~ 8750 2350
Wire Wire Line
	1400 2850 3400 2850
Wire Wire Line
	3400 2700 3400 3100
Wire Wire Line
	3400 3100 3300 3100
Wire Wire Line
	5750 7000 5750 6300
Wire Wire Line
	5750 6300 3650 6300
Wire Wire Line
	4650 7000 4550 7000
Wire Wire Line
	4550 7000 4550 6400
Wire Wire Line
	4550 6400 3250 6400
Wire Wire Line
	1800 4200 2200 4200
Wire Wire Line
	1800 4100 2200 4100
Wire Wire Line
	1850 1650 1250 1650
Wire Wire Line
	1500 850  1500 1550
Wire Wire Line
	1500 1550 1250 1550
Wire Wire Line
	1400 1900 1400 1450
Wire Wire Line
	1400 1450 1250 1450
Wire Wire Line
	1850 1350 1250 1350
Wire Wire Line
	1850 1150 1250 1150
Wire Wire Line
	2850 6450 1650 6450
Wire Wire Line
	1650 6450 1650 6900
Wire Wire Line
	1650 6900 1450 6900
Wire Wire Line
	3250 6250 1850 6250
Connection ~ 3250 6250
Wire Wire Line
	3650 6550 1900 6550
Wire Wire Line
	1900 6550 1900 7500
Wire Wire Line
	1900 7500 1850 7500
Connection ~ 3650 6300
Wire Wire Line
	4050 6700 2950 6700
Wire Wire Line
	2950 6700 2950 6900
Wire Wire Line
	3500 7000 3100 7000
Wire Wire Line
	3100 7000 3100 6350
Wire Wire Line
	3100 6350 2850 6350
Connection ~ 2850 6350
Wire Wire Line
	2300 4500 1950 4500
Connection ~ 1950 4500
Wire Wire Line
	2600 4500 3650 4500
Wire Wire Line
	3650 4500 3650 3600
Connection ~ 3650 3600
Wire Wire Line
	9450 3000 10350 3000
Wire Wire Line
	10350 2850 10350 3100
Connection ~ 9550 2500
Wire Wire Line
	9550 2850 9950 2850
Wire Wire Line
	10250 2850 10350 2850
Connection ~ 10350 3000
Wire Wire Line
	4050 6700 4050 6000
Wire Wire Line
	3650 6000 3650 6550
Wire Wire Line
	2850 6000 2850 6450
Wire Wire Line
	3250 6400 3250 6000
Text Label 3300 4000 0    60   ~ 0
SEGA
Text Label 3300 3900 0    60   ~ 0
SEGF
Text Label 3300 3800 0    60   ~ 0
SEGB
Text Label 3300 3700 0    60   ~ 0
SEGG
Text Label 3300 3500 0    60   ~ 0
SEGC
Text Label 3300 3400 0    60   ~ 0
SEGE
Text Label 3300 3300 0    60   ~ 0
SEGDP
Text Label 3300 3200 0    60   ~ 0
SEGD
Text Label 3200 1300 2    60   ~ 0
SEGDP
Text Label 3200 1100 2    60   ~ 0
SEGE
Text Label 3200 1200 2    60   ~ 0
SEGD
Text Label 3200 1700 2    60   ~ 0
SEGB
Text Label 3200 1500 2    60   ~ 0
SEGG
Text Label 3200 1400 2    60   ~ 0
SEGC
$Comp
L HDSP-B03E DS1
U 1 1 5872F358
P 4000 1550
F 0 "DS1" H 4000 2150 60  0000 C CNN
F 1 "HDSP-B03E" H 4000 1200 60  0000 C CNN
F 2 "alarmclockfrontpanel_footprints:HDSP-B03E" H 4000 1550 60  0001 C CNN
F 3 "" H 4000 1550 60  0001 C CNN
	1    4000 1550
	1    0    0    -1  
$EndComp
Text Label 2200 3200 2    60   ~ 0
DIG0
Text Label 2200 3300 2    60   ~ 0
DIG1
Text Label 2200 3400 2    60   ~ 0
DIG2
Text Label 2200 3500 2    60   ~ 0
DIG3
Text Label 2200 3700 2    60   ~ 0
DIG4
Text Label 3200 1600 2    60   ~ 0
DIG3
NoConn ~ 2200 4000
NoConn ~ 5500 -600
$Comp
L R R4
U 1 1 58744BC5
P 8250 1650
F 0 "R4" V 8330 1650 50  0000 C CNN
F 1 "10k" V 8250 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8180 1650 50  0001 C CNN
F 3 "" H 8250 1650 50  0000 C CNN
	1    8250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1950 8250 1950
Wire Wire Line
	8250 1950 8250 1800
Wire Wire Line
	8250 1500 8050 1500
Connection ~ 8050 1500
$Comp
L +5V #PWR07
U 1 1 58746026
P 1300 850
F 0 "#PWR07" H 1300 700 50  0001 C CNN
F 1 "+5V" H 1300 990 50  0000 C CNN
F 2 "" H 1300 850 50  0000 C CNN
F 3 "" H 1300 850 50  0000 C CNN
	1    1300 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 850  1300 1250
Wire Wire Line
	1300 1250 1250 1250
$Comp
L +5V #PWR08
U 1 1 5874939F
P 8750 1300
F 0 "#PWR08" H 8750 1150 50  0001 C CNN
F 1 "+5V" H 8750 1440 50  0000 C CNN
F 2 "" H 8750 1300 50  0000 C CNN
F 3 "" H 8750 1300 50  0000 C CNN
	1    8750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 1300 8750 1500
Text Label 8750 1600 2    60   ~ 0
K-R
Text Label 8750 1700 2    60   ~ 0
K-G
Text Label 8750 1800 2    60   ~ 0
K-B
$Comp
L R R10
U 1 1 5874A9E3
P 6800 4200
F 0 "R10" V 6880 4200 50  0000 C CNN
F 1 "287" V 6800 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6730 4200 50  0001 C CNN
F 3 "" H 6800 4200 50  0000 C CNN
	1    6800 4200
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5874AAD2
P 8300 4200
F 0 "R12" V 8380 4200 50  0000 C CNN
F 1 "165" V 8300 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8230 4200 50  0001 C CNN
F 3 "" H 8300 4200 50  0000 C CNN
	1    8300 4200
	1    0    0    -1  
$EndComp
$Comp
L R R14
U 1 1 5874AB21
P 9800 4200
F 0 "R14" V 9880 4200 50  0000 C CNN
F 1 "200" V 9800 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9730 4200 50  0001 C CNN
F 3 "" H 9800 4200 50  0000 C CNN
	1    9800 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 4350 9800 4550
Wire Wire Line
	8300 4550 8300 4350
Wire Wire Line
	6800 4550 6800 4350
Text Label 2200 3800 2    60   ~ 0
DIG5
Text Label 2200 3900 2    60   ~ 0
DIG6
Wire Wire Line
	6800 4950 6800 5200
Wire Wire Line
	9800 5200 9800 4950
Wire Wire Line
	8300 5200 8300 4950
Text Label 6800 5200 3    60   ~ 0
DIG4
Text Label 8300 5200 3    60   ~ 0
DIG5
Text Label 9800 5200 3    60   ~ 0
DIG6
$Comp
L R R5
U 1 1 5874E206
P 2850 5400
F 0 "R5" V 2930 5400 50  0000 C CNN
F 1 "130" V 2850 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2780 5400 50  0001 C CNN
F 3 "" H 2850 5400 50  0000 C CNN
	1    2850 5400
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5874E2C2
P 3250 5400
F 0 "R6" V 3330 5400 50  0000 C CNN
F 1 "130" V 3250 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3180 5400 50  0001 C CNN
F 3 "" H 3250 5400 50  0000 C CNN
	1    3250 5400
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5874E386
P 3650 5400
F 0 "R7" V 3730 5400 50  0000 C CNN
F 1 "130" V 3650 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3580 5400 50  0001 C CNN
F 3 "" H 3650 5400 50  0000 C CNN
	1    3650 5400
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5874E420
P 4050 5400
F 0 "R8" V 4130 5400 50  0000 C CNN
F 1 "130" V 4050 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3980 5400 50  0001 C CNN
F 3 "" H 4050 5400 50  0000 C CNN
	1    4050 5400
	1    0    0    -1  
$EndComp
Text Label 2850 5250 1    60   ~ 0
SEGA
Text Label 3250 5250 1    60   ~ 0
SEGB
Text Label 3650 5250 1    60   ~ 0
SEGC
Text Label 4050 5250 1    60   ~ 0
SEGD
$Comp
L R R9
U 1 1 5874E8D6
P 6350 4750
F 0 "R9" V 6430 4750 50  0000 C CNN
F 1 "130" V 6350 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6280 4750 50  0001 C CNN
F 3 "" H 6350 4750 50  0000 C CNN
	1    6350 4750
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 5874EAEA
P 7850 4750
F 0 "R11" V 7930 4750 50  0000 C CNN
F 1 "130" V 7850 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7780 4750 50  0001 C CNN
F 3 "" H 7850 4750 50  0000 C CNN
	1    7850 4750
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 5874EE68
P 9350 4750
F 0 "R13" V 9430 4750 50  0000 C CNN
F 1 "130" V 9350 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9280 4750 50  0001 C CNN
F 3 "" H 9350 4750 50  0000 C CNN
	1    9350 4750
	0    1    1    0   
$EndComp
Text Label 6200 4750 2    60   ~ 0
SEGA
Text Label 7700 4750 2    60   ~ 0
SEGA
Text Label 9200 4750 2    60   ~ 0
SEGA
Text Label 6800 4050 1    60   ~ 0
K-R
Text Label 8300 4050 1    60   ~ 0
K-G
Text Label 9800 4050 1    60   ~ 0
K-B
$Comp
L R R15
U 1 1 58752E32
P 3400 2550
F 0 "R15" V 3480 2550 50  0000 C CNN
F 1 "10k" V 3400 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3330 2550 50  0001 C CNN
F 3 "" H 3400 2550 50  0000 C CNN
	1    3400 2550
	1    0    0    -1  
$EndComp
Connection ~ 3400 2850
$Comp
L +3V3 #PWR09
U 1 1 58752F6F
P 3400 2400
F 0 "#PWR09" H 3400 2250 50  0001 C CNN
F 1 "+3V3" H 3400 2540 50  0000 C CNN
F 2 "" H 3400 2400 50  0000 C CNN
F 3 "" H 3400 2400 50  0000 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
$Comp
L Diode D1
U 1 1 58770B65
P 2850 5850
F 0 "D1" H 2800 5750 60  0000 C CNN
F 1 "Diode" H 2800 5950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 2850 5850 60  0001 C CNN
F 3 "" H 2850 5850 60  0001 C CNN
	1    2850 5850
	0    1    1    0   
$EndComp
$Comp
L Diode D2
U 1 1 5877109C
P 3250 5850
F 0 "D2" H 3200 5750 60  0000 C CNN
F 1 "Diode" H 3200 5950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3250 5850 60  0001 C CNN
F 3 "" H 3250 5850 60  0001 C CNN
	1    3250 5850
	0    1    1    0   
$EndComp
$Comp
L Diode D3
U 1 1 58771107
P 3650 5850
F 0 "D3" H 3600 5750 60  0000 C CNN
F 1 "Diode" H 3600 5950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3650 5850 60  0001 C CNN
F 3 "" H 3650 5850 60  0001 C CNN
	1    3650 5850
	0    1    1    0   
$EndComp
$Comp
L Diode D4
U 1 1 5877116C
P 4050 5850
F 0 "D4" H 4000 5750 60  0000 C CNN
F 1 "Diode" H 4000 5950 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4050 5850 60  0001 C CNN
F 3 "" H 4050 5850 60  0001 C CNN
	1    4050 5850
	0    1    1    0   
$EndComp
$Comp
L Q_NPN_BEC Q1
U 1 1 5877539A
P 6700 4750
F 0 "Q1" H 6900 4800 50  0000 L CNN
F 1 "Q_NPN_BEC" H 6900 4700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 6900 4850 50  0001 C CNN
F 3 "" H 6700 4750 50  0000 C CNN
	1    6700 4750
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_BEC Q2
U 1 1 587753FD
P 8200 4750
F 0 "Q2" H 8400 4800 50  0000 L CNN
F 1 "Q_NPN_BEC" H 8400 4700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8400 4850 50  0001 C CNN
F 3 "" H 8200 4750 50  0000 C CNN
	1    8200 4750
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_BEC Q3
U 1 1 5877545C
P 9700 4750
F 0 "Q3" H 9900 4800 50  0000 L CNN
F 1 "Q_NPN_BEC" H 9900 4700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 9900 4850 50  0001 C CNN
F 3 "" H 9700 4750 50  0000 C CNN
	1    9700 4750
	1    0    0    -1  
$EndComp
Text Label 4800 1300 0    60   ~ 0
DIG0
Text Label 4800 1400 0    60   ~ 0
SEGA
Text Label 4800 1500 0    60   ~ 0
SEGF
Text Label 4800 1600 0    60   ~ 0
DIG1
Text Label 4800 1700 0    60   ~ 0
DIG2
$EndSCHEMATC
