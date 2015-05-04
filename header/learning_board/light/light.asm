
_Main:

;light.c,4 :: 		void Main()
;light.c,8 :: 		Setup();
	CALL       _Setup+0
;light.c,10 :: 		DAC_Init();
	CALL       _DAC_Init+0
;light.c,12 :: 		count = 0;
	CLRF       Main_count_L0+0
	CLRF       Main_count_L0+1
;light.c,14 :: 		while(1){
L_Main0:
;light.c,15 :: 		for(i = 26; i < 31; i ++){
	MOVLW      26
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
	GOTO       L__Main23
	MOVLW      31
	SUBWF      Main_i_L0+0, 0
L__Main23:
	BTFSC      STATUS+0, 0
	GOTO       L_Main3
;light.c,16 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;light.c,17 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main5:
	DECFSZ     R13, 1
	GOTO       L_Main5
	DECFSZ     R12, 1
	GOTO       L_Main5
	DECFSZ     R11, 1
	GOTO       L_Main5
	NOP
	NOP
;light.c,18 :: 		count ++;
	INCF       Main_count_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_count_L0+1, 1
;light.c,15 :: 		for(i = 26; i < 31; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;light.c,19 :: 		}
	GOTO       L_Main2
L_Main3:
;light.c,20 :: 		for(i = 31; i > 26; i --){
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
	GOTO       L__Main24
	MOVF       Main_i_L0+0, 0
	SUBLW      26
L__Main24:
	BTFSC      STATUS+0, 0
	GOTO       L_Main7
;light.c,21 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;light.c,22 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main9:
	DECFSZ     R13, 1
	GOTO       L_Main9
	DECFSZ     R12, 1
	GOTO       L_Main9
	DECFSZ     R11, 1
	GOTO       L_Main9
	NOP
	NOP
;light.c,23 :: 		count ++;
	INCF       Main_count_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_count_L0+1, 1
;light.c,20 :: 		for(i = 31; i > 26; i --){
	MOVLW      1
	SUBWF      Main_i_L0+0, 1
	MOVLW      0
	SUBWFB     Main_i_L0+1, 1
;light.c,24 :: 		}
	GOTO       L_Main6
L_Main7:
;light.c,26 :: 		if(count >= 180){
	MOVLW      128
	XORWF      Main_count_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main25
	MOVLW      180
	SUBWF      Main_count_L0+0, 0
L__Main25:
	BTFSS      STATUS+0, 0
	GOTO       L_Main10
;light.c,27 :: 		DACCON1 = 0;
	CLRF       DACCON1+0
;light.c,28 :: 		Delay_ms(20000);
	MOVLW      203
	MOVWF      R11
	MOVLW      236
	MOVWF      R12
	MOVLW      132
	MOVWF      R13
L_Main11:
	DECFSZ     R13, 1
	GOTO       L_Main11
	DECFSZ     R12, 1
	GOTO       L_Main11
	DECFSZ     R11, 1
	GOTO       L_Main11
	NOP
;light.c,29 :: 		while(1){
L_Main12:
;light.c,30 :: 		for(i = 26; i < 31; i ++){
	MOVLW      26
	MOVWF      Main_i_L0+0
	MOVLW      0
	MOVWF      Main_i_L0+1
L_Main14:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main26
	MOVLW      31
	SUBWF      Main_i_L0+0, 0
L__Main26:
	BTFSC      STATUS+0, 0
	GOTO       L_Main15
;light.c,31 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;light.c,32 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main17:
	DECFSZ     R13, 1
	GOTO       L_Main17
	DECFSZ     R12, 1
	GOTO       L_Main17
	DECFSZ     R11, 1
	GOTO       L_Main17
	NOP
	NOP
;light.c,30 :: 		for(i = 26; i < 31; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;light.c,33 :: 		}
	GOTO       L_Main14
L_Main15:
;light.c,34 :: 		for(i = 31; i > 26; i --){
	MOVLW      31
	MOVWF      Main_i_L0+0
	MOVLW      0
	MOVWF      Main_i_L0+1
L_Main18:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main27
	MOVF       Main_i_L0+0, 0
	SUBLW      26
L__Main27:
	BTFSC      STATUS+0, 0
	GOTO       L_Main19
;light.c,35 :: 		DACCON1 = i;
	MOVF       Main_i_L0+0, 0
	MOVWF      DACCON1+0
;light.c,36 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main21:
	DECFSZ     R13, 1
	GOTO       L_Main21
	DECFSZ     R12, 1
	GOTO       L_Main21
	DECFSZ     R11, 1
	GOTO       L_Main21
	NOP
	NOP
;light.c,34 :: 		for(i = 31; i > 26; i --){
	MOVLW      1
	SUBWF      Main_i_L0+0, 1
	MOVLW      0
	SUBWFB     Main_i_L0+1, 1
;light.c,37 :: 		}
	GOTO       L_Main18
L_Main19:
;light.c,38 :: 		}
	GOTO       L_Main12
;light.c,39 :: 		}
L_Main10:
;light.c,40 :: 		}
	GOTO       L_Main0
;light.c,41 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;light.c,43 :: 		void Setup()
;light.c,45 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;light.c,47 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;light.c,49 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;light.c,51 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;light.c,52 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_DAC_Init:

;light.c,54 :: 		void DAC_Init()
;light.c,56 :: 		DACCON0 = 0xE0;
	MOVLW      224
	MOVWF      DACCON0+0
;light.c,57 :: 		DACCON1 = 0x00;  //(Vdd * (DACCON1 / 2^5))
	CLRF       DACCON1+0
;light.c,58 :: 		}
L_end_DAC_Init:
	RETURN
; end of _DAC_Init
