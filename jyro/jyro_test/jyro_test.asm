
_main:

;jyro_test.c,7 :: 		void main() {
;jyro_test.c,8 :: 		set_up();
	CALL       _set_up+0
;jyro_test.c,10 :: 		while(1){
L_main0:
;jyro_test.c,11 :: 		print(read(1), read(2));
	MOVLW      2
	MOVWF      FARG_read+0
	CALL       _read+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVLW      1
	MOVWF      FARG_read+0
	CALL       _read+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	MOVF       R1, 0
	MOVWF      FARG_print+1
	MOVF       FLOC__main+0, 0
	MOVWF      FARG_print+0
	MOVF       FLOC__main+1, 0
	MOVWF      FARG_print+1
	CALL       _print+0
;jyro_test.c,12 :: 		}
	GOTO       L_main0
;jyro_test.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_set_up:

;jyro_test.c,17 :: 		void set_up()
;jyro_test.c,19 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;jyro_test.c,20 :: 		ANSELA=0b00000110;
	MOVLW      6
	MOVWF      ANSELA+0
;jyro_test.c,21 :: 		TRISA=0b00000110;
	MOVLW      6
	MOVWF      TRISA+0
;jyro_test.c,23 :: 		PORTA=0x00;
	CLRF       PORTA+0
;jyro_test.c,25 :: 		ADC_Init();       //AD変換ライブラリ初期化
	CALL       _ADC_Init+0
;jyro_test.c,27 :: 		UART1_Init(9600); //シリアル通信ライブラリ初期化(baudrate:9600)
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;jyro_test.c,28 :: 		}
L_end_set_up:
	RETURN
; end of _set_up

_read:

;jyro_test.c,31 :: 		int read(unsigned short num){
;jyro_test.c,32 :: 		int j_data=0;
;jyro_test.c,34 :: 		j_data=ADC_Read(num);
	MOVF       FARG_read_num+0, 0
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;jyro_test.c,36 :: 		return j_data;
;jyro_test.c,37 :: 		}
L_end_read:
	RETURN
; end of _read

_print:

;jyro_test.c,41 :: 		void print(int x_data,int y_data)
;jyro_test.c,43 :: 		UART1_Write('X');  //シリアル出力(TXPin)
	MOVLW      88
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,45 :: 		printa(x_data);
	MOVF       FARG_print_x_data+0, 0
	MOVWF      FARG_printa+0
	MOVF       FARG_print_x_data+1, 0
	MOVWF      FARG_printa+1
	CALL       _printa+0
;jyro_test.c,46 :: 		UART1_Write('Y');
	MOVLW      89
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,48 :: 		printa(y_data);
	MOVF       FARG_print_y_data+0, 0
	MOVWF      FARG_printa+0
	MOVF       FARG_print_y_data+1, 0
	MOVWF      FARG_printa+1
	CALL       _printa+0
;jyro_test.c,50 :: 		UART1_Write('\n');   //改行
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,51 :: 		}
L_end_print:
	RETURN
; end of _print

_printa:

;jyro_test.c,53 :: 		void printa(int j_data)
;jyro_test.c,55 :: 		UART1_Write(':');
	MOVLW      58
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,56 :: 		UART1_Write(dec2ascii((j_data-j_data%1000)/1000));           //千の位
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FARG_printa_j_data+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,57 :: 		UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));        //百の位
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__printa+0
	MOVF       R1, 0
	MOVWF      FLOC__printa+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__printa+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__printa+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,58 :: 		UART1_Write(dec2ascii((j_data%100-j_data%10)/10));           //十の位
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__printa+0
	MOVF       R1, 0
	MOVWF      FLOC__printa+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__printa+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__printa+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,59 :: 		UART1_Write(dec2ascii(j_data%10));                          //一の位
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,60 :: 		UART1_Write(' ');
	MOVLW      32
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_test.c,61 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_printa2:
	DECFSZ     R13, 1
	GOTO       L_printa2
	DECFSZ     R12, 1
	GOTO       L_printa2
	NOP
	NOP
;jyro_test.c,62 :: 		}
L_end_printa:
	RETURN
; end of _printa

_dec2ascii:

;jyro_test.c,64 :: 		short dec2ascii(int dec)
;jyro_test.c,66 :: 		switch(dec){
	GOTO       L_dec2ascii3
;jyro_test.c,67 :: 		case 0: return 48;
L_dec2ascii5:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,68 :: 		case 1: return 49;
L_dec2ascii6:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,69 :: 		case 2: return 50;
L_dec2ascii7:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,70 :: 		case 3: return 51;
L_dec2ascii8:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,71 :: 		case 4: return 52;
L_dec2ascii9:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,72 :: 		case 5: return 53;
L_dec2ascii10:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,73 :: 		case 6: return 54;
L_dec2ascii11:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,74 :: 		case 7: return 55;
L_dec2ascii12:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,75 :: 		case 8: return 56;
L_dec2ascii13:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,76 :: 		case 9: return 57;
L_dec2ascii14:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_test.c,77 :: 		}
L_dec2ascii3:
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii22
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii22:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii5
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii23
	MOVLW      1
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii23:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii6
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii24
	MOVLW      2
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii24:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii7
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii25
	MOVLW      3
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii25:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii8
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii26
	MOVLW      4
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii26:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii9
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii27
	MOVLW      5
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii27:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii10
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii28
	MOVLW      6
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii28:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii11
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii29
	MOVLW      7
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii29:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii12
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii30
	MOVLW      8
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii30:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii13
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii31
	MOVLW      9
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii31:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii14
;jyro_test.c,78 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_dec2ascii15:
	DECFSZ     R13, 1
	GOTO       L_dec2ascii15
	DECFSZ     R12, 1
	GOTO       L_dec2ascii15
	NOP
	NOP
;jyro_test.c,79 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii
