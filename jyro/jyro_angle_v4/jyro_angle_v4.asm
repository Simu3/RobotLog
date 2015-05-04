
_main:

;jyro_angle_v4.c,12 :: 		void main()
;jyro_angle_v4.c,17 :: 		bias=o_data=n_data=angle=tmp=0.0;
	CLRF       main_angle_L0+0
	CLRF       main_angle_L0+1
	CLRF       main_angle_L0+2
	CLRF       main_angle_L0+3
	CLRF       main_n_data_L0+0
	CLRF       main_n_data_L0+1
	CLRF       main_n_data_L0+2
	CLRF       main_n_data_L0+3
	CLRF       main_o_data_L0+0
	CLRF       main_o_data_L0+1
	CLRF       main_o_data_L0+2
	CLRF       main_o_data_L0+3
	CLRF       main_bias_L0+0
	CLRF       main_bias_L0+1
	CLRF       main_bias_L0+2
	CLRF       main_bias_L0+3
;jyro_angle_v4.c,19 :: 		setup();
	CALL       _setup+0
;jyro_angle_v4.c,21 :: 		bias=read_bias();
	CALL       _read_bias+0
	MOVF       R0, 0
	MOVWF      main_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_bias_L0+3
;jyro_angle_v4.c,23 :: 		while(1){
L_main0:
;jyro_angle_v4.c,24 :: 		TMR0=0;
	CLRF       TMR0+0
;jyro_angle_v4.c,26 :: 		o_data=n_data;
	MOVF       main_n_data_L0+0, 0
	MOVWF      main_o_data_L0+0
	MOVF       main_n_data_L0+1, 0
	MOVWF      main_o_data_L0+1
	MOVF       main_n_data_L0+2, 0
	MOVWF      main_o_data_L0+2
	MOVF       main_n_data_L0+3, 0
	MOVWF      main_o_data_L0+3
;jyro_angle_v4.c,27 :: 		n_data=0.0;
	CLRF       main_n_data_L0+0
	CLRF       main_n_data_L0+1
	CLRF       main_n_data_L0+2
	CLRF       main_n_data_L0+3
;jyro_angle_v4.c,29 :: 		for(i=0; i<25; i++){
	CLRF       main_i_L0+0
L_main2:
	MOVLW      25
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;jyro_angle_v4.c,30 :: 		n_data+=ADC_read(ANPIN);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_n_data_L0+0, 0
	MOVWF      R4
	MOVF       main_n_data_L0+1, 0
	MOVWF      R5
	MOVF       main_n_data_L0+2, 0
	MOVWF      R6
	MOVF       main_n_data_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_n_data_L0+0
	MOVF       R1, 0
	MOVWF      main_n_data_L0+1
	MOVF       R2, 0
	MOVWF      main_n_data_L0+2
	MOVF       R3, 0
	MOVWF      main_n_data_L0+3
;jyro_angle_v4.c,31 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	NOP
	NOP
;jyro_angle_v4.c,29 :: 		for(i=0; i<25; i++){
	INCF       main_i_L0+0, 1
;jyro_angle_v4.c,32 :: 		}
	GOTO       L_main2
L_main3:
;jyro_angle_v4.c,34 :: 		n_data/=25.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       main_n_data_L0+0, 0
	MOVWF      R0
	MOVF       main_n_data_L0+1, 0
	MOVWF      R1
	MOVF       main_n_data_L0+2, 0
	MOVWF      R2
	MOVF       main_n_data_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_n_data_L0+0
	MOVF       R1, 0
	MOVWF      main_n_data_L0+1
	MOVF       R2, 0
	MOVWF      main_n_data_L0+2
	MOVF       R3, 0
	MOVWF      main_n_data_L0+3
;jyro_angle_v4.c,36 :: 		n_data-=bias;
	MOVF       main_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_n_data_L0+0
	MOVF       R1, 0
	MOVWF      main_n_data_L0+1
	MOVF       R2, 0
	MOVWF      main_n_data_L0+2
	MOVF       R3, 0
	MOVWF      main_n_data_L0+3
;jyro_angle_v4.c,38 :: 		if(-0.5<=n_data && n_data<=0.5){
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       main_n_data_L0+0, 0
	MOVWF      R4
	MOVF       main_n_data_L0+1, 0
	MOVWF      R5
	MOVF       main_n_data_L0+2, 0
	MOVWF      R6
	MOVF       main_n_data_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      0
	MOVWF      R2
	MOVLW      126
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
L__main37:
;jyro_angle_v4.c,39 :: 		o_data=0.0;
	CLRF       main_o_data_L0+0
	CLRF       main_o_data_L0+1
	CLRF       main_o_data_L0+2
	CLRF       main_o_data_L0+3
;jyro_angle_v4.c,40 :: 		n_data=0.0;
	CLRF       main_n_data_L0+0
	CLRF       main_n_data_L0+1
	CLRF       main_n_data_L0+2
	CLRF       main_n_data_L0+3
;jyro_angle_v4.c,41 :: 		if(-5.0<=angle && angle<=5.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      160
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	MOVF       main_angle_L0+0, 0
	MOVWF      R0
	MOVF       main_angle_L0+1, 0
	MOVWF      R1
	MOVF       main_angle_L0+2, 0
	MOVWF      R2
	MOVF       main_angle_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_angle_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      32
	MOVWF      R2
	MOVLW      129
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L__main36:
;jyro_angle_v4.c,42 :: 		angle=0.0;
	CLRF       main_angle_L0+0
	CLRF       main_angle_L0+1
	CLRF       main_angle_L0+2
	CLRF       main_angle_L0+3
L_main11:
;jyro_angle_v4.c,43 :: 		}
L_main8:
;jyro_angle_v4.c,45 :: 		n_data*=TMP;
	MOVF       main_n_data_L0+0, 0
	MOVWF      R0
	MOVF       main_n_data_L0+1, 0
	MOVWF      R1
	MOVF       main_n_data_L0+2, 0
	MOVWF      R2
	MOVF       main_n_data_L0+3, 0
	MOVWF      R3
	MOVLW      216
	MOVWF      R4
	MOVLW      111
	MOVWF      R5
	MOVLW      105
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_n_data_L0+0
	MOVF       R1, 0
	MOVWF      main_n_data_L0+1
	MOVF       R2, 0
	MOVWF      main_n_data_L0+2
	MOVF       R3, 0
	MOVWF      main_n_data_L0+3
;jyro_angle_v4.c,47 :: 		angle+=integral(o_data, n_data);
	MOVF       main_o_data_L0+0, 0
	MOVWF      FARG_integral+0
	MOVF       main_o_data_L0+1, 0
	MOVWF      FARG_integral+1
	MOVF       main_o_data_L0+2, 0
	MOVWF      FARG_integral+2
	MOVF       main_o_data_L0+3, 0
	MOVWF      FARG_integral+3
	MOVF       R0, 0
	MOVWF      FARG_integral+0
	MOVF       R1, 0
	MOVWF      FARG_integral+1
	MOVF       R2, 0
	MOVWF      FARG_integral+2
	MOVF       R3, 0
	MOVWF      FARG_integral+3
	CALL       _integral+0
	MOVF       main_angle_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_angle_L0+0
	MOVF       R1, 0
	MOVWF      main_angle_L0+1
	MOVF       R2, 0
	MOVWF      main_angle_L0+2
	MOVF       R3, 0
	MOVWF      main_angle_L0+3
;jyro_angle_v4.c,49 :: 		if(angle>=90)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      52
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;jyro_angle_v4.c,50 :: 		angle=90;
	MOVLW      0
	MOVWF      main_angle_L0+0
	MOVLW      0
	MOVWF      main_angle_L0+1
	MOVLW      52
	MOVWF      main_angle_L0+2
	MOVLW      133
	MOVWF      main_angle_L0+3
	GOTO       L_main13
L_main12:
;jyro_angle_v4.c,51 :: 		else if(angle<=-90)
	MOVF       main_angle_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      180
	MOVWF      R2
	MOVLW      133
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;jyro_angle_v4.c,52 :: 		angle=-90;
	MOVLW      0
	MOVWF      main_angle_L0+0
	MOVLW      0
	MOVWF      main_angle_L0+1
	MOVLW      180
	MOVWF      main_angle_L0+2
	MOVLW      133
	MOVWF      main_angle_L0+3
L_main14:
L_main13:
;jyro_angle_v4.c,54 :: 		output(angle);
	MOVF       main_angle_L0+0, 0
	MOVWF      FARG_output+0
	MOVF       main_angle_L0+1, 0
	MOVWF      FARG_output+1
	MOVF       main_angle_L0+2, 0
	MOVWF      FARG_output+2
	MOVF       main_angle_L0+3, 0
	MOVWF      FARG_output+3
	CALL       _output+0
;jyro_angle_v4.c,55 :: 		}
	GOTO       L_main0
;jyro_angle_v4.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;jyro_angle_v4.c,58 :: 		void setup()
;jyro_angle_v4.c,60 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;jyro_angle_v4.c,62 :: 		OPTION_REG=0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;jyro_angle_v4.c,64 :: 		ANSELA=0x02;
	MOVLW      2
	MOVWF      ANSELA+0
;jyro_angle_v4.c,66 :: 		TRISA=0x02;
	MOVLW      2
	MOVWF      TRISA+0
;jyro_angle_v4.c,68 :: 		PORTA=0x00;
	CLRF       PORTA+0
;jyro_angle_v4.c,70 :: 		ADC_Init();
	CALL       _ADC_Init+0
;jyro_angle_v4.c,72 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;jyro_angle_v4.c,74 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_setup15:
	DECFSZ     R13, 1
	GOTO       L_setup15
	DECFSZ     R12, 1
	GOTO       L_setup15
	DECFSZ     R11, 1
	GOTO       L_setup15
	NOP
;jyro_angle_v4.c,75 :: 		}
L_end_setup:
	RETURN
; end of _setup

_read_bias:

;jyro_angle_v4.c,77 :: 		double read_bias()
;jyro_angle_v4.c,80 :: 		double bias=0.0;
	CLRF       read_bias_bias_L0+0
	CLRF       read_bias_bias_L0+1
	CLRF       read_bias_bias_L0+2
	CLRF       read_bias_bias_L0+3
;jyro_angle_v4.c,82 :: 		for(i=0; i<25; i++){
	CLRF       read_bias_i_L0+0
L_read_bias16:
	MOVLW      25
	SUBWF      read_bias_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_bias17
;jyro_angle_v4.c,83 :: 		bias+=ADC_read(ANPIN);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       read_bias_bias_L0+0, 0
	MOVWF      R4
	MOVF       read_bias_bias_L0+1, 0
	MOVWF      R5
	MOVF       read_bias_bias_L0+2, 0
	MOVWF      R6
	MOVF       read_bias_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      read_bias_bias_L0+0
	MOVF       R1, 0
	MOVWF      read_bias_bias_L0+1
	MOVF       R2, 0
	MOVWF      read_bias_bias_L0+2
	MOVF       R3, 0
	MOVWF      read_bias_bias_L0+3
;jyro_angle_v4.c,84 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_read_bias19:
	DECFSZ     R13, 1
	GOTO       L_read_bias19
	DECFSZ     R12, 1
	GOTO       L_read_bias19
	NOP
	NOP
;jyro_angle_v4.c,82 :: 		for(i=0; i<25; i++){
	INCF       read_bias_i_L0+0, 1
;jyro_angle_v4.c,85 :: 		}
	GOTO       L_read_bias16
L_read_bias17:
;jyro_angle_v4.c,87 :: 		return bias/25.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       read_bias_bias_L0+0, 0
	MOVWF      R0
	MOVF       read_bias_bias_L0+1, 0
	MOVWF      R1
	MOVF       read_bias_bias_L0+2, 0
	MOVWF      R2
	MOVF       read_bias_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
;jyro_angle_v4.c,88 :: 		}
L_end_read_bias:
	RETURN
; end of _read_bias

_integral:

;jyro_angle_v4.c,90 :: 		double integral(double a, double b)
;jyro_angle_v4.c,94 :: 		return (a+b)*(0.000128*TMR0)/2.0;
	MOVF       FARG_integral_a+0, 0
	MOVWF      R0
	MOVF       FARG_integral_a+1, 0
	MOVWF      R1
	MOVF       FARG_integral_a+2, 0
	MOVWF      R2
	MOVF       FARG_integral_a+3, 0
	MOVWF      R3
	MOVF       FARG_integral_b+0, 0
	MOVWF      R4
	MOVF       FARG_integral_b+1, 0
	MOVWF      R5
	MOVF       FARG_integral_b+2, 0
	MOVWF      R6
	MOVF       FARG_integral_b+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__integral+0
	MOVF       R1, 0
	MOVWF      FLOC__integral+1
	MOVF       R2, 0
	MOVWF      FLOC__integral+2
	MOVF       R3, 0
	MOVWF      FLOC__integral+3
	MOVF       TMR0+0, 0
	MOVWF      R0
	CALL       _Byte2Double+0
	MOVLW      189
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      6
	MOVWF      R6
	MOVLW      114
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__integral+0, 0
	MOVWF      R4
	MOVF       FLOC__integral+1, 0
	MOVWF      R5
	MOVF       FLOC__integral+2, 0
	MOVWF      R6
	MOVF       FLOC__integral+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	CALL       _Div_32x32_FP+0
;jyro_angle_v4.c,95 :: 		}
L_end_integral:
	RETURN
; end of _integral

_output:

;jyro_angle_v4.c,97 :: 		void output(double x)
;jyro_angle_v4.c,101 :: 		UART_write((x>=0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	MOVF       FARG_output_x+2, 0
	MOVWF      R2
	MOVF       FARG_output_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
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
;jyro_angle_v4.c,103 :: 		if(x<0)
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	MOVF       FARG_output_x+2, 0
	MOVWF      R2
	MOVF       FARG_output_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_output22
;jyro_angle_v4.c,104 :: 		x=-x;
	MOVLW      0
	XORWF      FARG_output_x+0, 1
	MOVLW      0
	XORWF      FARG_output_x+1, 1
	MOVLW      128
	XORWF      FARG_output_x+2, 1
	MOVLW      0
	XORWF      FARG_output_x+3, 1
L_output22:
;jyro_angle_v4.c,106 :: 		m=(int)(x*10.0);
	MOVF       FARG_output_x+0, 0
	MOVWF      R0
	MOVF       FARG_output_x+1, 0
	MOVWF      R1
	MOVF       FARG_output_x+2, 0
	MOVWF      R2
	MOVF       FARG_output_x+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      output_m_L0+0
	MOVF       R1, 0
	MOVWF      output_m_L0+1
;jyro_angle_v4.c,109 :: 		UART_write(dec2ascii((m%1000-m%100)/100));
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
	MOVF       output_m_L0+0, 0
	MOVWF      R0
	MOVF       output_m_L0+1, 0
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
;jyro_angle_v4.c,110 :: 		UART_write(dec2ascii((m%100-m%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_m_L0+0, 0
	MOVWF      R0
	MOVF       output_m_L0+1, 0
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
	MOVF       output_m_L0+0, 0
	MOVWF      R0
	MOVF       output_m_L0+1, 0
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
;jyro_angle_v4.c,111 :: 		UART_write(dec2ascii(m%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_m_L0+0, 0
	MOVWF      R0
	MOVF       output_m_L0+1, 0
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
;jyro_angle_v4.c,112 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;jyro_angle_v4.c,113 :: 		}
L_end_output:
	RETURN
; end of _output

_dec2ascii:

;jyro_angle_v4.c,115 :: 		char dec2ascii(char dec)
;jyro_angle_v4.c,117 :: 		switch(dec){
	GOTO       L_dec2ascii23
;jyro_angle_v4.c,118 :: 		case 0: return '0';
L_dec2ascii25:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,119 :: 		case 1: return '1';
L_dec2ascii26:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,120 :: 		case 2: return '2';
L_dec2ascii27:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,121 :: 		case 3: return '3';
L_dec2ascii28:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,122 :: 		case 4: return '4';
L_dec2ascii29:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,123 :: 		case 5: return '5';
L_dec2ascii30:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,124 :: 		case 6: return '6';
L_dec2ascii31:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,125 :: 		case 7: return '7';
L_dec2ascii32:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,126 :: 		case 8: return '8';
L_dec2ascii33:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,127 :: 		case 9: return '9';
L_dec2ascii34:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,128 :: 		default: return '*';
L_dec2ascii35:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v4.c,129 :: 		}
L_dec2ascii23:
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii25
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii26
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii27
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii28
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii29
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii30
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii31
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii32
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii33
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii34
	GOTO       L_dec2ascii35
;jyro_angle_v4.c,130 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii
