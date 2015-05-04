
_Main:

;infrared_distance.c,11 :: 		void Main()
;infrared_distance.c,16 :: 		Setup();
	CALL       _Setup+0
;infrared_distance.c,18 :: 		front_sensor = back_sensor = 0;
	CLRF       Main_back_sensor_L0+0
	CLRF       Main_back_sensor_L0+1
	CLRF       Main_front_sensor_L0+0
	CLRF       Main_front_sensor_L0+1
;infrared_distance.c,19 :: 		front_state = back_state = OFF;
	BCF        Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	BTFSC      Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	GOTO       L__Main32
	BCF        Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
	GOTO       L__Main33
L__Main32:
	BSF        Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
L__Main33:
;infrared_distance.c,21 :: 		Air_Cylinder_Down();
	BSF        PORTA+0, 4
	BCF        PORTA+0, 5
;infrared_distance.c,23 :: 		while(1){
L_Main0:
;infrared_distance.c,24 :: 		front_sensor = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      Main_front_sensor_L0+0
	MOVF       R1, 0
	MOVWF      Main_front_sensor_L0+1
;infrared_distance.c,25 :: 		back_sensor  = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      Main_back_sensor_L0+0
	MOVF       R1, 0
	MOVWF      Main_back_sensor_L0+1
;infrared_distance.c,27 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_Main2:
	DECFSZ     R13, 1
	GOTO       L_Main2
	DECFSZ     R12, 1
	GOTO       L_Main2
	NOP
	NOP
;infrared_distance.c,31 :: 		if(front_sensor > LIMIT && front_state == OFF){
	MOVLW      128
	XORLW      2
	MOVWF      R0
	MOVLW      128
	XORWF      Main_front_sensor_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main34
	MOVF       Main_front_sensor_L0+0, 0
	SUBLW      88
L__Main34:
	BTFSC      STATUS+0, 0
	GOTO       L_Main5
	BTFSC      Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
	GOTO       L_Main5
L__Main30:
;infrared_distance.c,32 :: 		Air_Cylinder_Up();
	BCF        PORTA+0, 4
	BSF        PORTA+0, 5
;infrared_distance.c,33 :: 		front_state = ON;
	BSF        Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
;infrared_distance.c,34 :: 		}
	GOTO       L_Main6
L_Main5:
;infrared_distance.c,35 :: 		else if(back_sensor > LIMIT && back_state == OFF){
	MOVLW      128
	XORLW      2
	MOVWF      R0
	MOVLW      128
	XORWF      Main_back_sensor_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main35
	MOVF       Main_back_sensor_L0+0, 0
	SUBLW      88
L__Main35:
	BTFSC      STATUS+0, 0
	GOTO       L_Main9
	BTFSC      Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	GOTO       L_Main9
L__Main29:
;infrared_distance.c,36 :: 		Air_Cylinder_Up();
	BCF        PORTA+0, 4
	BSF        PORTA+0, 5
;infrared_distance.c,37 :: 		back_state = ON;
	BSF        Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
;infrared_distance.c,38 :: 		}
	GOTO       L_Main10
L_Main9:
;infrared_distance.c,39 :: 		else if(front_state == ON && back_state == ON && front_sensor < LIMIT && back_sensor < LIMIT){
	BTFSS      Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
	GOTO       L_Main13
	BTFSS      Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	GOTO       L_Main13
	MOVLW      128
	XORWF      Main_front_sensor_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      2
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main36
	MOVLW      88
	SUBWF      Main_front_sensor_L0+0, 0
L__Main36:
	BTFSC      STATUS+0, 0
	GOTO       L_Main13
	MOVLW      128
	XORWF      Main_back_sensor_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      2
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main37
	MOVLW      88
	SUBWF      Main_back_sensor_L0+0, 0
L__Main37:
	BTFSC      STATUS+0, 0
	GOTO       L_Main13
L__Main28:
;infrared_distance.c,40 :: 		Air_Cylinder_Down();
	BSF        PORTA+0, 4
	BCF        PORTA+0, 5
;infrared_distance.c,41 :: 		front_state = back_state = OFF;
	BCF        Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	BTFSC      Main_back_state_L0+0, BitPos(Main_back_state_L0+0)
	GOTO       L__Main38
	BCF        Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
	GOTO       L__Main39
L__Main38:
	BSF        Main_front_state_L0+0, BitPos(Main_front_state_L0+0)
L__Main39:
;infrared_distance.c,42 :: 		}
L_Main13:
L_Main10:
L_Main6:
;infrared_distance.c,43 :: 		}
	GOTO       L_Main0
