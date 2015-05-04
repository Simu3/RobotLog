
_Main:

;ADC.c,7 :: 		void Main()
;ADC.c,11 :: 		Setup();
	CALL       _Setup+0
;ADC.c,13 :: 		DAC_Init();
	CALL       _DAC_Init+0
;ADC.c,15 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC.c,17 :: 		while(1){
L_Main0:
;ADC.c,18 :: 		tmp = ADC_Read(AN_pin);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;ADC.c,19 :: 		DACCON1 = map(tmp, 0, 1023, 0, 31);
	MOVF       R0, 0
	MOVWF      FARG_map+0
	MOVF       R1, 0
	MOVWF      FARG_map+1
	CLRF       FARG_map+0
	CLRF       FARG_map+1
	MOVLW      255
	MOVWF      FARG_map+0
	MOVLW      3
	MOVWF      FARG_map+1
	CLRF       FARG_map+0
	CLRF       FARG_map+1
	MOVLW      31
	MOVWF      FARG_map+0
	MOVLW      0
	MOVWF      FARG_map+1
	CALL       _map+0
	MOVF       R0, 0
	MOVWF      DACCON1+0
;ADC.c,20 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13
L_Main2:
	DECFSZ     R13, 1
	GOTO       L_Main2
	NOP
;ADC.c,21 :: 		}
	GOTO       L_Main0
;ADC.c,22 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;ADC.c,24 :: 		void Setup()
;ADC.c,26 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;ADC.c,28 :: 		ANSELA = 0x02;
	MOVLW      2
	MOVWF      ANSELA+0
;ADC.c,30 :: 		TRISA  = 0x02;
	MOVLW      2
	MOVWF      TRISA+0
;ADC.c,32 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;ADC.c,33 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_DAC_Init:

;ADC.c,35 :: 		void DAC_Init()
;ADC.c,37 :: 		DACCON0 = 0xE0;
	MOVLW      224
	MOVWF      DACCON0+0
;ADC.c,38 :: 		DACCON1 = 0x00;  //(Vdd * (DACCON1 / 2^5))
	CLRF       DACCON1+0
;ADC.c,39 :: 		}
L_end_DAC_Init:
	RETURN
; end of _DAC_Init

_map:

;ADC.c,41 :: 		int map(int val, int from_low, int from_high, int to_low, int to_high)
;ADC.c,43 :: 		return (val - from_low) * (to_high - to_low) / (from_high - from_low) + to_low;
	MOVF       FARG_map_from_low+0, 0
	SUBWF      FARG_map_val+0, 0
	MOVWF      R4
	MOVF       FARG_map_from_low+1, 0
	SUBWFB     FARG_map_val+1, 0
	MOVWF      R5
	MOVF       FARG_map_to_low+0, 0
	SUBWF      FARG_map_to_high+0, 0
	MOVWF      R0
	MOVF       FARG_map_to_low+1, 0
	SUBWFB     FARG_map_to_high+1, 0
	MOVWF      R1
	CALL       _Mul_16x16_U+0
	MOVF       FARG_map_from_low+0, 0
	SUBWF      FARG_map_from_high+0, 0
	MOVWF      R4
	MOVF       FARG_map_from_low+1, 0
	SUBWFB     FARG_map_from_high+1, 0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       FARG_map_to_low+0, 0
	ADDWF      R0, 1
	MOVF       FARG_map_to_low+1, 0
	ADDWFC     R1, 1
;ADC.c,44 :: 		}
L_end_map:
	RETURN
; end of _map
