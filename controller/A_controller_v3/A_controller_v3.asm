
_Main:

;A_controller_v3.c,18 :: 		void Main()
;A_controller_v3.c,20 :: 		char error = 0;
	CLRF       Main_error_L0+0
	CLRF       Main_button_L0+0
;A_controller_v3.c,23 :: 		SetUp();
	CALL       _SetUp+0
;A_controller_v3.c,25 :: 		while(1){
L_Main0:
;A_controller_v3.c,26 :: 		do{
L_Main2:
;A_controller_v3.c,27 :: 		button = Soft_UART_Read(&error);
	MOVLW      Main_error_L0+0
	MOVWF      FARG_Soft_UART_Read_error+0
	MOVLW      hi_addr(Main_error_L0+0)
	MOVWF      FARG_Soft_UART_Read_error+1
	CALL       _Soft_UART_Read+0
	MOVF       R0, 0
	MOVWF      Main_button_L0+0
;A_controller_v3.c,28 :: 		}while(error);
	MOVF       Main_error_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Main2
;A_controller_v3.c,30 :: 		Move(button);
	MOVF       Main_button_L0+0, 0
	MOVWF      FARG_Move+0
	CLRF       FARG_Move+1
	CALL       _Move+0
;A_controller_v3.c,31 :: 		}
	GOTO       L_Main0
;A_controller_v3.c,32 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;A_controller_v3.c,34 :: 		void SetUp()
;A_controller_v3.c,36 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;A_controller_v3.c,38 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;A_controller_v3.c,39 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;A_controller_v3.c,41 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;A_controller_v3.c,42 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;A_controller_v3.c,44 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;A_controller_v3.c,45 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;A_controller_v3.c,47 :: 		Soft_UART_Init(&PORTB, 4, 2, 9600, 0);
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
;A_controller_v3.c,49 :: 		Delay_ms(10);
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
;A_controller_v3.c,50 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_Move:

;A_controller_v3.c,52 :: 		void Move(int button)
;A_controller_v3.c,57 :: 		switch(button){
	GOTO       L_Move6
;A_controller_v3.c,59 :: 		case 0x01: speed += 3;
L_Move8:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,60 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move50
	MOVLW      127
	SUBWF      R1, 0
L__Move50:
	BTFSS      STATUS+0, 0
	GOTO       L_Move9
;A_controller_v3.c,61 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move9:
;A_controller_v3.c,62 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,63 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,64 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,65 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,66 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,67 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,68 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,70 :: 		case 0x05: speed += 3;
L_Move10:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,71 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move51
	MOVLW      127
	SUBWF      R1, 0
L__Move51:
	BTFSS      STATUS+0, 0
	GOTO       L_Move11
;A_controller_v3.c,72 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move11:
;A_controller_v3.c,73 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed - 25);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      25
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,74 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed - 25);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      25
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,75 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,76 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,77 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,78 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,79 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,81 :: 		case 0x09: speed += 3;
L_Move12:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,82 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move52
	MOVLW      127
	SUBWF      R1, 0
L__Move52:
	BTFSS      STATUS+0, 0
	GOTO       L_Move13
;A_controller_v3.c,83 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move13:
;A_controller_v3.c,84 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,85 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,86 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed - 25);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      25
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,87 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed - 25);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      25
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,88 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,89 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,90 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,92 :: 		case 0x02: speed += 3;
L_Move14:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,93 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move53
	MOVLW      127
	SUBWF      R1, 0
L__Move53:
	BTFSS      STATUS+0, 0
	GOTO       L_Move15
