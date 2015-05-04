
_Main:

;B_controller_v2.c,20 :: 		void Main()
;B_controller_v2.c,22 :: 		char error = 0;
	CLRF       Main_error_L0+0
	CLRF       Main_button_L0+0
;B_controller_v2.c,25 :: 		SetUp();
	CALL       _SetUp+0
;B_controller_v2.c,27 :: 		while(1){
L_Main0:
;B_controller_v2.c,28 :: 		do{
L_Main2:
;B_controller_v2.c,29 :: 		button = Soft_UART_Read(&error);
	MOVLW      Main_error_L0+0
	MOVWF      FARG_Soft_UART_Read_error+0
	MOVLW      hi_addr(Main_error_L0+0)
	MOVWF      FARG_Soft_UART_Read_error+1
	CALL       _Soft_UART_Read+0
	MOVF       R0, 0
	MOVWF      Main_button_L0+0
;B_controller_v2.c,30 :: 		}while(error);
	MOVF       Main_error_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Main2
;B_controller_v2.c,32 :: 		Move(button);
	MOVF       Main_button_L0+0, 0
	MOVWF      FARG_Move+0
	CLRF       FARG_Move+1
	CALL       _Move+0
;B_controller_v2.c,33 :: 		}
	GOTO       L_Main0
;B_controller_v2.c,34 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;B_controller_v2.c,36 :: 		void SetUp()
;B_controller_v2.c,38 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;B_controller_v2.c,40 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;B_controller_v2.c,41 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;B_controller_v2.c,43 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;B_controller_v2.c,44 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;B_controller_v2.c,46 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;B_controller_v2.c,47 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;B_controller_v2.c,49 :: 		Soft_UART_Init(&PORTB, 4, 2, 9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTB+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      4
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
;B_controller_v2.c,51 :: 		delay_ms(10);
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
;B_controller_v2.c,52 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_Move:

;B_controller_v2.c,54 :: 		void Move(int button)
;B_controller_v2.c,56 :: 		switch(button){
	GOTO       L_Move6
;B_controller_v2.c,58 :: 		case 0x01: STEERING_STRAIGHT;
L_Move8:
	BCF        PORTB+0, 1
;B_controller_v2.c,59 :: 		RunMotor(FRONT_ADD,   MOTOR1_REVERSE, STRAIGHT_SPEED);
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
;B_controller_v2.c,60 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STRAIGHT_SPEED);
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
;B_controller_v2.c,61 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, STRAIGHT_SPEED);
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
;B_controller_v2.c,62 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STRAIGHT_SPEED);
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
;B_controller_v2.c,63 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STRAIGHT_SPEED);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,64 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, STRAIGHT_SPEED);
	MOVLW      130
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
;B_controller_v2.c,65 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,66 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,68 :: 		case 0x02: STEERING_STRAIGHT;
L_Move9:
	BCF        PORTB+0, 1
;B_controller_v2.c,69 :: 		RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STRAIGHT_SPEED);
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
;B_controller_v2.c,70 :: 		RunMotor(FRONT_ADD,   MOTOR2_REVERSE, STRAIGHT_SPEED);
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
;B_controller_v2.c,71 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STRAIGHT_SPEED);
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
;B_controller_v2.c,72 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, STRAIGHT_SPEED);
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
;B_controller_v2.c,73 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, STRAIGHT_SPEED);
	MOVLW      130
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
;B_controller_v2.c,74 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STRAIGHT_SPEED);
	MOVLW      130
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
;B_controller_v2.c,75 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,76 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,78 :: 		case 0x04: STEERING_CURVE;
L_Move10:
	BSF        PORTB+0, 1
;B_controller_v2.c,79 :: 		RunMotor(FRONT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,80 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,81 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,82 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,83 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, TURN_SPEED);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,84 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, TURN_SPEED);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,85 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,86 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,88 :: 		case 0x08: STEERING_CURVE;
L_Move11:
	BSF        PORTB+0, 1
;B_controller_v2.c,89 :: 		RunMotor(FRONT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,90 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,91 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,92 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,93 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, TURN_SPEED);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,94 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, TURN_SPEED);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      100
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,95 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,96 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,105 :: 		case 0x10: RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
L_Move12:
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,106 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,107 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,108 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,109 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,110 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,111 :: 		RunMotor(BEL_CON_ADD, MOTOR1_REVERSE, BEL_CON_SPEED);
	MOVLW      131
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
;B_controller_v2.c,112 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,114 :: 		case 0x20: RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
L_Move13:
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,115 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,116 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,117 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,118 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,119 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,120 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, BEL_CON_SPEED);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,121 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,123 :: 		default  : RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
L_Move14:
	MOVLW      128
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,124 :: 		RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,125 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      129
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,126 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
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
;B_controller_v2.c,127 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,128 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      130
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,129 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      131
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;B_controller_v2.c,130 :: 		break;
	GOTO       L_Move7
;B_controller_v2.c,131 :: 		}
L_Move6:
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move19
	MOVLW      1
	XORWF      FARG_Move_button+0, 0
L__Move19:
	BTFSC      STATUS+0, 2
	GOTO       L_Move8
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move20
	MOVLW      2
	XORWF      FARG_Move_button+0, 0
L__Move20:
	BTFSC      STATUS+0, 2
	GOTO       L_Move9
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move21
	MOVLW      4
	XORWF      FARG_Move_button+0, 0
L__Move21:
	BTFSC      STATUS+0, 2
	GOTO       L_Move10
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move22
	MOVLW      8
	XORWF      FARG_Move_button+0, 0
L__Move22:
	BTFSC      STATUS+0, 2
	GOTO       L_Move11
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move23
	MOVLW      16
	XORWF      FARG_Move_button+0, 0
L__Move23:
	BTFSC      STATUS+0, 2
	GOTO       L_Move12
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move24
	MOVLW      32
	XORWF      FARG_Move_button+0, 0
L__Move24:
	BTFSC      STATUS+0, 2
	GOTO       L_Move13
	GOTO       L_Move14
L_Move7:
;B_controller_v2.c,132 :: 		}
L_end_Move:
	RETURN
; end of _Move

_RunMotor:

;B_controller_v2.c,134 :: 		void RunMotor(int address, int command, int _data)
;B_controller_v2.c,136 :: 		Soft_UART_Write(address);
	MOVF       FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v2.c,137 :: 		Soft_UART_Write(command);
	MOVF       FARG_RunMotor_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v2.c,138 :: 		Soft_UART_Write(_data);
	MOVF       FARG_RunMotor__data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;B_controller_v2.c,139 :: 		Soft_UART_Write((address + command + _data) & 0x7F);
	MOVF       FARG_RunMotor_command+0, 0
	ADDWF      FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_RunMotor__data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;B_controller_v2.c,141 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_RunMotor15:
	DECFSZ     R13, 1
	GOTO       L_RunMotor15
	DECFSZ     R12, 1
	GOTO       L_RunMotor15
	NOP
	NOP
;B_controller_v2.c,142 :: 		}
L_end_RunMotor:
	RETURN
; end of _RunMotor
