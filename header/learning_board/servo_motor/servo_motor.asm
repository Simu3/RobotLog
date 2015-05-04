
_main:

;servo_motor.c,9 :: 		void main()
;servo_motor.c,11 :: 		setup();
	CALL       _setup+0
;servo_motor.c,13 :: 		set_id(0);
	CLRF       FARG_set_id+0
	CALL       _set_id+0
;servo_motor.c,15 :: 		while(1){
L_main0:
;servo_motor.c,16 :: 		set_parameter(SPEED, 0, 100);
	MOVLW      2
	MOVWF      FARG_set_parameter+0
	CLRF       FARG_set_parameter+0
	MOVLW      100
	MOVWF      FARG_set_parameter+0
	CALL       _set_parameter+0
;servo_motor.c,17 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	DECFSZ     R11, 1
	GOTO       L_main2
	NOP
;servo_motor.c,19 :: 		set_position(0, 7500);
	CLRF       FARG_set_position+0
	MOVLW      76
	MOVWF      FARG_set_position+0
	MOVLW      29
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;servo_motor.c,20 :: 		delay_ms(1000);
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
;servo_motor.c,21 :: 		}
	GOTO       L_main0
;servo_motor.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;servo_motor.c,24 :: 		void setup()
;servo_motor.c,26 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;servo_motor.c,28 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;servo_motor.c,29 :: 		TRISA  = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;servo_motor.c,30 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;servo_motor.c,32 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;servo_motor.c,34 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;servo_motor.c,35 :: 		}
L_end_setup:
	RETURN
; end of _setup

_set_id:

;servo_motor.c,37 :: 		void set_id(unsigned char id)
;servo_motor.c,41 :: 		cmd = 0xE0 | id;
	MOVLW      224
	IORWF       FARG_set_id_id+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      set_id_cmd_L0+0
;servo_motor.c,42 :: 		sc  = 0x01;
	MOVLW      1
	MOVWF      set_id_sc_L0+0
;servo_motor.c,44 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_id10
	BCF        TXSTA+0, 0
	GOTO       L__set_id11
L__set_id10:
	BSF        TXSTA+0, 0
L__set_id11:
;servo_motor.c,45 :: 		UART1_write(cmd);
	MOVF       set_id_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,46 :: 		TXSTA.TX9D = parity_check(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_id12
	BCF        TXSTA+0, 0
	GOTO       L__set_id13
L__set_id12:
	BSF        TXSTA+0, 0
L__set_id13:
;servo_motor.c,47 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,48 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,49 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,51 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_id4:
	DECFSZ     R13, 1
	GOTO       L_set_id4
	NOP
;servo_motor.c,52 :: 		}
L_end_set_id:
	RETURN
; end of _set_id

_set_parameter:

;servo_motor.c,54 :: 		void set_parameter(unsigned char sc, unsigned char id, unsigned char _data)
;servo_motor.c,58 :: 		cmd = 0xC0 | id;
	MOVLW      192
	IORWF       FARG_set_parameter_id+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      set_parameter_cmd_L0+0
;servo_motor.c,60 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter15
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter16
L__set_parameter15:
	BSF        TXSTA+0, 0
L__set_parameter16:
;servo_motor.c,61 :: 		UART1_write(cmd);
	MOVF       set_parameter_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,62 :: 		TXSTA.TX9D = parity_check(sc);
	MOVF       FARG_set_parameter_sc+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter17
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter18
L__set_parameter17:
	BSF        TXSTA+0, 0
L__set_parameter18:
;servo_motor.c,63 :: 		UART1_write(sc);
	MOVF       FARG_set_parameter_sc+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,64 :: 		TXSTA.TX9D = parity_check(_data);
	MOVF       FARG_set_parameter__data+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter19
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter20
L__set_parameter19:
	BSF        TXSTA+0, 0
L__set_parameter20:
;servo_motor.c,65 :: 		UART1_write(_data);
	MOVF       FARG_set_parameter__data+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,67 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_parameter5:
	DECFSZ     R13, 1
	GOTO       L_set_parameter5
	NOP
