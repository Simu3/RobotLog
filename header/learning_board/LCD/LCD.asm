
_Main:

;LCD.c,24 :: 		void Main()
;LCD.c,26 :: 		int count = 0;
	CLRF       Main_count_L0+0
	CLRF       Main_count_L0+1
;LCD.c,28 :: 		Setup();
	CALL       _Setup+0
;LCD.c,30 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,35 :: 		while(1){
L_Main0:
;LCD.c,36 :: 		if(Button(&PORTC, UP, 80, 1))
	MOVLW      PORTC+0
	MOVWF      FARG_Button_port+0
	MOVLW      hi_addr(PORTC+0)
	MOVWF      FARG_Button_port+1
	MOVLW      4
	MOVWF      FARG_Button_pin+0
	MOVLW      80
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main2
;LCD.c,37 :: 		count ++;
	INCF       Main_count_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_count_L0+1, 1
	GOTO       L_Main3
L_Main2:
;LCD.c,38 :: 		else if(Button(&PORTC, DOWN, 80, 1))
	MOVLW      PORTC+0
	MOVWF      FARG_Button_port+0
	MOVLW      hi_addr(PORTC+0)
	MOVWF      FARG_Button_port+1
	MOVLW      5
	MOVWF      FARG_Button_pin+0
	MOVLW      80
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main4
;LCD.c,39 :: 		count --;
	MOVLW      1
	SUBWF      Main_count_L0+0, 1
	MOVLW      0
	SUBWFB     Main_count_L0+1, 1
	GOTO       L_Main5
L_Main4:
;LCD.c,40 :: 		else if(Button(&PORTC, RESET, 80, 1))
	MOVLW      PORTC+0
	MOVWF      FARG_Button_port+0
	MOVLW      hi_addr(PORTC+0)
	MOVWF      FARG_Button_port+1
	MOVLW      6
	MOVWF      FARG_Button_pin+0
	MOVLW      80
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main6
;LCD.c,41 :: 		count = 0;
	CLRF       Main_count_L0+0
	CLRF       Main_count_L0+1
L_Main6:
L_Main5:
L_Main3:
;LCD.c,43 :: 		if(count > 9)
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      Main_count_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main27
	MOVF       Main_count_L0+0, 0
	SUBLW      9
L__Main27:
	BTFSC      STATUS+0, 0
	GOTO       L_Main7
;LCD.c,44 :: 		count = 9;
	MOVLW      9
	MOVWF      Main_count_L0+0
	MOVLW      0
	MOVWF      Main_count_L0+1
	GOTO       L_Main8
L_Main7:
;LCD.c,45 :: 		else if(count < -9)
	MOVLW      128
	XORWF      Main_count_L0+1, 0
	MOVWF      R0
	MOVLW      127
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main28
	MOVLW      247
	SUBWF      Main_count_L0+0, 0
L__Main28:
	BTFSC      STATUS+0, 0
	GOTO       L_Main9
;LCD.c,46 :: 		count = -9;
	MOVLW      247
	MOVWF      Main_count_L0+0
	MOVLW      255
	MOVWF      Main_count_L0+1
L_Main9:
L_Main8:
;LCD.c,48 :: 		if(count >= 0){
	MOVLW      128
	XORWF      Main_count_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main29
	MOVLW      0
	SUBWF      Main_count_L0+0, 0
L__Main29:
	BTFSS      STATUS+0, 0
	GOTO       L_Main10
;LCD.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,50 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,51 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,52 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,53 :: 		Lcd_Chr(1, 1, '+');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      43
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,54 :: 		Lcd_Chr(1, 2, Dec2Ascii(count));
	MOVF       Main_count_L0+0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;LCD.c,55 :: 		}
	GOTO       L_Main11
L_Main10:
;LCD.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,58 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,59 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,60 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,61 :: 		Lcd_Chr(1, 1, '-');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      45
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,62 :: 		Lcd_Chr(1, 2, Dec2Ascii(abs(count)));
	MOVF       Main_count_L0+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       Main_count_L0+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;LCD.c,63 :: 		}
L_Main11:
;LCD.c,64 :: 		}
	GOTO       L_Main0
;LCD.c,65 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;LCD.c,67 :: 		void Setup()
;LCD.c,69 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;LCD.c,71 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;LCD.c,72 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;LCD.c,73 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;LCD.c,74 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;LCD.c,76 :: 		TRISA  = 0x00;
	CLRF       TRISA+0
;LCD.c,77 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;LCD.c,78 :: 		TRISC  = 0x70;
	MOVLW      112
	MOVWF      TRISC+0
;LCD.c,79 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;LCD.c,80 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;LCD.c,82 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;LCD.c,83 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;LCD.c,84 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;LCD.c,85 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;LCD.c,86 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;LCD.c,88 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Setup12:
	DECFSZ     R13, 1
	GOTO       L_Setup12
	DECFSZ     R12, 1
	GOTO       L_Setup12
	NOP
;LCD.c,89 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Dec2Ascii:

;LCD.c,91 :: 		char Dec2Ascii(char dec)
;LCD.c,93 :: 		switch(dec){
	GOTO       L_Dec2Ascii13
;LCD.c,94 :: 		case 0:  return '0';
L_Dec2Ascii15:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,95 :: 		case 1:  return '1';
L_Dec2Ascii16:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,96 :: 		case 2:  return '2';
L_Dec2Ascii17:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,97 :: 		case 3:  return '3';
L_Dec2Ascii18:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,98 :: 		case 4:  return '4';
L_Dec2Ascii19:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,99 :: 		case 5:  return '5';
L_Dec2Ascii20:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,100 :: 		case 6:  return '6';
L_Dec2Ascii21:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,101 :: 		case 7:  return '7';
L_Dec2Ascii22:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,102 :: 		case 8:  return '8';
L_Dec2Ascii23:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,103 :: 		case 9:  return '9';
L_Dec2Ascii24:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,104 :: 		default: return '*';
L_Dec2Ascii25:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;LCD.c,105 :: 		}
L_Dec2Ascii13:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii15
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii16
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii17
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii18
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii19
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii20
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii21
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii22
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii23
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii24
	GOTO       L_Dec2Ascii25
;LCD.c,106 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
