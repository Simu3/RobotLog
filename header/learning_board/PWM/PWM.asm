
_Main:

;PWM.c,3 :: 		void Main()
;PWM.c,7 :: 		Setup();
	CALL       _Setup+0
;PWM.c,9 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM.c,11 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM.c,13 :: 		while(1){
L_Main0:
;PWM.c,14 :: 		for(i = 0; i < 255; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main2:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main7
	MOVLW      255
	SUBWF      Main_i_L0+0, 0
L__Main7:
	BTFSC      STATUS+0, 0
	GOTO       L_Main3
;PWM.c,15 :: 		PWM1_Set_Duty(i);
	MOVF       Main_i_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM.c,16 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Main5:
	DECFSZ     R13, 1
	GOTO       L_Main5
	DECFSZ     R12, 1
	GOTO       L_Main5
	NOP
;PWM.c,14 :: 		for(i = 0; i < 255; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;PWM.c,17 :: 		}
	GOTO       L_Main2
L_Main3:
;PWM.c,18 :: 		}
	GOTO       L_Main0
;PWM.c,19 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;PWM.c,21 :: 		void Setup()
;PWM.c,23 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;PWM.c,25 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;PWM.c,27 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;PWM.c,29 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;PWM.c,30 :: 		}
L_end_Setup:
	RETURN
; end of _Setup
