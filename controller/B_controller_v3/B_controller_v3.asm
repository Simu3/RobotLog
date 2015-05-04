
_Main:

;B_controller_v3.c,18 :: 		void Main()
;B_controller_v3.c,20 :: 		char error = 0;
	CLRF       Main_error_L0+0
	CLRF       Main_command_L0+0
;B_controller_v3.c,23 :: 		SetUp();
	CALL       _SetUp+0
;B_controller_v3.c,25 :: 		while(1){
L_Main0:
;B_controller_v3.c,26 :: 		do{
L_Main2:
;B_controller_v3.c,27 :: 		command = Soft_UART_Read(&error);
	MOVLW      Main_error_L0+0
	MOVWF      FARG_Soft_UART_Read_error+0
	MOVLW      hi_addr(Main_error_L0+0)
	MOVWF      FARG_Soft_UART_Read_error+1
	CALL       _Soft_UART_Read+0
	MOVF       R0, 0
	MOVWF      Main_command_L0+0
;B_controller_v3.c,28 :: 		}while(error);
	MOVF       Main_error_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Main2
;B_controller_v3.c,30 :: 		Move(command);
	MOVF       Main_command_L0+0, 0
	MOVWF      FARG_Move+0
	CLRF       FARG_Move+1
	CALL       _Move+0
;B_controller_v3.c,31 :: 		}
	GOTO       L_Main0
