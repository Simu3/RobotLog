
_Main:

;controller_plus.c,3 :: 		void Main()
;controller_plus.c,5 :: 		SetUp();
	CALL       _SetUp+0
;controller_plus.c,7 :: 		while(1){
L_Main0:
;controller_plus.c,8 :: 		if(PORTA.B5){
	BTFSS      PORTA+0, 5
	GOTO       L_Main2
;controller_plus.c,9 :: 		UART1_Write(0);        //right
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,10 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,11 :: 		UART1_Write(215);
	MOVLW      215
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,13 :: 		Soft_UART_Write(0);    //left
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,14 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,15 :: 		Soft_UART_Write(215);
	MOVLW      215
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,17 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12
	MOVLW      235
	MOVWF      R13
L_Main3:
	DECFSZ     R13, 1
	GOTO       L_Main3
	DECFSZ     R12, 1
	GOTO       L_Main3
;controller_plus.c,18 :: 		}
	GOTO       L_Main4
L_Main2:
;controller_plus.c,20 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,21 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,22 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;controller_plus.c,24 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,25 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,26 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;controller_plus.c,28 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12
	MOVLW      235
	MOVWF      R13
L_Main5:
	DECFSZ     R13, 1
	GOTO       L_Main5
	DECFSZ     R12, 1
	GOTO       L_Main5
;controller_plus.c,29 :: 		}
L_Main4:
;controller_plus.c,30 :: 		}
	GOTO       L_Main0
;controller_plus.c,31 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;controller_plus.c,33 :: 		void SetUp()
;controller_plus.c,37 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;controller_plus.c,39 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;controller_plus.c,40 :: 		TRISA  = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;controller_plus.c,41 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;controller_plus.c,43 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;controller_plus.c,45 :: 		Soft_UART_Init(&PORTA, 1, 2, 9600, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      1
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
;controller_plus.c,47 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_SetUp6:
	DECFSZ     R13, 1
	GOTO       L_SetUp6
	DECFSZ     R12, 1
	GOTO       L_SetUp6
	DECFSZ     R11, 1
	GOTO       L_SetUp6
	NOP
	NOP
;controller_plus.c,48 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp
