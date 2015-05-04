
_Main:

;A_controller.c,18 :: 		void Main()
;A_controller.c,20 :: 		char error = 0;
	CLRF       Main_error_L0+0
	CLRF       Main_button_L0+0
;A_controller.c,23 :: 		Setup();
	CALL       _Setup+0
;A_controller.c,25 :: 		while(1){
L_Main0:
;A_controller.c,26 :: 		do{
L_Main2:
;A_controller.c,27 :: 		button = Soft_UART_Read(&error);
	MOVLW      Main_error_L0+0
	MOVWF      FARG_Soft_UART_Read_error+0
	MOVLW      hi_addr(Main_error_L0+0)
	MOVWF      FARG_Soft_UART_Read_error+1
	CALL       _Soft_UART_Read+0
	MOVF       R0, 0
	MOVWF      Main_button_L0+0
;A_controller.c,28 :: 		}while(error);
	MOVF       Main_error_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Main2
;A_controller.c,30 :: 		Move(button);
	MOVF       Main_button_L0+0, 0
	MOVWF      FARG_Move+0
	CLRF       FARG_Move+1
	CALL       _Move+0
;A_controller.c,31 :: 		}
	GOTO       L_Main0
;A_controller.c,32 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;A_controller.c,34 :: 		void Setup()
;A_controller.c,36 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;A_controller.c,38 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;A_controller.c,39 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;A_controller.c,41 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;A_controller.c,42 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;A_controller.c,44 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;A_controller.c,45 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;A_controller.c,47 :: 		Soft_UART_Init(&PORTB, 4, 3, 9600, 0);
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
;A_controller.c,49 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Setup5:
	DECFSZ     R13, 1
	GOTO       L_Setup5
	DECFSZ     R12, 1
	GOTO       L_Setup5
	NOP
;A_controller.c,50 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Move:

;A_controller.c,52 :: 		void Move(int button)
;A_controller.c,57 :: 		switch(button){
	GOTO       L_Move6
;A_controller.c,59 :: 		case 0x01: speed += 3;
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
;A_controller.c,60 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move40
	MOVLW      127
	SUBWF      R1, 0
L__Move40:
	BTFSS      STATUS+0, 0
	GOTO       L_Move9
;A_controller.c,61 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move9:
;A_controller.c,62 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,63 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,64 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,65 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,66 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,67 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,68 :: 		break;
	GOTO       L_Move7
;A_controller.c,70 :: 		case 0x02: speed += 3;
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
;A_controller.c,71 :: 		if(speed >= STRAIGHT_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move41
	MOVLW      127
	SUBWF      R1, 0
L__Move41:
	BTFSS      STATUS+0, 0
	GOTO       L_Move11
;A_controller.c,72 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move11:
;A_controller.c,73 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,74 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,75 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,76 :: 		Run_Motor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,77 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,78 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,79 :: 		break;
	GOTO       L_Move7
;A_controller.c,81 :: 		case 0x04: speed += 3;
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
;A_controller.c,82 :: 		if(speed >= TURN_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move42
	MOVLW      64
	SUBWF      R1, 0
L__Move42:
	BTFSS      STATUS+0, 0
	GOTO       L_Move13
;A_controller.c,83 :: 		speed = TURN_SPEED;
	MOVLW      64
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move13:
;A_controller.c,84 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,85 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,86 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,87 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,88 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,89 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,90 :: 		break;
	GOTO       L_Move7
;A_controller.c,92 :: 		case 0x08: speed += 3;
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
;A_controller.c,93 :: 		if(speed >= TURN_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move43
	MOVLW      64
	SUBWF      R1, 0
L__Move43:
	BTFSS      STATUS+0, 0
	GOTO       L_Move15
;A_controller.c,94 :: 		speed = TURN_SPEED;
	MOVLW      64
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move15:
;A_controller.c,95 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,96 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,97 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,98 :: 		Run_Motor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,99 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,100 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,101 :: 		break;
	GOTO       L_Move7
;A_controller.c,103 :: 		case 0x40: speed += 3;
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
;A_controller.c,104 :: 		if(speed >= CURVE_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move44
	MOVLW      102
	SUBWF      R1, 0
L__Move44:
	BTFSS      STATUS+0, 0
	GOTO       L_Move17
;A_controller.c,105 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move17:
;A_controller.c,106 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,107 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,108 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,109 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,110 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,111 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,112 :: 		break;
	GOTO       L_Move7
;A_controller.c,114 :: 		case 0x80: speed += 3;
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
;A_controller.c,115 :: 		if(speed >= CURVE_SPEED)
	MOVLW      128
	XORWF      R2, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move45
	MOVLW      102
	SUBWF      R1, 0
L__Move45:
	BTFSS      STATUS+0, 0
	GOTO       L_Move19
;A_controller.c,116 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move19:
;A_controller.c,117 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,118 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,119 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,120 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,121 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,122 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,123 :: 		break;
	GOTO       L_Move7
;A_controller.c,125 :: 		case 0x10: Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move20:
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,126 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,127 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,128 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,129 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_REVERSE, BEL_CON_SPEED);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVLW      127
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,130 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,131 :: 		break;
	GOTO       L_Move7
;A_controller.c,133 :: 		case 0x20: Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
L_Move21:
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,134 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,135 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,136 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,137 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, BEL_CON_SPEED);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      127
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,138 :: 		before_command = button;
	MOVF       FARG_Move_button+0, 0
	MOVWF      Move_before_command_L0+0
	MOVF       FARG_Move_button+1, 0
	MOVWF      Move_before_command_L0+1
;A_controller.c,139 :: 		break;
	GOTO       L_Move7
;A_controller.c,141 :: 		default  : speed -= 3;
L_Move22:
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
;A_controller.c,142 :: 		if(speed <= STOP)
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      R2, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move46
	MOVF       R1, 0
	SUBLW      0
L__Move46:
	BTFSS      STATUS+0, 0
	GOTO       L_Move23
;A_controller.c,143 :: 		speed = STOP;
	CLRF       Move_speed_L0+0
	CLRF       Move_speed_L0+1
L_Move23:
;A_controller.c,144 :: 		if(before_command == 0x01){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move47
	MOVLW      1
	XORWF      Move_before_command_L0+0, 0
L__Move47:
	BTFSS      STATUS+0, 2
	GOTO       L_Move24
;A_controller.c,145 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,146 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,147 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,148 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,149 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,150 :: 		}
	GOTO       L_Move25
L_Move24:
;A_controller.c,151 :: 		else if(before_command == 0x02){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move48
	MOVLW      2
	XORWF      Move_before_command_L0+0, 0
L__Move48:
	BTFSS      STATUS+0, 2
	GOTO       L_Move26
;A_controller.c,152 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,153 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,154 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,155 :: 		Run_Motor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,156 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,157 :: 		}
	GOTO       L_Move27
L_Move26:
;A_controller.c,158 :: 		else if(before_command == 0x04){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move49
	MOVLW      4
	XORWF      Move_before_command_L0+0, 0
L__Move49:
	BTFSS      STATUS+0, 2
	GOTO       L_Move28
;A_controller.c,159 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,160 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,161 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,162 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,163 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,164 :: 		}
	GOTO       L_Move29
L_Move28:
;A_controller.c,165 :: 		else if(before_command == 0x08){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move50
	MOVLW      8
	XORWF      Move_before_command_L0+0, 0
L__Move50:
	BTFSS      STATUS+0, 2
	GOTO       L_Move30
;A_controller.c,166 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,167 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,168 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,169 :: 		Run_Motor(LEFT_ADD,    MOTOR2_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,170 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,171 :: 		}
	GOTO       L_Move31
L_Move30:
;A_controller.c,172 :: 		else if(before_command == 0x40){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move51
	MOVLW      64
	XORWF      Move_before_command_L0+0, 0
L__Move51:
	BTFSS      STATUS+0, 2
	GOTO       L_Move32
;A_controller.c,173 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,174 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,175 :: 		Run_Motor(LEFT_ADD,    MOTOR1_REVERSE, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      1
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,176 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, speed);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,177 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,178 :: 		}
	GOTO       L_Move33
L_Move32:
;A_controller.c,179 :: 		else if(before_command == 0x80){
	MOVLW      0
	XORWF      Move_before_command_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move52
	MOVLW      128
	XORWF      Move_before_command_L0+0, 0
L__Move52:
	BTFSS      STATUS+0, 2
	GOTO       L_Move34
;A_controller.c,180 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,181 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      5
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	MOVF       Move_speed_L0+0, 0
	MOVWF      FARG_Run_Motor+0
	MOVF       Move_speed_L0+1, 0
	MOVWF      FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,182 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,183 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,184 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,185 :: 		}
	GOTO       L_Move35
L_Move34:
;A_controller.c,187 :: 		Run_Motor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,188 :: 		Run_Motor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
	MOVLW      132
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,189 :: 		Run_Motor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,190 :: 		Run_Motor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
	MOVLW      133
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	MOVLW      4
	MOVWF      FARG_Run_Motor+0
	MOVLW      0
	MOVWF      FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,191 :: 		Run_Motor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
	MOVLW      134
	MOVWF      FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CLRF       FARG_Run_Motor+0
	CLRF       FARG_Run_Motor+1
	CALL       _Run_Motor+0
;A_controller.c,192 :: 		}
L_Move35:
L_Move33:
L_Move31:
L_Move29:
L_Move27:
L_Move25:
;A_controller.c,193 :: 		}
	GOTO       L_Move7
L_Move6:
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move53
	MOVLW      1
	XORWF      FARG_Move_button+0, 0
L__Move53:
	BTFSC      STATUS+0, 2
	GOTO       L_Move8
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move54
	MOVLW      2
	XORWF      FARG_Move_button+0, 0
L__Move54:
	BTFSC      STATUS+0, 2
	GOTO       L_Move10
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move55
	MOVLW      4
	XORWF      FARG_Move_button+0, 0
L__Move55:
	BTFSC      STATUS+0, 2
	GOTO       L_Move12
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move56
	MOVLW      8
	XORWF      FARG_Move_button+0, 0
L__Move56:
	BTFSC      STATUS+0, 2
	GOTO       L_Move14
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move57
	MOVLW      64
	XORWF      FARG_Move_button+0, 0
L__Move57:
	BTFSC      STATUS+0, 2
	GOTO       L_Move16
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move58
	MOVLW      128
	XORWF      FARG_Move_button+0, 0
L__Move58:
	BTFSC      STATUS+0, 2
	GOTO       L_Move18
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move59
	MOVLW      16
	XORWF      FARG_Move_button+0, 0
L__Move59:
	BTFSC      STATUS+0, 2
	GOTO       L_Move20
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move60
	MOVLW      32
	XORWF      FARG_Move_button+0, 0
L__Move60:
	BTFSC      STATUS+0, 2
	GOTO       L_Move21
	GOTO       L_Move22
L_Move7:
;A_controller.c,194 :: 		}
L_end_Move:
	RETURN
; end of _Move

_Run_Motor:

;A_controller.c,196 :: 		void Run_Motor(int address, int command, int _data)
;A_controller.c,198 :: 		Soft_UART_write(address);
	MOVF       FARG_Run_Motor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller.c,199 :: 		Soft_UART_write(command);
	MOVF       FARG_Run_Motor_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller.c,200 :: 		Soft_UART_write(_data);
	MOVF       FARG_Run_Motor__data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller.c,201 :: 		Soft_UART_write((address + command + _data) & 0x7F);
	MOVF       FARG_Run_Motor_command+0, 0
	ADDWF      FARG_Run_Motor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_Run_Motor__data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;A_controller.c,203 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_Run_Motor36:
	DECFSZ     R13, 1
	GOTO       L_Run_Motor36
	DECFSZ     R12, 1
	GOTO       L_Run_Motor36
	NOP
	NOP
;A_controller.c,204 :: 		}
L_end_Run_Motor:
	RETURN
; end of _Run_Motor