;A_controller_v3.c,94 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move15:
;A_controller_v3.c,95 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,96 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,97 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,98 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,99 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,100 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,101 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,103 :: 		case 0x04: speed += 3;
L_Move16:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,104 :: 		if(speed >= TURN_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move54
	MOVLW      35
	SUBWF      R1, 0
L__Move54:
	BTFSS      STATUS+0, 0
	GOTO       L_Move17
;A_controller_v3.c,105 :: 		speed = TURN_SPEED;
	MOVLW      35
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move17:
;A_controller_v3.c,106 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,107 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,108 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,109 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,110 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,111 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,112 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,114 :: 		case 0x08: speed += 3;
L_Move18:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,115 :: 		if(speed >= TURN_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move55
	MOVLW      35
	SUBWF      R1, 0
L__Move55:
	BTFSS      STATUS+0, 0
	GOTO       L_Move19
;A_controller_v3.c,116 :: 		speed = TURN_SPEED;
	MOVLW      35
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move19:
;A_controller_v3.c,117 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,118 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,119 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,120 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,121 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,122 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,123 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,125 :: 		case 0x40: speed += 3;
L_Move20:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,126 :: 		if(speed >= CURVE_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move56
	MOVLW      102
	SUBWF      R1, 0
L__Move56:
	BTFSS      STATUS+0, 0
	GOTO       L_Move21
;A_controller_v3.c,127 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move21:
;A_controller_v3.c,128 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,129 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,130 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,131 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,132 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,133 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,134 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,136 :: 		case 0x80: speed += 3;
L_Move22:
	MOVLW      3
	ADDWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	ADDWFC     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,137 :: 		if(speed >= CURVE_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move57
	MOVLW      102
	SUBWF      R1, 0
L__Move57:
	BTFSS      STATUS+0, 0
	GOTO       L_Move23
;A_controller_v3.c,138 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move23:
;A_controller_v3.c,139 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,140 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,141 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,142 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,143 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,144 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,145 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,147 :: 		case 0x10: RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move24:
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,148 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,149 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,150 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,151 :: 		RunMotor(BEL_CON_ADD, MOTOR1_REVERSE, BEL_CON_SPEED);
	MOVLW      134
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
;A_controller_v3.c,152 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,153 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,155 :: 		case 0x20: RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move25:
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,156 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,157 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,158 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,159 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, BEL_CON_SPEED);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      127
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,160 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,161 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,163 :: 		case 0x11: RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move26:
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,164 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,165 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,166 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,167 :: 		RunMotor(BEL_CON_ADD, MOTOR1_REVERSE, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,168 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,169 :: 		PORTB.B1 = 1;
	BSF        PORTB+0, 1
;A_controller_v3.c,170 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,172 :: 		case 0x22: RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move27:
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,173 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,174 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,175 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,176 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,177 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller_v3.c,178 :: 		PORTB.B1 = 0;
	BCF        PORTB+0, 1
;A_controller_v3.c,179 :: 		break;
	GOTO       L_Move7
;A_controller_v3.c,181 :: 		default  : speed -= 3;
L_Move28:
	MOVLW      3
	SUBWF      Move_speed_L0+0, 0
	MOVWF      R1
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      Move_speed_L0+0
	MOVF       R2, 0
	MOVWF      Move_speed_L0+1
;A_controller_v3.c,182 :: 		if(speed <= STOP)
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R2, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move58
	MOVF       R1, 0
	SUBLW      0
L__Move58:
	BTFSS      STATUS+0, 0
	GOTO       L_Move29
;A_controller_v3.c,183 :: 		speed = STOP;
	CLRF       Move_speed_L0+0
	CLRF       Move_speed_L0+1
L_Move29:
;A_controller_v3.c,184 :: 		if(before_command == 0x01){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move59
	MOVLW      1
	XORWF      Move_before_command_L0+0, 0
L__Move59:
	BTFSS      STATUS+0, 2
	GOTO       L_Move30
;A_controller_v3.c,185 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,186 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,187 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,188 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,189 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,190 :: 		}
	GOTO       L_Move31
L_Move30:
;A_controller_v3.c,191 :: 		else if(before_command == 0x05){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move60
	MOVLW      5
	XORWF      Move_before_command_L0+0, 0
L__Move60:
	BTFSS      STATUS+0, 2
	GOTO       L_Move32
;A_controller_v3.c,192 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed - 20);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      20
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,193 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed - 20);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      20
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,194 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,195 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,196 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,197 :: 		}
	GOTO       L_Move33
L_Move32:
;A_controller_v3.c,198 :: 		else if(before_command == 0x09){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move61
	MOVLW      9
	XORWF      Move_before_command_L0+0, 0
L__Move61:
	BTFSS      STATUS+0, 2
	GOTO       L_Move34
;A_controller_v3.c,199 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,200 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,201 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed - 20);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      20
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,202 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed - 20);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVLW      20
	SUBWF      Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	SUBWFB     Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,203 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,204 :: 		}
	GOTO       L_Move35
L_Move34:
;A_controller_v3.c,205 :: 		else if(before_command == 0x02){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move62
	MOVLW      2
	XORWF      Move_before_command_L0+0, 0
L__Move62:
	BTFSS      STATUS+0, 2
	GOTO       L_Move36
;A_controller_v3.c,206 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,207 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,208 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,209 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,210 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,211 :: 		}
	GOTO       L_Move37
L_Move36:
;A_controller_v3.c,212 :: 		else if(before_command == 0x04){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move63
	MOVLW      4
	XORWF      Move_before_command_L0+0, 0
L__Move63:
	BTFSS      STATUS+0, 2
	GOTO       L_Move38
;A_controller_v3.c,213 :: 		RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,214 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,215 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,216 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,217 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,218 :: 		}
	GOTO       L_Move39
L_Move38:
;A_controller_v3.c,219 :: 		else if(before_command == 0x08){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move64
	MOVLW      8
	XORWF      Move_before_command_L0+0, 0
L__Move64:
	BTFSS      STATUS+0, 2
	GOTO       L_Move40
;A_controller_v3.c,220 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,221 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,222 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,223 :: 		RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,224 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,225 :: 		}
	GOTO       L_Move41
