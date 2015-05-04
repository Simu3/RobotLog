
_Main:

;A_controller_v2.c,18 :: 		void Main()
;A_controller_v2.c,20 :: 		char error = 0;
	CLRF       Main_error_L0+0
	CLRF       Main_button_L0+0
;A_controller_v2.c,23 :: 		SetUp();
	CALL       _SetUp+0
;A_controller_v2.c,25 :: 		while(1){
L_Main0:
;A_controller_v2.c,26 :: 		do{
L_Main2:
;A_controller_v2.c,27 :: 		button = Soft_UART_Read(&error);
	MOVLW      Main_error_L0+0
	MOVWF      FARG_Soft_UART_Read_error+0
	MOVLW      hi_addr(Main_error_L0+0)
	MOVWF      FARG_Soft_UART_Read_error+1
	CALL       _Soft_UART_Read+0
	MOVF       R0, 0
	MOVWF      Main_button_L0+0
;A_controller_v2.c,28 :: 		}while(error);
	MOVF       Main_error_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Main2
;A_controller_v2.c,30 :: 		Move(button);
	MOVF       Main_button_L0+0, 0
	MOVWF      FARG_Move+0
	CLRF       FARG_Move+1
	CALL       _Move+0
;A_controller_v2.c,31 :: 		}
	GOTO       L_Main0
;A_controller_v2.c,32 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;A_controller_v2.c,34 :: 		void SetUp()
;A_controller_v2.c,36 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;A_controller_v2.c,38 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;A_controller_v2.c,39 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;A_controller_v2.c,41 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;A_controller_v2.c,42 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;A_controller_v2.c,44 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;A_controller_v2.c,45 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;A_controller_v2.c,47 :: 		Soft_UART_Init(&PORTB, 4, 3, 9600, 0);
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
;A_controller_v2.c,49 :: 		Delay_ms(10);
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
;A_controller_v2.c,50 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_Move:

;A_controller_v2.c,52 :: 		void Move(int button)
;A_controller_v2.c,57 :: 		switch(button){
	GOTO       L_Move6
;A_controller_v2.c,59 :: 		case 0x01: speed += 3;
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
;A_controller_v2.c,60 :: 		if(speed >= STRAIGHT_SPEED)
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
;A_controller_v2.c,61 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move9:
;A_controller_v2.c,63 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,65 :: 		case 0x02: speed += 3;
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
;A_controller_v2.c,66 :: 		if(speed >= STRAIGHT_SPEED)
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
;A_controller_v2.c,67 :: 		speed = STRAIGHT_SPEED;
	MOVLW      127
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move11:
;A_controller_v2.c,69 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,71 :: 		case 0x04: speed += 3;
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
;A_controller_v2.c,72 :: 		if(speed >= TURN_SPEED)
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
;A_controller_v2.c,73 :: 		speed = TURN_SPEED;
	MOVLW      64
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move13:
;A_controller_v2.c,75 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,77 :: 		case 0x08: speed += 3;
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
;A_controller_v2.c,78 :: 		if(speed >= TURN_SPEED)
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
;A_controller_v2.c,79 :: 		speed = TURN_SPEED;
	MOVLW      64
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move15:
;A_controller_v2.c,81 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,83 :: 		case 0x40: speed += 3;
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
;A_controller_v2.c,84 :: 		if(speed >= CURVE_SPEED)
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
;A_controller_v2.c,85 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move17:
;A_controller_v2.c,87 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,89 :: 		case 0x80: speed += 3;
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
;A_controller_v2.c,90 :: 		if(speed >= CURVE_SPEED)
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
;A_controller_v2.c,91 :: 		speed = CURVE_SPEED;
	MOVLW      102
	MOVWF      Move_speed_L0+0
	MOVLW      0
	MOVWF      Move_speed_L0+1
L_Move19:
;A_controller_v2.c,93 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,95 :: 		case 0x10: before_command = button;
L_Move20:
;A_controller_v2.c,96 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,98 :: 		case 0x20: before_command = button;
L_Move21:
;A_controller_v2.c,99 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,101 :: 		default  : speed -= 3;
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
;A_controller_v2.c,102 :: 		if(speed <= STOP)
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
;A_controller_v2.c,103 :: 		speed = STOP;
	CLRF       Move_speed_L0+0
	CLRF       Move_speed_L0+1
L_Move23:
;A_controller_v2.c,104 :: 		break;
	GOTO       L_Move7
;A_controller_v2.c,155 :: 		}
L_Move6:
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move47
	MOVLW      1
	XORWF      FARG_Move_button+0, 0
L__Move47:
	BTFSC      STATUS+0, 2
	GOTO       L_Move8
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move48
	MOVLW      2
	XORWF      FARG_Move_button+0, 0
L__Move48:
	BTFSC      STATUS+0, 2
	GOTO       L_Move10
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move49
	MOVLW      4
	XORWF      FARG_Move_button+0, 0
L__Move49:
	BTFSC      STATUS+0, 2
	GOTO       L_Move12
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move50
	MOVLW      8
	XORWF      FARG_Move_button+0, 0
L__Move50:
	BTFSC      STATUS+0, 2
	GOTO       L_Move14
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move51
	MOVLW      64
	XORWF      FARG_Move_button+0, 0
L__Move51:
	BTFSC      STATUS+0, 2
	GOTO       L_Move16
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move52
	MOVLW      128
	XORWF      FARG_Move_button+0, 0
L__Move52:
	BTFSC      STATUS+0, 2
	GOTO       L_Move18
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move53
	MOVLW      16
	XORWF      FARG_Move_button+0, 0
L__Move53:
	BTFSC      STATUS+0, 2
	GOTO       L_Move20
	MOVLW      0
	XORWF      FARG_Move_button+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Move54
	MOVLW      32
	XORWF      FARG_Move_button+0, 0
L__Move54:
	BTFSC      STATUS+0, 2
	GOTO       L_Move21
	GOTO       L_Move22
L_Move7:
;A_controller_v2.c,156 :: 		}
L_end_Move:
	RETURN
; end of _Move

_RunMotor:

;A_controller_v2.c,158 :: 		void RunMotor(int address, int command, int _data)
;A_controller_v2.c,160 :: 		Soft_UART_Write(address);
	MOVF       FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v2.c,161 :: 		Soft_UART_Write(command);
	MOVF       FARG_RunMotor_command+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v2.c,162 :: 		Soft_UART_Write(_data);
	MOVF       FARG_RunMotor__data+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;A_controller_v2.c,163 :: 		Soft_UART_Write((address + command + _data) & 0x7F);
	MOVF       FARG_RunMotor_command+0, 0
	ADDWF      FARG_RunMotor_address+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	MOVF       FARG_RunMotor__data+0, 0
	ADDWF      FARG_Soft_UART_Write_udata+0, 1
	MOVLW      127
	ANDWF      FARG_Soft_UART_Write_udata+0, 1
	CALL       _Soft_UART_Write+0
;A_controller_v2.c,165 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_RunMotor36:
	DECFSZ     R13, 1
	GOTO       L_RunMotor36
	DECFSZ     R12, 1
	GOTO       L_RunMotor36
	NOP
	NOP
;A_controller_v2.c,166 :: 		}
L_end_RunMotor:
	RETURN
; end of _RunMotor
