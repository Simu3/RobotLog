
_main:

;servo_ID.c,8 :: 		void main()
;servo_ID.c,10 :: 		SetUp();
	CALL       _SetUp+0
;servo_ID.c,12 :: 		SetID(ID);
	MOVLW      1
	MOVWF      FARG_SetID+0
	CALL       _SetID+0
;servo_ID.c,14 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main0:
	DECFSZ     R13, 1
	GOTO       L_main0
	DECFSZ     R12, 1
	GOTO       L_main0
	DECFSZ     R11, 1
	GOTO       L_main0
	NOP
	NOP
;servo_ID.c,16 :: 		while(1){
L_main1:
;servo_ID.c,17 :: 		SetPosition(ID, 6000);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      112
	MOVWF      FARG_SetPosition+0
	MOVLW      23
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;servo_ID.c,18 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main3:
	DECFSZ     R13, 1
	GOTO       L_main3
	DECFSZ     R12, 1
	GOTO       L_main3
	DECFSZ     R11, 1
	GOTO       L_main3
	NOP
	NOP
;servo_ID.c,20 :: 		SetPosition(ID, 6150);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      6
	MOVWF      FARG_SetPosition+0
	MOVLW      24
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;servo_ID.c,21 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
	NOP
	NOP
;servo_ID.c,23 :: 		SetPosition(ID, 6000);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      112
	MOVWF      FARG_SetPosition+0
	MOVLW      23
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;servo_ID.c,24 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	DECFSZ     R11, 1
	GOTO       L_main5
	NOP
	NOP
;servo_ID.c,26 :: 		SetPosition(ID, 5850);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      218
	MOVWF      FARG_SetPosition+0
	MOVLW      22
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;servo_ID.c,27 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main6:
	DECFSZ     R13, 1
	GOTO       L_main6
	DECFSZ     R12, 1
	GOTO       L_main6
	DECFSZ     R11, 1
	GOTO       L_main6
	NOP
	NOP
;servo_ID.c,28 :: 		}
	GOTO       L_main1
;servo_ID.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_SetUp:

;servo_ID.c,31 :: 		void SetUp()
;servo_ID.c,33 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;servo_ID.c,35 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;servo_ID.c,36 :: 		TRISA  = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;servo_ID.c,37 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;servo_ID.c,39 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;servo_ID.c,41 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;servo_ID.c,42 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_SetID:

;servo_ID.c,44 :: 		void SetID(unsigned char id)
;servo_ID.c,48 :: 		cmd = 0xE0 | id;
	MOVLW      224
	IORWF       FARG_SetID_id+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      SetID_cmd_L0+0
;servo_ID.c,49 :: 		sc  = 0x01;
	MOVLW      1
	MOVWF      SetID_sc_L0+0
;servo_ID.c,51 :: 		TXSTA.TX9D = ParityCheck(cmd);
	MOVF       R0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetID12
	BCF        TXSTA+0, 0
	GOTO       L__SetID13
L__SetID12:
	BSF        TXSTA+0, 0
L__SetID13:
;servo_ID.c,52 :: 		UART1_write(cmd);
	MOVF       SetID_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,53 :: 		TXSTA.TX9D = ParityCheck(sc);
	MOVF       SetID_sc_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetID14
	BCF        TXSTA+0, 0
	GOTO       L__SetID15
L__SetID14:
	BSF        TXSTA+0, 0
L__SetID15:
;servo_ID.c,54 :: 		UART1_Write(sc);
	MOVF       SetID_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,55 :: 		UART1_Write(sc);
	MOVF       SetID_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,56 :: 		UART1_Write(sc);
	MOVF       SetID_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,58 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13
L_SetID7:
	DECFSZ     R13, 1
	GOTO       L_SetID7
	NOP
;servo_ID.c,59 :: 		}
L_end_SetID:
	RETURN
; end of _SetID

_SetPosition:

;servo_ID.c,61 :: 		void SetPosition(unsigned char id, int position)
;servo_ID.c,65 :: 		cmd   = 0x80 | id;
	MOVLW      128
	IORWF       FARG_SetPosition_id+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      SetPosition_cmd_L0+0
;servo_ID.c,66 :: 		pos_h = (unsigned char)((position >> 7) & 0x7F);
	MOVLW      7
	MOVWF      R2
	MOVF       FARG_SetPosition_position+0, 0
	MOVWF      R0
	MOVF       FARG_SetPosition_position+1, 0
	MOVWF      R1
	MOVF       R2, 0
L__SetPosition17:
	BTFSC      STATUS+0, 2
	GOTO       L__SetPosition18
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__SetPosition17
L__SetPosition18:
	MOVLW      127
	ANDWF      R0, 0
	MOVWF      SetPosition_pos_h_L0+0
;servo_ID.c,67 :: 		pos_l = (unsigned char)(position & 0x7F);
	MOVLW      127
	ANDWF      FARG_SetPosition_position+0, 0
	MOVWF      SetPosition_pos_l_L0+0
;servo_ID.c,69 :: 		TXSTA.TX9D = ParityCheck(cmd);
	MOVF       R3, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition19
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition20
L__SetPosition19:
	BSF        TXSTA+0, 0
L__SetPosition20:
;servo_ID.c,70 :: 		UART1_Write(cmd);
	MOVF       SetPosition_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,71 :: 		TXSTA.TX9D = ParityCheck(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition21
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition22
L__SetPosition21:
	BSF        TXSTA+0, 0
L__SetPosition22:
;servo_ID.c,72 :: 		UART1_Write(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,73 :: 		TXSTA.TX9D = ParityCheck(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition23
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition24
L__SetPosition23:
	BSF        TXSTA+0, 0
L__SetPosition24:
;servo_ID.c,74 :: 		UART1_Write(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_ID.c,76 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13
L_SetPosition8:
	DECFSZ     R13, 1
	GOTO       L_SetPosition8
	NOP
;servo_ID.c,77 :: 		}
L_end_SetPosition:
	RETURN
; end of _SetPosition

_ParityCheck:

;servo_ID.c,79 :: 		char ParityCheck(unsigned char _data)
;servo_ID.c,81 :: 		return ((_data & 0b10000000) >> 7) ^
	MOVLW      128
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R1
	MOVLW      7
	MOVWF      R0
	MOVF       R1, 0
	MOVWF      R3
	MOVF       R0, 0
L__ParityCheck26:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck27
	LSRF       R3, 1
	ADDLW      255
	GOTO       L__ParityCheck26
L__ParityCheck27:
;servo_ID.c,82 :: 		((_data & 0b01000000) >> 6) ^
	MOVLW      64
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck28:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck29
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck28
L__ParityCheck29:
	MOVF       R0, 0
	XORWF      R3, 1
;servo_ID.c,83 :: 		((_data & 0b00100000) >> 5) ^
	MOVLW      32
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      5
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck30:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck31
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck30
L__ParityCheck31:
	MOVF       R0, 0
	XORWF      R3, 1
;servo_ID.c,84 :: 		((_data & 0b00010000) >> 4) ^
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
;servo_ID.c,85 :: 		((_data & 0b00001000) >> 3) ^
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
;servo_ID.c,86 :: 		((_data & 0b00000100) >> 2) ^
	MOVLW      4
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;servo_ID.c,87 :: 		((_data & 0b00000010) >> 1) ^
	MOVLW      2
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 0
	MOVWF      R1
;servo_ID.c,88 :: 		(_data & 0b00000001);
	MOVLW      1
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	XORWF      R0, 1
;servo_ID.c,89 :: 		}
L_end_ParityCheck:
	RETURN
; end of _ParityCheck