;servo_motor.c,68 :: 		}
L_end_set_parameter:
	RETURN
; end of _set_parameter

_set_position:

;servo_motor.c,70 :: 		void set_position(unsigned char id, int position)
;servo_motor.c,74 :: 		cmd   = 0x80 | id;
	MOVLW      128
	IORWF       FARG_set_position_id+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      set_position_cmd_L0+0
;servo_motor.c,75 :: 		pos_h = (unsigned char)((position >> 7) & 0x7F);
	MOVLW      7
	MOVWF      R2
	MOVF       FARG_set_position_position+0, 0
	MOVWF      R0
	MOVF       FARG_set_position_position+1, 0
	MOVWF      R1
	MOVF       R2, 0
L__set_position22:
	BTFSC      STATUS+0, 2
	GOTO       L__set_position23
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__set_position22
L__set_position23:
	MOVLW      127
	ANDWF      R0, 0
	MOVWF      set_position_pos_h_L0+0
;servo_motor.c,76 :: 		pos_l = (unsigned char)(position & 0x7F);
	MOVLW      127
	ANDWF      FARG_set_position_position+0, 0
	MOVWF      set_position_pos_l_L0+0
;servo_motor.c,78 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R3, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position24
	BCF        TXSTA+0, 0
	GOTO       L__set_position25
L__set_position24:
	BSF        TXSTA+0, 0
L__set_position25:
;servo_motor.c,79 :: 		UART1_write(cmd);
	MOVF       set_position_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,80 :: 		TXSTA.TX9D = parity_check(pos_h);
	MOVF       set_position_pos_h_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position26
	BCF        TXSTA+0, 0
	GOTO       L__set_position27
L__set_position26:
	BSF        TXSTA+0, 0
L__set_position27:
;servo_motor.c,81 :: 		UART1_write(pos_h);
	MOVF       set_position_pos_h_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,82 :: 		TXSTA.TX9D = parity_check(pos_l);
	MOVF       set_position_pos_l_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position28
	BCF        TXSTA+0, 0
	GOTO       L__set_position29
L__set_position28:
	BSF        TXSTA+0, 0
L__set_position29:
;servo_motor.c,83 :: 		UART1_write(pos_l);
	MOVF       set_position_pos_l_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;servo_motor.c,85 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_position6:
	DECFSZ     R13, 1
	GOTO       L_set_position6
	NOP
;servo_motor.c,86 :: 		}
L_end_set_position:
	RETURN
; end of _set_position

_parity_check:

;servo_motor.c,88 :: 		char parity_check(unsigned char _data)
;servo_motor.c,90 :: 		return ((_data & 0b10000000) >> 7) ^
	MOVLW      128
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R1
	MOVLW      7
	MOVWF      R0
	MOVF       R1, 0
	MOVWF      R3
	MOVF       R0, 0
L__parity_check31:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check32
	LSRF       R3, 1
	ADDLW      255
	GOTO       L__parity_check31
L__parity_check32:
;servo_motor.c,91 :: 		((_data & 0b01000000) >> 6) ^
	MOVLW      64
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__parity_check33:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check34
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__parity_check33
L__parity_check34:
	MOVF       R0, 0
	XORWF      R3, 1
;servo_motor.c,92 :: 		((_data & 0b00100000) >> 5) ^
	MOVLW      32
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVLW      5
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__parity_check35:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check36
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__parity_check35
L__parity_check36:
	MOVF       R0, 0
	XORWF      R3, 1
;servo_motor.c,93 :: 		((_data & 0b00010000) >> 4) ^
	MOVLW      16
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;servo_motor.c,94 :: 		((_data & 0b00001000) >> 3) ^
	MOVLW      8
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;servo_motor.c,95 :: 		((_data & 0b00000100) >> 2) ^
	MOVLW      4
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;servo_motor.c,96 :: 		((_data & 0b00000010) >> 1) ^
	MOVLW      2
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 0
	MOVWF      R1
;servo_motor.c,97 :: 		(_data & 0b00000001);
	MOVLW      1
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	XORWF      R0, 1
;servo_motor.c,98 :: 		}
L_end_parity_check:
	RETURN
; end of _parity_check
