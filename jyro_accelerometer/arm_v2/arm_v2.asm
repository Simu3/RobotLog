
_Main:

;arm_v2.c,10 :: 		void Main()
;arm_v2.c,12 :: 		SetUp();
	CALL       _SetUp+0
;arm_v2.c,14 :: 		while(1){
L_Main0:
;arm_v2.c,15 :: 		SetPosition(ROLL_ID,  ROLL_CENTER);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      4
	MOVWF      FARG_SetPosition+0
	MOVLW      41
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;arm_v2.c,16 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Main2:
	DECFSZ     R13, 1
	GOTO       L_Main2
	DECFSZ     R12, 1
	GOTO       L_Main2
	DECFSZ     R11, 1
	GOTO       L_Main2
	NOP
	NOP
;arm_v2.c,17 :: 		SetPosition(PITCH_ID, PITCH_CENTER);
	CLRF       FARG_SetPosition+0
	MOVLW      192
	MOVWF      FARG_SetPosition+0
	MOVLW      18
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;arm_v2.c,18 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_Main3:
	DECFSZ     R13, 1
	GOTO       L_Main3
	DECFSZ     R12, 1
	GOTO       L_Main3
	DECFSZ     R11, 1
	GOTO       L_Main3
	NOP
	NOP
;arm_v2.c,19 :: 		}
	GOTO       L_Main0
;arm_v2.c,20 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;arm_v2.c,22 :: 		void SetUp()
;arm_v2.c,24 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;arm_v2.c,26 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;arm_v2.c,28 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;arm_v2.c,29 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;arm_v2.c,30 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;arm_v2.c,31 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;arm_v2.c,33 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;arm_v2.c,34 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;arm_v2.c,35 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;arm_v2.c,36 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;arm_v2.c,37 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;arm_v2.c,39 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;arm_v2.c,40 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;arm_v2.c,41 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;arm_v2.c,42 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;arm_v2.c,43 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;arm_v2.c,45 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;arm_v2.c,47 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp4:
	DECFSZ     R13, 1
	GOTO       L_SetUp4
	DECFSZ     R12, 1
	GOTO       L_SetUp4
	NOP
;arm_v2.c,48 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_SetPosition:

;arm_v2.c,50 :: 		void SetPosition(unsigned char id, int position)
;arm_v2.c,54 :: 		cmd   = 0x80 | id;
	MOVLW      128
	IORWF       FARG_SetPosition_id+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      SetPosition_cmd_L0+0
;arm_v2.c,55 :: 		pos_h = (unsigned char)((position >> 7) & 0x7F);
	MOVLW      7
	MOVWF      R2
	MOVF       FARG_SetPosition_position+0, 0
	MOVWF      R0
	MOVF       FARG_SetPosition_position+1, 0
	MOVWF      R1
	MOVF       R2, 0
L__SetPosition9:
	BTFSC      STATUS+0, 2
	GOTO       L__SetPosition10
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__SetPosition9
L__SetPosition10:
	MOVLW      127
	ANDWF      R0, 0
	MOVWF      SetPosition_pos_h_L0+0
;arm_v2.c,56 :: 		pos_l = (unsigned char)(position & 0x7F);
	MOVLW      127
	ANDWF      FARG_SetPosition_position+0, 0
	MOVWF      SetPosition_pos_l_L0+0
;arm_v2.c,58 :: 		TXSTA.TX9D = ParityCheck(cmd);
	MOVF       R3, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition11
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition12
L__SetPosition11:
	BSF        TXSTA+0, 0
L__SetPosition12:
;arm_v2.c,59 :: 		UART1_Write(cmd);
	MOVF       SetPosition_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm_v2.c,60 :: 		TXSTA.TX9D = ParityCheck(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition13
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition14
L__SetPosition13:
	BSF        TXSTA+0, 0
L__SetPosition14:
;arm_v2.c,61 :: 		UART1_Write(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm_v2.c,62 :: 		TXSTA.TX9D = ParityCheck(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition15
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition16
L__SetPosition15:
	BSF        TXSTA+0, 0
L__SetPosition16:
;arm_v2.c,63 :: 		UART1_Write(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm_v2.c,65 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13
L_SetPosition5:
	DECFSZ     R13, 1
	GOTO       L_SetPosition5
	NOP
;arm_v2.c,66 :: 		}
L_end_SetPosition:
	RETURN
; end of _SetPosition

_ParityCheck:

;arm_v2.c,68 :: 		char ParityCheck(unsigned char _data)
;arm_v2.c,70 :: 		return ((_data & 0b10000000) >> 7) ^
	MOVLW      128
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R1
	MOVLW      7
	MOVWF      R0
	MOVF       R1, 0
	MOVWF      R3
	MOVF       R0, 0
L__ParityCheck18:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck19
	LSRF       R3, 1
	ADDLW      255
	GOTO       L__ParityCheck18
L__ParityCheck19:
;arm_v2.c,71 :: 		((_data & 0b01000000) >> 6) ^
	MOVLW      64
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck20:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck21
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck20
L__ParityCheck21:
	MOVF       R0, 0
	XORWF      R3, 1
;arm_v2.c,72 :: 		((_data & 0b00100000) >> 5) ^
	MOVLW      32
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      5
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck22:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck23
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck22
L__ParityCheck23:
	MOVF       R0, 0
	XORWF      R3, 1
;arm_v2.c,73 :: 		((_data & 0b00010000) >> 4) ^
	MOVLW      16
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm_v2.c,74 :: 		((_data & 0b00001000) >> 3) ^
	MOVLW      8
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm_v2.c,75 :: 		((_data & 0b00000100) >> 2) ^
	MOVLW      4
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm_v2.c,76 :: 		((_data & 0b00000010) >> 1) ^
	MOVLW      2
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 0
	MOVWF      R1
;arm_v2.c,77 :: 		(_data & 0b00000001);
	MOVLW      1
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	XORWF      R0, 1
;arm_v2.c,78 :: 		}
L_end_ParityCheck:
	RETURN
; end of _ParityCheck
