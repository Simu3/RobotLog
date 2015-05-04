
_main:

;UART_via_software_master.c,5 :: 		void main(){
;UART_via_software_master.c,6 :: 		setup();
	CALL       _setup+0
;UART_via_software_master.c,8 :: 		while(1){
L_main0:
;UART_via_software_master.c,9 :: 		run_s(128, 0, 100);
	MOVLW      128
	MOVWF      FARG_run_s+0
	CLRF       FARG_run_s+1
	CLRF       FARG_run_s+0
	CLRF       FARG_run_s+1
	MOVLW      100
	MOVWF      FARG_run_s+0
	MOVLW      0
	MOVWF      FARG_run_s+1
	CALL       _run_s+0
;UART_via_software_master.c,10 :: 		run_h(128, 4, 100);
	MOVLW      128
	MOVWF      FARG_run_h+0
	CLRF       FARG_run_h+1
	MOVLW      4
	MOVWF      FARG_run_h+0
	MOVLW      0
	MOVWF      FARG_run_h+1
	MOVLW      100
	MOVWF      FARG_run_h+0
	MOVLW      0
	MOVWF      FARG_run_h+1
	CALL       _run_h+0
;UART_via_software_master.c,11 :: 		}
	GOTO       L_main0
;UART_via_software_master.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;UART_via_software_master.c,14 :: 		void setup()
;UART_via_software_master.c,16 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;UART_via_software_master.c,18 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;UART_via_software_master.c,19 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;UART_via_software_master.c,20 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;UART_via_software_master.c,22 :: 		APFCON.TXCKSEL = 0;
	BCF        APFCON+0, 2
;UART_via_software_master.c,23 :: 		APFCON.RXDTSEL = 0;
	BCF        APFCON+0, 7
;UART_via_software_master.c,25 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;UART_via_software_master.c,27 :: 		Soft_UART_Init(&PORTA, 3, 2, 9600, 0);
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
;UART_via_software_master.c,29 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_setup2:
	DECFSZ     R13, 1
	GOTO       L_setup2
	DECFSZ     R12, 1
	GOTO       L_setup2
	NOP
;UART_via_software_master.c,30 :: 		}
L_end_setup:
	RETURN
; end of _setup

_run_h:

;UART_via_software_master.c,32 :: 		void run_h(int address,int command,int Data)
;UART_via_software_master.c,34 :: 		UART1_write(address);
	MOVF       FARG_run_h_address+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART_via_software_master.c,35 :: 		UART1_write(command);
	MOVF       FARG_run_h_command+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART_via_software_master.c,36 :: 		UART1_write(Data);
	MOVF       FARG_run_h_Data+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART_via_software_master.c,37 :: 		UART1_write((address+command+Data) & 0x7f);
	MOVF       FARG_run_h_command+0, 0
	ADDWF      FARG_run_h_address+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	MOVF       FARG_run_h_Data+0, 0
	ADDWF      FARG_UART1_Write_data_+0, 1
	MOVLW      127
	ANDWF      FARG_UART1_Write_data_+0, 1
	CALL       _UART1_Write+0
;UART_via_software_master.c,38 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_run_h3:
	DECFSZ     R13, 1
	GOTO       L_run_h3
	DECFSZ     R12, 1
	GOTO       L_run_h3
	NOP
	NOP
;UART_via_software_master.c,39 :: 		}
L_end_run_h:
	RETURN
; end of _run_h

_run_s:

;UART_via_software_master.c,41 :: 		void run_s(int address,int command,int Data)
;UART_via_software_master.c,43 :: 		Soft_UART_Write(address);
	MOVF       FARG_run_s_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;UART_via_software_master.c,44 :: 		Soft_UART_Write(command);
	MOVF       FARG_run_s_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;UART_via_software_master.c,45 :: 		Soft_UART_Write(Data);
	MOVF       FARG_run_s_Data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;UART_via_software_master.c,46 :: 		Soft_UART_Write((address+command+Data) & 0x7f);
	MOVF       FARG_run_s_command+0, 0
	ADDWF      FARG_run_s_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_run_s_Data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;UART_via_software_master.c,47 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_run_s4:
	DECFSZ     R13, 1
	GOTO       L_run_s4
	DECFSZ     R12, 1
	GOTO       L_run_s4
	NOP
	NOP
;UART_via_software_master.c,48 :: 		}
L_end_run_s:
	RETURN
; end of _run_s