;infrared_distance.c,44 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;infrared_distance.c,46 :: 		void Setup()
;infrared_distance.c,48 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;infrared_distance.c,50 :: 		ANSELA = 0x06;
	MOVLW      6
	MOVWF      ANSELA+0
;infrared_distance.c,51 :: 		TRISA  = 0x06;
	MOVLW      6
	MOVWF      TRISA+0
;infrared_distance.c,53 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;infrared_distance.c,55 :: 		ADC_Init();
	CALL       _ADC_Init+0
;infrared_distance.c,62 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Setup14:
	DECFSZ     R13, 1
	GOTO       L_Setup14
	DECFSZ     R12, 1
	GOTO       L_Setup14
	NOP
;infrared_distance.c,63 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Debug:

;infrared_distance.c,65 :: 		void Debug(int front_sensor, int back_sensor)
;infrared_distance.c,69 :: 		tmp = front_sensor;
	MOVF       FARG_Debug_front_sensor+0, 0
	MOVWF      Debug_tmp_L0+0
	MOVF       FARG_Debug_front_sensor+1, 0
	MOVWF      Debug_tmp_L0+1
;infrared_distance.c,70 :: 		UART1_write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       FARG_Debug_front_sensor+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_front_sensor+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,71 :: 		UART1_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,72 :: 		UART1_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,73 :: 		UART1_write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,75 :: 		UART1_write(' ');
	MOVLW      32
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,77 :: 		tmp = back_sensor;
	MOVF       FARG_Debug_back_sensor+0, 0
	MOVWF      Debug_tmp_L0+0
	MOVF       FARG_Debug_back_sensor+1, 0
	MOVWF      Debug_tmp_L0+1
;infrared_distance.c,78 :: 		UART1_write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       FARG_Debug_back_sensor+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_back_sensor+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,79 :: 		UART1_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,80 :: 		UART1_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,81 :: 		UART1_write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,83 :: 		UART1_write('\n');
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;infrared_distance.c,84 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_Dec2Ascii:

;infrared_distance.c,86 :: 		char Dec2Ascii(char dec)
;infrared_distance.c,88 :: 		switch(dec){
	GOTO       L_Dec2Ascii15
;infrared_distance.c,89 :: 		case 0:  return '0';
L_Dec2Ascii17:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,90 :: 		case 1:  return '1';
L_Dec2Ascii18:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,91 :: 		case 2:  return '2';
L_Dec2Ascii19:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,92 :: 		case 3:  return '3';
L_Dec2Ascii20:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,93 :: 		case 4:  return '4';
L_Dec2Ascii21:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,94 :: 		case 5:  return '5';
L_Dec2Ascii22:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,95 :: 		case 6:  return '6';
L_Dec2Ascii23:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,96 :: 		case 7:  return '7';
L_Dec2Ascii24:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,97 :: 		case 8:  return '8';
L_Dec2Ascii25:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,98 :: 		case 9:  return '9';
L_Dec2Ascii26:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,99 :: 		default: return '*';
L_Dec2Ascii27:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;infrared_distance.c,100 :: 		}
L_Dec2Ascii15:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii17
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii18
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii19
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii20
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii21
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii22
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii23
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii24
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii25
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii26
	GOTO       L_Dec2Ascii27
;infrared_distance.c,101 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