L_Move40:
;A_controller_v3.c,226 :: 		else if(before_command == 0x40){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move65
	MOVLW      64
	XORWF      Move_before_command_L0+0, 0
L__Move65:
	BTFSS      STATUS+0, 2
	GOTO       L_Move42
;A_controller_v3.c,227 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,228 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,229 :: 		RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      1
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,230 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,231 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,232 :: 		}
	GOTO       L_Move43
L_Move42:
;A_controller_v3.c,233 :: 		else if(before_command == 0x80){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move66
	MOVLW      128
	XORWF      Move_before_command_L0+0, 0
L__Move66:
	BTFSS      STATUS+0, 2
	GOTO       L_Move44
;A_controller_v3.c,234 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,235 :: 		RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      5
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_RunMotor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,236 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,237 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,238 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,239 :: 		}
	GOTO       L_Move45
L_Move44:
;A_controller_v3.c,241 :: 		RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,242 :: 		RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,243 :: 		RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,244 :: 		RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	MOVLW      4
	MOVWF      FARG_RunMotor+0
	MOVLW      0
	MOVWF      FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,245 :: 		RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CLRF       FARG_RunMotor+0
	CLRF       FARG_RunMotor+1
	CALL       _RunMotor+0
;A_controller_v3.c,246 :: 		}
L_Move45:
L_Move43:
L_Move41:
L_Move39:
L_Move37:
L_Move35:
L_Move33:
L_Move31:
;A_controller_v3.c,247 :: 		}
	GOTO       L_Move7
L_Move6:
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move67
	MOVLW      1
	XORWF      FARG_Move_button+0, 0
L__Move67:
	BTFSC      STATUS+0, 2
	GOTO       L_Move8
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move68
	MOVLW      5
	XORWF      FARG_Move_button+0, 0
L__Move68:
	BTFSC      STATUS+0, 2
	GOTO       L_Move10
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move69
	MOVLW      9
	XORWF      FARG_Move_button+0, 0
L__Move69:
	BTFSC      STATUS+0, 2
	GOTO       L_Move12
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move70
	MOVLW      2
	XORWF      FARG_Move_button+0, 0
L__Move70:
	BTFSC      STATUS+0, 2
	GOTO       L_Move14
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move71
	MOVLW      4
	XORWF      FARG_Move_button+0, 0
L__Move71:
	BTFSC      STATUS+0, 2
	GOTO       L_Move16
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move72
	MOVLW      8
	XORWF      FARG_Move_button+0, 0
L__Move72:
	BTFSC      STATUS+0, 2
	GOTO       L_Move18
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move73
	MOVLW      64
	XORWF      FARG_Move_button+0, 0
L__Move73:
	BTFSC      STATUS+0, 2
	GOTO       L_Move20
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move74
	MOVLW      128
	XORWF      FARG_Move_button+0, 0
L__Move74:
	BTFSC      STATUS+0, 2
	GOTO       L_Move22
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move75
	MOVLW      16
	XORWF      FARG_Move_button+0, 0
L__Move75:
	BTFSC      STATUS+0, 2
	GOTO       L_Move24
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move76
	MOVLW      32
	XORWF      FARG_Move_button+0, 0
L__Move76:
	BTFSC      STATUS+0, 2
	GOTO       L_Move25
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move77
	MOVLW      17
	XORWF      FARG_Move_button+0, 0
L__Move77:
	BTFSC      STATUS+0, 2
	GOTO       L_Move26
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move78
	MOVLW      34
	XORWF      FARG_Move_button+0, 0
L__Move78:
	BTFSC      STATUS+0, 2
	GOTO       L_Move27
	GOTO       L_Move28
L_Move7:
;A_controller_v3.c,248 :: 		}
L_end_Move:
	RETURN
; end of _Move

_RunMotor:

;A_controller_v3.c,250 :: 		void RunMotor(int address, int command, int _data)
;A_controller_v3.c,252 :: 		Soft_UART_Write(address);
	MOVF       FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v3.c,253 :: 		Soft_UART_Write(command);
	MOVF       FARG_RunMotor_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v3.c,254 :: 		Soft_UART_Write(_data);
	MOVF       FARG_RunMotor__data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v3.c,255 :: 		Soft_UART_Write((address + command + _data) & 0x7F);
	MOVF       FARG_RunMotor_command+0, 0
	ADDWF      FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_RunMotor__data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;A_controller_v3.c,257 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_RunMotor46:
	DECFSZ     R13, 1
	GOTO       L_RunMotor46
	DECFSZ     R12, 1
	GOTO       L_RunMotor46
	NOP
	NOP
;A_controller_v3.c,258 :: 		}
L_end_RunMotor:
	RETURN
; end of _RunMotor
