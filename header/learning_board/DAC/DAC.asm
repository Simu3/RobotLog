
_Main:

;DAC.c,4 :: 		void Main()
;DAC.c,8 :: 		Setup();
	CALL       _Setup+0
;DAC.c,10 :: 		DAC_Init();
	CALL       _DAC_Init+0
;DAC.c,12 :: 		while(1){
L_Main0:
;DAC.c,15 :: 		for(i = 15; i < 32; i ++){
	MOVLW      15
	MOVWF      Main_i_L0+0
	MOVLW      0
	MOVWF      Main_i_L0+1
L_Main2:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main11
	MOVLW      32
	SUBWF      Main_i_L0+0, 0
L__Main11:
	BTFSC      STATUS+0, 0
	GOTO       L_Main3
;DAC.c,16 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;DAC.c,17 :: 		Delay_ms(80);
	MOVLW      208
	MOVWF      R12
	MOVLW      201
	MOVWF      R13
L_Main5:
	DECFSZ     R13, 1
	GOTO       L_Main5
	DECFSZ     R12, 1
	GOTO       L_Main5
	NOP
	NOP
;DAC.c,15 :: 		for(i = 15; i < 32; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;DAC.c,18 :: 		}
	GOTO       L_Main2
L_Main3:
;DAC.c,19 :: 		for(i = 31; i > 15; i --){
	MOVLW      31
	MOVWF      Main_i_L0+0
	MOVLW      0
	MOVWF      Main_i_L0+1
L_Main6:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main12
	MOVF       Main_i_L0+0, 0
	SUBLW      15
L__Main12:
	BTFSC      STATUS+0, 0
	GOTO       L_Main7
;DAC.c,20 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;DAC.c,21 :: 		Delay_ms(80);
	MOVLW      208
	MOVWF      R12
	MOVLW      201
	MOVWF      R13
L_Main9:
	DECFSZ     R13, 1
	GOTO       L_Main9
	DECFSZ     R12, 1
	GOTO       L_Main9
	NOP
	NOP
;DAC.c,19 :: 		for(i = 31; i > 15; i --){
	MOVLW      1
	SUBWF      Main_i_L0+0, 1
	MOVLW      0
	SUBWFB     Main_i_L0+1, 1
;DAC.c,22 :: 		}
	GOTO       L_Main6
L_Main7:
;DAC.c,23 :: 		}
	GOTO       L_Main0
;DAC.c,24 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;DAC.c,26 :: 		void Setup()
;DAC.c,28 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;DAC.c,30 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;DAC.c,32 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;DAC.c,34 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;DAC.c,35 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_DAC_Init:

;DAC.c,37 :: 		void DAC_Init()
;DAC.c,39 :: 		DACCON0 = 0xE0;
	MOVLW      224
	MOVWF      DACCON0+0
;DAC.c,40 :: 		DACCON1 = 0x00;  //(Vdd * (DACCON1 / 2^5))
	CLRF       DACCON1+0
;DAC.c,41 :: 		}
L_end_DAC_Init:
	RETURN
; end of _DAC_Init
