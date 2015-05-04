
_main:

;accelerometer_test.c,218 :: 		void main()
;accelerometer_test.c,223 :: 		setup();
	CALL       _setup+0
;accelerometer_test.c,225 :: 		while(1){
L_main0:
;accelerometer_test.c,226 :: 		x=y=z=0;
	CLRF       main_z_L0+0
	CLRF       main_z_L0+1
	CLRF       main_y_L0+0
	CLRF       main_y_L0+1
	CLRF       main_x_L0+0
	CLRF       main_x_L0+1
;accelerometer_test.c,228 :: 		for(i=0; i<10; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main60:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;accelerometer_test.c,229 :: 		x+=ADC_read(XPIN);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	ADDWF      main_x_L0+0, 1
	MOVF       R1, 0
	ADDWFC     main_x_L0+1, 1
;accelerometer_test.c,230 :: 		y+=ADC_read(YPIN);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	ADDWF      main_y_L0+0, 1
	MOVF       R1, 0
	ADDWFC     main_y_L0+1, 1
;accelerometer_test.c,231 :: 		z+=ADC_read(ZPIN);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	ADDWF      main_z_L0+0, 1
	MOVF       R1, 0
	ADDWFC     main_z_L0+1, 1
;accelerometer_test.c,228 :: 		for(i=0; i<10; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;accelerometer_test.c,232 :: 		}
	GOTO       L_main2
L_main3:
;accelerometer_test.c,234 :: 		x=x/10-XBIAS;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       main_x_L0+0, 0
	MOVWF      R0
	MOVF       main_x_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVLW      6
	SUBWF      R0, 0
	MOVWF      main_x_L0+0
	MOVLW      2
	SUBWFB     R1, 0
	MOVWF      main_x_L0+1
;accelerometer_test.c,235 :: 		y=y/10-YBIAS;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       main_y_L0+0, 0
	MOVWF      R0
	MOVF       main_y_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVLW      253
	SUBWF      R0, 0
	MOVWF      main_y_L0+0
	MOVLW      1
	SUBWFB     R1, 0
	MOVWF      main_y_L0+1
;accelerometer_test.c,236 :: 		z=z/10-ZBIAS;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       main_z_L0+0, 0
	MOVWF      R0
	MOVF       main_z_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVLW      50
	SUBWF      R0, 0
	MOVWF      main_z_L0+0
	MOVLW      2
	SUBWFB     R1, 0
	MOVWF      main_z_L0+1
;accelerometer_test.c,243 :: 		x=(x>=0) ? angle_2(x, z) : -angle_2(x, z);
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      0
	SUBWF      main_x_L0+0, 0
L__main61:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_angle_2+1
	MOVF       main_z_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_z_L0+1, 0
	MOVWF      FARG_angle_2+1
	CALL       _angle_2+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	GOTO       L_main6
L_main5:
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_angle_2+1
	MOVF       main_z_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_z_L0+1, 0
	MOVWF      FARG_angle_2+1
	CALL       _angle_2+0
	MOVF       R0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       R1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
L_main6:
	MOVF       FLOC__main+0, 0
	MOVWF      main_x_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_x_L0+1
;accelerometer_test.c,244 :: 		y=(y>=0) ? angle_2(y, z) : -angle_2(y, z);
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      0
	SUBWF      main_y_L0+0, 0
L__main62:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_y_L0+1, 0
	MOVWF      FARG_angle_2+1
	MOVF       main_z_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_z_L0+1, 0
	MOVWF      FARG_angle_2+1
	CALL       _angle_2+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	GOTO       L_main8
L_main7:
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_y_L0+1, 0
	MOVWF      FARG_angle_2+1
	MOVF       main_z_L0+0, 0
	MOVWF      FARG_angle_2+0
	MOVF       main_z_L0+1, 0
	MOVWF      FARG_angle_2+1
	CALL       _angle_2+0
	MOVF       R0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       R1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
L_main8:
	MOVF       FLOC__main+0, 0
	MOVWF      main_y_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_y_L0+1
;accelerometer_test.c,246 :: 		if(x>=200)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      200
	SUBWF      main_x_L0+0, 0
L__main63:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;accelerometer_test.c,247 :: 		x=200;
	MOVLW      200
	MOVWF      main_x_L0+0
	CLRF       main_x_L0+1
	GOTO       L_main10
L_main9:
;accelerometer_test.c,248 :: 		else if(x<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVF       main_x_L0+0, 0
	SUBLW      56
L__main64:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;accelerometer_test.c,249 :: 		x=-200;
	MOVLW      56
	MOVWF      main_x_L0+0
	MOVLW      255
	MOVWF      main_x_L0+1
L_main11:
L_main10:
;accelerometer_test.c,251 :: 		if(y>=200)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      200
	SUBWF      main_y_L0+0, 0
L__main65:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;accelerometer_test.c,252 :: 		y=200;
	MOVLW      200
	MOVWF      main_y_L0+0
	CLRF       main_y_L0+1
	GOTO       L_main13
L_main12:
;accelerometer_test.c,253 :: 		else if(y<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       main_y_L0+0, 0
	SUBLW      56
L__main66:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;accelerometer_test.c,254 :: 		y=-200;
	MOVLW      56
	MOVWF      main_y_L0+0
	MOVLW      255
	MOVWF      main_y_L0+1
L_main14:
L_main13:
;accelerometer_test.c,256 :: 		output(x, y, 0);
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_output+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_output+1
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_output+0
	MOVF       main_y_L0+1, 0
	MOVWF      FARG_output+1
	CLRF       FARG_output+0
	CLRF       FARG_output+1
	CALL       _output+0
;accelerometer_test.c,257 :: 		}
	GOTO       L_main0
;accelerometer_test.c,258 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;accelerometer_test.c,260 :: 		void setup()
;accelerometer_test.c,262 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;accelerometer_test.c,264 :: 		ANSELA=0x07;
	MOVLW      7
	MOVWF      ANSELA+0
;accelerometer_test.c,265 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;accelerometer_test.c,266 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;accelerometer_test.c,267 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;accelerometer_test.c,268 :: 		TRISA=0x07;
	MOVLW      7
	MOVWF      TRISA+0
;accelerometer_test.c,269 :: 		TRISB=0x00;
	CLRF       TRISB+0
;accelerometer_test.c,270 :: 		TRISC=0x00;
	CLRF       TRISC+0
;accelerometer_test.c,271 :: 		TRISD=0x00;
	CLRF       TRISD+0
;accelerometer_test.c,272 :: 		TRISE=0x00;
	CLRF       TRISE+0
;accelerometer_test.c,274 :: 		PORTA=0x00;
	CLRF       PORTA+0
;accelerometer_test.c,275 :: 		PORTB=0x00;
	CLRF       PORTB+0
;accelerometer_test.c,276 :: 		PORTC=0x00;
	CLRF       PORTC+0
;accelerometer_test.c,277 :: 		PORTD=0x00;
	CLRF       PORTD+0
;accelerometer_test.c,278 :: 		PORTE=0x00;
	CLRF       PORTE+0
;accelerometer_test.c,280 :: 		ADC_Init();
	CALL       _ADC_Init+0
;accelerometer_test.c,282 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;accelerometer_test.c,284 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_setup15:
	DECFSZ     R13, 1
	GOTO       L_setup15
	DECFSZ     R12, 1
	GOTO       L_setup15
	DECFSZ     R11, 1
	GOTO       L_setup15
	NOP
	NOP
;accelerometer_test.c,285 :: 		}
L_end_setup:
	RETURN
; end of _setup

_output:

;accelerometer_test.c,287 :: 		void output(int x, int y, int z)
;accelerometer_test.c,289 :: 		UART_write((x>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_output_x+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__output69
	MOVLW      0
	SUBWF      FARG_output_x+0, 0
L__output69:
	BTFSS      STATUS+0, 0
	GOTO       L_output16
	MOVLW      43
	MOVWF      R0
	GOTO       L_output17
L_output16:
	MOVLW      45
	MOVWF      R0
L_output17:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,290 :: 		x=abs(x);
	MOVF       FARG_output_x+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_output_x+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_output_x+0
	MOVF       R1, 0
	MOVWF      FARG_output_x+1
;accelerometer_test.c,291 :: 		UART_write(dec2ascii((x%1000-x%100)/100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,292 :: 		UART_write(dec2ascii((x%100-x%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,293 :: 		UART_write(dec2ascii(x%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,294 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,296 :: 		UART_write((y>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_output_y+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__output70
	MOVLW      0
	SUBWF      FARG_output_y+0, 0
L__output70:
	BTFSS      STATUS+0, 0
	GOTO       L_output18
	MOVLW      43
	MOVWF      R0
	GOTO       L_output19
L_output18:
	MOVLW      45
	MOVWF      R0
L_output19:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,297 :: 		y=abs(y);
	MOVF       FARG_output_y+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_output_y+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_output_y+0
	MOVF       R1, 0
	MOVWF      FARG_output_y+1
;accelerometer_test.c,298 :: 		UART_write(dec2ascii((y%1000-y%100)/100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_y+0, 0
	MOVWF      R0
	MOVF       FARG_output_y+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,299 :: 		UART_write(dec2ascii((y%100-y%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_y+0, 0
	MOVWF      R0
	MOVF       FARG_output_y+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_y+0, 0
	MOVWF      R0
	MOVF       FARG_output_y+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,300 :: 		UART_write(dec2ascii(y%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_y+0, 0
	MOVWF      R0
	MOVF       FARG_output_y+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,301 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,303 :: 		UART_write((z>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_output_z+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__output71
	MOVLW      0
	SUBWF      FARG_output_z+0, 0
L__output71:
	BTFSS      STATUS+0, 0
	GOTO       L_output20
	MOVLW      43
	MOVWF      R0
	GOTO       L_output21
L_output20:
	MOVLW      45
	MOVWF      R0
L_output21:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,304 :: 		z=abs(z);
	MOVF       FARG_output_z+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_output_z+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_output_z+0
	MOVF       R1, 0
	MOVWF      FARG_output_z+1
;accelerometer_test.c,305 :: 		UART_write(dec2ascii((z%1000-z%100)/100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_z+0, 0
	MOVWF      R0
	MOVF       FARG_output_z+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,306 :: 		UART_write(dec2ascii((z%100-z%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_z+0, 0
	MOVWF      R0
	MOVF       FARG_output_z+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_z+0, 0
	MOVWF      R0
	MOVF       FARG_output_z+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__output+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,307 :: 		UART_write(dec2ascii(z%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_output_z+0, 0
	MOVWF      R0
	MOVF       FARG_output_z+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,308 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;accelerometer_test.c,309 :: 		}
L_end_output:
	RETURN
; end of _output

_dec2ascii:

;accelerometer_test.c,311 :: 		char dec2ascii(char dec)
;accelerometer_test.c,313 :: 		switch(dec){
	GOTO       L_dec2ascii22
;accelerometer_test.c,314 :: 		case 0: return '0';
L_dec2ascii24:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,315 :: 		case 1: return '1';
L_dec2ascii25:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,316 :: 		case 2: return '2';
L_dec2ascii26:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,317 :: 		case 3: return '3';
L_dec2ascii27:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,318 :: 		case 4: return '4';
L_dec2ascii28:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,319 :: 		case 5: return '5';
L_dec2ascii29:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,320 :: 		case 6: return '6';
L_dec2ascii30:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,321 :: 		case 7: return '7';
L_dec2ascii31:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,322 :: 		case 8: return '8';
L_dec2ascii32:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,323 :: 		case 9: return '9';
L_dec2ascii33:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,324 :: 		default: return '*';
L_dec2ascii34:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;accelerometer_test.c,325 :: 		}
L_dec2ascii22:
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii24
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii25
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii26
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii27
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii28
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii29
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii30
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii31
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii32
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii33
	GOTO       L_dec2ascii34
;accelerometer_test.c,326 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii

_angle_3:

;accelerometer_test.c,328 :: 		int angle_3(int a, int b, int c)
;accelerometer_test.c,333 :: 		a=(a>=0) ? a : -a;
	MOVLW      128
	XORWF      FARG_angle_3_a+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_374
	MOVLW      0
	SUBWF      FARG_angle_3_a+0, 0
L__angle_374:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_335
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R2
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R3
	GOTO       L_angle_336
L_angle_335:
	MOVF       FARG_angle_3_a+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       FARG_angle_3_a+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
L_angle_336:
	MOVF       R2, 0
	MOVWF      FARG_angle_3_a+0
	MOVF       R3, 0
	MOVWF      FARG_angle_3_a+1
;accelerometer_test.c,334 :: 		b=(b>=0) ? b : -b;
	MOVLW      128
	XORWF      FARG_angle_3_b+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_375
	MOVLW      0
	SUBWF      FARG_angle_3_b+0, 0
L__angle_375:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_337
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R2
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R3
	GOTO       L_angle_338
L_angle_337:
	MOVF       FARG_angle_3_b+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       FARG_angle_3_b+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
L_angle_338:
	MOVF       R2, 0
	MOVWF      FARG_angle_3_b+0
	MOVF       R3, 0
	MOVWF      FARG_angle_3_b+1
;accelerometer_test.c,335 :: 		c=(c>=0) ? c : -c;
	MOVLW      128
	XORWF      FARG_angle_3_c+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_376
	MOVLW      0
	SUBWF      FARG_angle_3_c+0, 0
L__angle_376:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_339
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R2
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R3
	GOTO       L_angle_340
L_angle_339:
	MOVF       FARG_angle_3_c+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       FARG_angle_3_c+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
L_angle_340:
	MOVF       R2, 0
	MOVWF      FARG_angle_3_c+0
	MOVF       R3, 0
	MOVWF      FARG_angle_3_c+1
;accelerometer_test.c,337 :: 		tmp=(double)a/sqrt((double)(b*b+c*c));
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVF       R0, 0
	MOVWF      FLOC__angle_3+2
	MOVF       R1, 0
	MOVWF      FLOC__angle_3+3
	MOVF       R2, 0
	MOVWF      FLOC__angle_3+4
	MOVF       R3, 0
	MOVWF      FLOC__angle_3+5
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	MOVWF      FLOC__angle_3+0
	MOVF       R1, 0
	MOVWF      FLOC__angle_3+1
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__angle_3+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__angle_3+1, 0
	ADDWFC     R1, 1
	CALL       _Int2Double+0
	MOVF       R0, 0
	MOVWF      FARG_sqrt_x+0
	MOVF       R1, 0
	MOVWF      FARG_sqrt_x+1
	MOVF       R2, 0
	MOVWF      FARG_sqrt_x+2
	MOVF       R3, 0
	MOVWF      FARG_sqrt_x+3
	CALL       _sqrt+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__angle_3+2, 0
	MOVWF      R0
	MOVF       FLOC__angle_3+3, 0
	MOVWF      R1
	MOVF       FLOC__angle_3+4, 0
	MOVWF      R2
	MOVF       FLOC__angle_3+5, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      angle_3_tmp_L0+0
	MOVF       R1, 0
	MOVWF      angle_3_tmp_L0+1
	MOVF       R2, 0
	MOVWF      angle_3_tmp_L0+2
	MOVF       R3, 0
	MOVWF      angle_3_tmp_L0+3
;accelerometer_test.c,339 :: 		for(i=0; i<=200; i++){
	CLRF       angle_3_i_L0+0
	CLRF       angle_3_i_L0+1
L_angle_341:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_3_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_377
	MOVF       angle_3_i_L0+0, 0
	SUBLW      200
L__angle_377:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_342
;accelerometer_test.c,340 :: 		if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       angle_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_3_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      111
	MOVWF      R4
	MOVLW      18
	MOVWF      R5
	MOVLW      131
	MOVWF      R6
	MOVLW      118
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_346
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       angle_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_3_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      111
	MOVWF      R0
	MOVLW      18
	MOVWF      R1
	MOVLW      3
	MOVWF      R2
	MOVLW      118
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_346
L__angle_357:
;accelerometer_test.c,341 :: 		return i;
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	GOTO       L_end_angle_3
L_angle_346:
;accelerometer_test.c,339 :: 		for(i=0; i<=200; i++){
	INCF       angle_3_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_3_i_L0+1, 1
;accelerometer_test.c,342 :: 		}
	GOTO       L_angle_341
L_angle_342:
;accelerometer_test.c,344 :: 		return -999;
	MOVLW      25
	MOVWF      R0
	MOVLW      252
	MOVWF      R1
;accelerometer_test.c,345 :: 		}
L_end_angle_3:
	RETURN
; end of _angle_3

_angle_2:

;accelerometer_test.c,347 :: 		int angle_2(int a, int b)
;accelerometer_test.c,352 :: 		a=(a>=0) ? a : -a;
	MOVLW      128
	XORWF      FARG_angle_2_a+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_279
	MOVLW      0
	SUBWF      FARG_angle_2_a+0, 0
L__angle_279:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_247
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R2
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R3
	GOTO       L_angle_248
L_angle_247:
	MOVF       FARG_angle_2_a+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       FARG_angle_2_a+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      R2
	MOVF       R1, 0
	MOVWF      R3
L_angle_248:
	MOVF       R2, 0
	MOVWF      FARG_angle_2_a+0
	MOVF       R3, 0
	MOVWF      FARG_angle_2_a+1
;accelerometer_test.c,353 :: 		b=(b>=0) ? b : -b;
	MOVLW      128
	XORWF      FARG_angle_2_b+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_280
	MOVLW      0
	SUBWF      FARG_angle_2_b+0, 0
L__angle_280:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_249
	MOVF       FARG_angle_2_b+0, 0
	MOVWF      FLOC__angle_2+4
	MOVF       FARG_angle_2_b+1, 0
	MOVWF      FLOC__angle_2+5
	GOTO       L_angle_250
L_angle_249:
	MOVF       FARG_angle_2_b+0, 0
	SUBLW      0
	MOVWF      R0
	MOVF       FARG_angle_2_b+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__angle_2+4
	MOVF       R1, 0
	MOVWF      FLOC__angle_2+5
L_angle_250:
	MOVF       FLOC__angle_2+4, 0
	MOVWF      FARG_angle_2_b+0
	MOVF       FLOC__angle_2+5, 0
	MOVWF      FARG_angle_2_b+1
;accelerometer_test.c,355 :: 		tmp=(double)a/b;
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVF       R0, 0
	MOVWF      FLOC__angle_2+0
	MOVF       R1, 0
	MOVWF      FLOC__angle_2+1
	MOVF       R2, 0
	MOVWF      FLOC__angle_2+2
	MOVF       R3, 0
	MOVWF      FLOC__angle_2+3
	MOVF       FLOC__angle_2+4, 0
	MOVWF      R0
	MOVF       FLOC__angle_2+5, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__angle_2+0, 0
	MOVWF      R0
	MOVF       FLOC__angle_2+1, 0
	MOVWF      R1
	MOVF       FLOC__angle_2+2, 0
	MOVWF      R2
	MOVF       FLOC__angle_2+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      angle_2_tmp_L0+0
	MOVF       R1, 0
	MOVWF      angle_2_tmp_L0+1
	MOVF       R2, 0
	MOVWF      angle_2_tmp_L0+2
	MOVF       R3, 0
	MOVWF      angle_2_tmp_L0+3
;accelerometer_test.c,357 :: 		for(i=0; i<=200; i++){
	CLRF       angle_2_i_L0+0
	CLRF       angle_2_i_L0+1
L_angle_251:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_2_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_281
	MOVF       angle_2_i_L0+0, 0
	SUBLW      200
L__angle_281:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_252
;accelerometer_test.c,358 :: 		if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       angle_2_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_2_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_2_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_2_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      111
	MOVWF      R4
	MOVLW      18
	MOVWF      R5
	MOVLW      131
	MOVWF      R6
	MOVLW      118
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_256
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R3
	MOVF       angle_2_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_2_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_2_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_2_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVLW      111
	MOVWF      R0
	MOVLW      18
	MOVWF      R1
	MOVLW      3
	MOVWF      R2
	MOVLW      118
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_256
L__angle_258:
;accelerometer_test.c,359 :: 		return i;
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
	MOVWF      R1
	GOTO       L_end_angle_2
L_angle_256:
;accelerometer_test.c,357 :: 		for(i=0; i<=200; i++){
	INCF       angle_2_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_2_i_L0+1, 1
;accelerometer_test.c,360 :: 		}
	GOTO       L_angle_251
L_angle_252:
;accelerometer_test.c,362 :: 		return -999;
	MOVLW      25
	MOVWF      R0
	MOVLW      252
	MOVWF      R1
;accelerometer_test.c,363 :: 		}
L_end_angle_2:
	RETURN
; end of _angle_2