;B_controller_v3.c,32 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;B_controller_v3.c,34 :: 		void SetUp()
;B_controller_v3.c,36 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;B_controller_v3.c,38 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;B_controller_v3.c,39 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;B_controller_v3.c,41 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;B_controller_v3.c,42 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;B_controller_v3.c,44 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;B_controller_v3.c,45 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;B_controller_v3.c,47 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;B_controller_v3.c,48 :: 		Soft_UART_Init(&PORTB, 4, 3, 9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTB+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      4
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      3
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;B_controller_v3.c,50 :: 		PORTA.B4 = 1;
	BSF        PORTA+0, 4
;B_controller_v3.c,52 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp5:
	DECFSZ     R13, 1
	GOTO       L_SetUp5
	DECFSZ     R12, 1
	GOTO       L_SetUp5
	NOP
;B_controller_v3.c,53 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_Move:

;B_controller_v3.c,55 :: 		void Move(int command)
;B_controller_v3.c,57 :: 		switch(command){
	GOTO       L_Move6
;B_controller_v3.c,59 :: 		case 0x01:
L_Move8:
;B_controller_v3.c,60 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,61 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,62 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,63 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,64 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,65 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,66 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,67 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STRAIGHT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,68 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,69 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,70 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,73 :: 		case 0x02:
L_Move9:
;B_controller_v3.c,74 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,75 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,76 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,77 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,78 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,79 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,80 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,81 :: 		RunMotor(RL_ADD, MOTOR2_REVERSE, STRAIGHT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,82 :: 		RunMotor(FB_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,83 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,84 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,87 :: 		case 0x04:
L_Move10:
;B_controller_v3.c,88 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,89 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,90 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,91 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,92 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,93 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,94 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,95 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,96 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,97 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,98 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,101 :: 		case 0x08:
L_Move11:
;B_controller_v3.c,102 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,103 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,104 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,105 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,106 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,107 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,108 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,109 :: 		RunMotor(RL_ADD, MOTOR2_REVERSE, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,110 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,111 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,112 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,115 :: 		case 0x80:
L_Move12:
;B_controller_v3.c,116 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,117 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,118 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,119 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,120 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,121 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,122 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,123 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,124 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,125 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,126 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,129 :: 		case 0x40:
L_Move13:
;B_controller_v3.c,130 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,131 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,132 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,133 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,134 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,135 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,136 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,137 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,138 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,139 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,140 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,143 :: 		case 0x21:
L_Move14:
;B_controller_v3.c,144 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,145 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,146 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,147 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,148 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,149 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,150 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,151 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STRAIGHT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,152 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,153 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,154 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,157 :: 		case 0x22:
L_Move15:
;B_controller_v3.c,158 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,159 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,160 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,161 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,162 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,163 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,164 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,165 :: 		RunMotor(RL_ADD, MOTOR2_REVERSE, STRAIGHT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,166 :: 		RunMotor(FB_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,167 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,168 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,171 :: 		case 0x24:
L_Move16:
;B_controller_v3.c,172 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,173 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,174 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,175 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,176 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,177 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,178 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, TURN_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,179 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, TURN_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,180 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,181 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,182 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,185 :: 		case 0x28:
L_Move17:
;B_controller_v3.c,186 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,187 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,188 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,189 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,190 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,191 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,192 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, TURN_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,193 :: 		RunMotor(RL_ADD, MOTOR2_REVERSE, TURN_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,194 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,195 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,196 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,199 :: 		case 0xA0:
L_Move18:
;B_controller_v3.c,200 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,201 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,202 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,203 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,204 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,205 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,206 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,207 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,208 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,209 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,210 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,213 :: 		case 0x60:
L_Move19:
;B_controller_v3.c,214 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,215 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,216 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,217 :: 		Soft_UART_Write('L');
	MOVLW      76
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,218 :: 		Soft_UART_Write('M');
	MOVLW      77
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,219 :: 		Soft_UART_Write(1);
	MOVLW      1
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v3.c,220 :: 		RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,221 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED - DOWN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      47
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,222 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,223 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,224 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,227 :: 		case 0x10:
L_Move20:
;B_controller_v3.c,228 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,229 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,230 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,231 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, BEL_CON_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,232 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,235 :: 		case 0x30:
L_Move21:
;B_controller_v3.c,236 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,237 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,238 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,239 :: 		RunMotor(FB_ADD, MOTOR2_REVERSE, BEL_CON_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,240 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,243 :: 		case 0x50:
L_Move22:
;B_controller_v3.c,244 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,245 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,246 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,247 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,248 :: 		PORTA.B4 = 1;  // 1:arm on  0:arm off
	BSF        PORTA+0, 4
;B_controller_v3.c,249 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,251 :: 		case 0x90:
L_Move23:
;B_controller_v3.c,252 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,253 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,254 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,255 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,256 :: 		PORTA.B4 = 0;  // 1:arm on  0:arm off
	BCF        PORTA+0, 4
;B_controller_v3.c,257 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,260 :: 		default:
L_Move24:
;B_controller_v3.c,261 :: 		RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,262 :: 		RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,263 :: 		RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,264 :: 		RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v3.c,265 :: 		break;
	GOTO       L_Move7
;B_controller_v3.c,266 :: 		}
L_Move6:
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move29
	MOVLW      1
	XORWF      FARG_Move_command+0, 0
L__Move29:
	BTFSC      STATUS+0, 2
	GOTO       L_Move8
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move30
	MOVLW      2
	XORWF      FARG_Move_command+0, 0
L__Move30:
	BTFSC      STATUS+0, 2
	GOTO       L_Move9
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move31
	MOVLW      4
	XORWF      FARG_Move_command+0, 0
L__Move31:
	BTFSC      STATUS+0, 2
	GOTO       L_Move10
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move32
	MOVLW      8
	XORWF      FARG_Move_command+0, 0
L__Move32:
	BTFSC      STATUS+0, 2
	GOTO       L_Move11
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move33
	MOVLW      128
	XORWF      FARG_Move_command+0, 0
L__Move33:
	BTFSC      STATUS+0, 2
	GOTO       L_Move12
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move34
	MOVLW      64
	XORWF      FARG_Move_command+0, 0
L__Move34:
	BTFSC      STATUS+0, 2
	GOTO       L_Move13
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move35
	MOVLW      33
	XORWF      FARG_Move_command+0, 0
L__Move35:
	BTFSC      STATUS+0, 2
	GOTO       L_Move14
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move36
	MOVLW      34
	XORWF      FARG_Move_command+0, 0
L__Move36:
	BTFSC      STATUS+0, 2
	GOTO       L_Move15
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move37
	MOVLW      36
	XORWF      FARG_Move_command+0, 0
L__Move37:
	BTFSC      STATUS+0, 2
	GOTO       L_Move16
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move38
	MOVLW      40
	XORWF      FARG_Move_command+0, 0
L__Move38:
	BTFSC      STATUS+0, 2
	GOTO       L_Move17
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move39
	MOVLW      160
	XORWF      FARG_Move_command+0, 0
L__Move39:
	BTFSC      STATUS+0, 2
	GOTO       L_Move18
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move40
	MOVLW      96
	XORWF      FARG_Move_command+0, 0
L__Move40:
	BTFSC      STATUS+0, 2
	GOTO       L_Move19
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move41
	MOVLW      16
	XORWF      FARG_Move_command+0, 0
L__Move41:
	BTFSC      STATUS+0, 2
	GOTO       L_Move20
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move42
	MOVLW      48
	XORWF      FARG_Move_command+0, 0
L__Move42:
	BTFSC      STATUS+0, 2
	GOTO       L_Move21
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move43
	MOVLW      80
	XORWF      FARG_Move_command+0, 0
L__Move43:
	BTFSC      STATUS+0, 2
	GOTO       L_Move22
	MOVLW      0
	XORWF      FARG_Move_command+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move44
	MOVLW      144
	XORWF      FARG_Move_command+0, 0
L__Move44:
	BTFSC      STATUS+0, 2
	GOTO       L_Move23
	GOTO       L_Move24
L_Move7:
;B_controller_v3.c,267 :: 		}
L_end_Move:
	RETURN
; end of _Move

_RunMotor:

;B_controller_v3.c,269 :: 		void RunMotor(int address, int command, int _data)
;B_controller_v3.c,271 :: 		UART1_Write(address);
	MOVF       FARG_RunMotor_address+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;B_controller_v3.c,272 :: 		UART1_Write(command);
	MOVF       FARG_RunMotor_command+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;B_controller_v3.c,273 :: 		UART1_Write(_data);
	MOVF       FARG_RunMotor__data+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;B_controller_v3.c,274 :: 		UART1_Write((address + command + _data) & 0x7F);
	MOVF       FARG_RunMotor_command+0, 0
	ADDWF      FARG_RunMotor_address+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	MOVF       FARG_RunMotor__data+0, 0
	ADDWF      FARG_UART1_Write_data_+0, 1
	MOVLW      127
	ANDWF      FARG_UART1_Write_data_+0, 1
	CALL       _UART1_Write+0
;B_controller_v3.c,276 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_RunMotor25:
	DECFSZ     R13, 1
	GOTO       L_RunMotor25
	DECFSZ     R12, 1
	GOTO       L_RunMotor25
	NOP
	NOP
;B_controller_v3.c,277 :: 		}
L_end_RunMotor:
	RETURN
; end of _RunMotor
