
_main:

;moter_test.c,10 :: 		void main()
;moter_test.c,12 :: 		setup();
	CALL       _setup+0
;moter_test.c,14 :: 		while(1){
L_main0:
;moter_test.c,15 :: 		run_moter(128, 0, 100);
	MOVLW      128
	MOVWF      FARG_run_moter+0
	CLRF       FARG_run_moter+1
	CLRF       FARG_run_moter+0
	CLRF       FARG_run_moter+1
	MOVLW      100
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	CALL       _run_moter+0
;moter_test.c,16 :: 		run_moter(128, 4, 100);
	MOVLW      128
	MOVWF      FARG_run_moter+0
	CLRF       FARG_run_moter+1
	MOVLW      4
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	MOVLW      100
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	CALL       _run_moter+0
;moter_test.c,17 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_main2:
	DECFSZ     R13, 1
	GOTO       L_main2
	DECFSZ     R12, 1
	GOTO       L_main2
	DECFSZ     R11, 1
	GOTO       L_main2
	NOP
;moter_test.c,19 :: 		set_position(0, 3500);
	CLRF       FARG_set_position+0
	MOVLW      172
	MOVWF      FARG_set_position+0
	MOVLW      13
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,20 :: 		delay_ms(1000);
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
;moter_test.c,22 :: 		set_position(0, 7500);
	CLRF       FARG_set_position+0
	MOVLW      76
	MOVWF      FARG_set_position+0
	MOVLW      29
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,23 :: 		delay_ms(1000);
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
;moter_test.c,25 :: 		set_position(0, 11500);
	CLRF       FARG_set_position+0
	MOVLW      236
	MOVWF      FARG_set_position+0
	MOVLW      44
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,26 :: 		delay_ms(1000);
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
;moter_test.c,28 :: 		set_position(1, 3500);
	MOVLW      1
	MOVWF      FARG_set_position+0
	MOVLW      172
	MOVWF      FARG_set_position+0
	MOVLW      13
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,29 :: 		delay_ms(1000);
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
;moter_test.c,31 :: 		set_position(1, 7500);
	MOVLW      1
	MOVWF      FARG_set_position+0
	MOVLW      76
	MOVWF      FARG_set_position+0
	MOVLW      29
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,32 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main7:
	DECFSZ     R13, 1
	GOTO       L_main7
	DECFSZ     R12, 1
	GOTO       L_main7
	DECFSZ     R11, 1
	GOTO       L_main7
	NOP
	NOP
;moter_test.c,34 :: 		set_position(1, 11500);
	MOVLW      1
	MOVWF      FARG_set_position+0
	MOVLW      236
	MOVWF      FARG_set_position+0
	MOVLW      44
	MOVWF      FARG_set_position+1
	CALL       _set_position+0
;moter_test.c,35 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_main8:
	DECFSZ     R13, 1
	GOTO       L_main8
	DECFSZ     R12, 1
	GOTO       L_main8
	DECFSZ     R11, 1
	GOTO       L_main8
	NOP
	NOP
;moter_test.c,37 :: 		run_moter(128, 1, 100);
	MOVLW      128
	MOVWF      FARG_run_moter+0
	CLRF       FARG_run_moter+1
	MOVLW      1
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	MOVLW      100
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	CALL       _run_moter+0
;moter_test.c,38 :: 		run_moter(128, 5, 100);
	MOVLW      128
	MOVWF      FARG_run_moter+0
	CLRF       FARG_run_moter+1
	MOVLW      5
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	MOVLW      100
	MOVWF      FARG_run_moter+0
	MOVLW      0
	MOVWF      FARG_run_moter+1
	CALL       _run_moter+0
;moter_test.c,39 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_main9:
	DECFSZ     R13, 1
	GOTO       L_main9
	DECFSZ     R12, 1
	GOTO       L_main9
	DECFSZ     R11, 1
	GOTO       L_main9
	NOP
;moter_test.c,40 :: 		}
	GOTO       L_main0
;moter_test.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;moter_test.c,43 :: 		void setup()
;moter_test.c,45 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;moter_test.c,47 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;moter_test.c,48 :: 		TRISA  = 0x01;
	MOVLW      1
	MOVWF      TRISA+0
;moter_test.c,49 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;moter_test.c,51 :: 		APFCON.TXCKSEL = 0;
	BCF        APFCON+0, 2
;moter_test.c,52 :: 		APFCON.RXDTSEL = 0;
	BCF        APFCON+0, 7
;moter_test.c,54 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;moter_test.c,56 :: 		Soft_UART_Init(&PORTA, 3, 2, 9600, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      3
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      2
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;moter_test.c,58 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_setup10:
	DECFSZ     R13, 1
	GOTO       L_setup10
	DECFSZ     R12, 1
	GOTO       L_setup10
	NOP
;moter_test.c,59 :: 		}
L_end_setup:
	RETURN
; end of _setup

_run_moter:

;moter_test.c,61 :: 		void run_moter(int address,int command,int Data)
;moter_test.c,63 :: 		TXSTA.TX9 = 0;
	BCF        TXSTA+0, 6
;moter_test.c,64 :: 		Soft_UART_Write(address);
	MOVF       FARG_run_moter_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;moter_test.c,65 :: 		Soft_UART_Write(command);
	MOVF       FARG_run_moter_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;moter_test.c,66 :: 		Soft_UART_Write(Data);
	MOVF       FARG_run_moter_Data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;moter_test.c,67 :: 		Soft_UART_Write((address+command+Data) & 0x7f);
	MOVF       FARG_run_moter_command+0, 0
	ADDWF      FARG_run_moter_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_run_moter_Data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;moter_test.c,68 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_run_moter11:
	DECFSZ     R13, 1
	GOTO       L_run_moter11
	DECFSZ     R12, 1
	GOTO       L_run_moter11
	NOP
	NOP
;moter_test.c,69 :: 		}
L_end_run_moter:
	RETURN
; end of _run_moter

_set_id:

;moter_test.c,71 :: 		void set_id(unsigned char id)
;moter_test.c,75 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;moter_test.c,77 :: 		cmd = 0xE0 | id;
	MOVLW      224
	IORWF       FARG_set_id_id+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      set_id_cmd_L0+0
;moter_test.c,78 :: 		sc  = 0x01;
	MOVLW      1
	MOVWF      set_id_sc_L0+0
;moter_test.c,80 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_id19
	BCF        TXSTA+0, 0
	GOTO       L__set_id20
L__set_id19:
	BSF        TXSTA+0, 0
L__set_id20:
;moter_test.c,81 :: 		UART1_write(cmd);
	MOVF       set_id_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,82 :: 		TXSTA.TX9D = parity_check(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_id21
	BCF        TXSTA+0, 0
	GOTO       L__set_id22
L__set_id21:
	BSF        TXSTA+0, 0
L__set_id22:
;moter_test.c,83 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,84 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,85 :: 		UART1_write(sc);
	MOVF       set_id_sc_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,87 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_id12:
	DECFSZ     R13, 1
	GOTO       L_set_id12
	NOP
;moter_test.c,88 :: 		}
L_end_set_id:
	RETURN
; end of _set_id

_set_parameter:

;moter_test.c,90 :: 		void set_parameter(unsigned char sc, unsigned char id, unsigned char _data)
;moter_test.c,94 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;moter_test.c,96 :: 		cmd = 0xC0 | id;
	MOVLW      192
	IORWF       FARG_set_parameter_id+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      set_parameter_cmd_L0+0
;moter_test.c,98 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter24
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter25
L__set_parameter24:
	BSF        TXSTA+0, 0
L__set_parameter25:
;moter_test.c,99 :: 		UART1_write(cmd);
	MOVF       set_parameter_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,100 :: 		TXSTA.TX9D = parity_check(sc);
	MOVF       FARG_set_parameter_sc+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter26
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter27
L__set_parameter26:
	BSF        TXSTA+0, 0
L__set_parameter27:
;moter_test.c,101 :: 		UART1_write(sc);
	MOVF       FARG_set_parameter_sc+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,102 :: 		TXSTA.TX9D = parity_check(_data);
	MOVF       FARG_set_parameter__data+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_parameter28
	BCF        TXSTA+0, 0
	GOTO       L__set_parameter29
L__set_parameter28:
	BSF        TXSTA+0, 0
L__set_parameter29:
;moter_test.c,103 :: 		UART1_write(_data);
	MOVF       FARG_set_parameter__data+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,105 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_parameter13:
	DECFSZ     R13, 1
	GOTO       L_set_parameter13
	NOP
;moter_test.c,106 :: 		}
L_end_set_parameter:
	RETURN
; end of _set_parameter

_set_position:

;moter_test.c,108 :: 		void set_position(unsigned char id, int position)
;moter_test.c,112 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;moter_test.c,114 :: 		cmd   = 0x80 | id;
	MOVLW      128
	IORWF       FARG_set_position_id+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      set_position_cmd_L0+0
;moter_test.c,115 :: 		pos_h = (unsigned char)((position >> 7) & 0x7F);
	MOVLW      7
	MOVWF      R2
	MOVF       FARG_set_position_position+0, 0
	MOVWF      R0
	MOVF       FARG_set_position_position+1, 0
	MOVWF      R1
	MOVF       R2, 0
L__set_position31:
	BTFSC      STATUS+0, 2
	GOTO       L__set_position32
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__set_position31
L__set_position32:
	MOVLW      127
	ANDWF      R0, 0
	MOVWF      set_position_pos_h_L0+0
;moter_test.c,116 :: 		pos_l = (unsigned char)(position & 0x7F);
	MOVLW      127
	ANDWF      FARG_set_position_position+0, 0
	MOVWF      set_position_pos_l_L0+0
;moter_test.c,118 :: 		TXSTA.TX9D = parity_check(cmd);
	MOVF       R3, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position33
	BCF        TXSTA+0, 0
	GOTO       L__set_position34
L__set_position33:
	BSF        TXSTA+0, 0
L__set_position34:
;moter_test.c,119 :: 		UART1_write(cmd);
	MOVF       set_position_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,120 :: 		TXSTA.TX9D = parity_check(pos_h);
	MOVF       set_position_pos_h_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position35
	BCF        TXSTA+0, 0
	GOTO       L__set_position36
L__set_position35:
	BSF        TXSTA+0, 0
L__set_position36:
;moter_test.c,121 :: 		UART1_write(pos_h);
	MOVF       set_position_pos_h_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,122 :: 		TXSTA.TX9D = parity_check(pos_l);
	MOVF       set_position_pos_l_L0+0, 0
	MOVWF      FARG_parity_check+0
	CALL       _parity_check+0
	BTFSC      R0, 0
	GOTO       L__set_position37
	BCF        TXSTA+0, 0
	GOTO       L__set_position38
L__set_position37:
	BSF        TXSTA+0, 0
L__set_position38:
;moter_test.c,123 :: 		UART1_write(pos_l);
	MOVF       set_position_pos_l_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;moter_test.c,125 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13
L_set_position14:
	DECFSZ     R13, 1
	GOTO       L_set_position14
	NOP
;moter_test.c,126 :: 		}
L_end_set_position:
	RETURN
; end of _set_position

_parity_check:

;moter_test.c,128 :: 		char parity_check(unsigned char _data)
;moter_test.c,130 :: 		return ((_data & 0b10000000) >> 7) ^
	MOVLW      128
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R1
	MOVLW      7
	MOVWF      R0
	MOVF       R1, 0
	MOVWF      R3
	MOVF       R0, 0
L__parity_check40:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check41
	LSRF       R3, 1
	ADDLW      255
	GOTO       L__parity_check40
L__parity_check41:
;moter_test.c,131 :: 		((_data & 0b01000000) >> 6) ^
	MOVLW      64
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__parity_check42:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check43
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__parity_check42
L__parity_check43:
	MOVF       R0, 0
	XORWF      R3, 1
;moter_test.c,132 :: 		((_data & 0b00100000) >> 5) ^
	MOVLW      32
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVLW      5
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__parity_check44:
	BTFSC      STATUS+0, 2
	GOTO       L__parity_check45
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__parity_check44
L__parity_check45:
	MOVF       R0, 0
	XORWF      R3, 1
;moter_test.c,133 :: 		((_data & 0b00010000) >> 4) ^
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
;moter_test.c,134 :: 		((_data & 0b00001000) >> 3) ^
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
;moter_test.c,135 :: 		((_data & 0b00000100) >> 2) ^
	MOVLW      4
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;moter_test.c,136 :: 		((_data & 0b00000010) >> 1) ^
	MOVLW      2
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 0
	MOVWF      R1
;moter_test.c,137 :: 		(_data & 0b00000001);
	MOVLW      1
	ANDWF      FARG_parity_check__data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	XORWF      R0, 1
;moter_test.c,138 :: 		}
L_end_parity_check:
	RETURN
; end of _parity_check
