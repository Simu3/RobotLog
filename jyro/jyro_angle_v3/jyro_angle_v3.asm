
_main:

;jyro_angle_v3.c,15 :: 		void main()
;jyro_angle_v3.c,19 :: 		bias=o_avel=n_avel=angle=tmp=0.0;
	CLRF       main_tmp_L0+0
	CLRF       main_tmp_L0+1
	CLRF       main_tmp_L0+2
	CLRF       main_tmp_L0+3
	CLRF       main_angle_L0+0
	CLRF       main_angle_L0+1
	CLRF       main_angle_L0+2
	CLRF       main_angle_L0+3
	CLRF       main_n_avel_L0+0
	CLRF       main_n_avel_L0+1
	CLRF       main_n_avel_L0+2
	CLRF       main_n_avel_L0+3
	CLRF       main_o_avel_L0+0
	CLRF       main_o_avel_L0+1
	CLRF       main_o_avel_L0+2
	CLRF       main_o_avel_L0+3
	CLRF       main_bias_L0+0
	CLRF       main_bias_L0+1
	CLRF       main_bias_L0+2
	CLRF       main_bias_L0+3
;jyro_angle_v3.c,21 :: 		setup();
	CALL       _setup+0
;jyro_angle_v3.c,23 :: 		bias=read_bias();
	CALL       _read_bias+0
	MOVF       R0, 0
	MOVWF      main_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_bias_L0+3
;jyro_angle_v3.c,25 :: 		while(1){
L_main0:
;jyro_angle_v3.c,26 :: 		tmp=0.0;
	CLRF       main_tmp_L0+0
	CLRF       main_tmp_L0+1
	CLRF       main_tmp_L0+2
	CLRF       main_tmp_L0+3
;jyro_angle_v3.c,27 :: 		o_avel=n_avel;
	MOVF       main_n_avel_L0+0, 0
	MOVWF      main_o_avel_L0+0
	MOVF       main_n_avel_L0+1, 0
	MOVWF      main_o_avel_L0+1
	MOVF       main_n_avel_L0+2, 0
	MOVWF      main_o_avel_L0+2
	MOVF       main_n_avel_L0+3, 0
	MOVWF      main_o_avel_L0+3
;jyro_angle_v3.c,28 :: 		for(i=0; i<10; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;jyro_angle_v3.c,29 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	NOP
;jyro_angle_v3.c,30 :: 		tmp+=ADC_read(AN_X)*D2V;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      9
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       main_tmp_L0+0, 0
	MOVWF      R4
	MOVF       main_tmp_L0+1, 0
	MOVWF      R5
	MOVF       main_tmp_L0+2, 0
	MOVWF      R6
	MOVF       main_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_tmp_L0+0
	MOVF       R1, 0
	MOVWF      main_tmp_L0+1
	MOVF       R2, 0
	MOVWF      main_tmp_L0+2
	MOVF       R3, 0
	MOVWF      main_tmp_L0+3
;jyro_angle_v3.c,28 :: 		for(i=0; i<10; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;jyro_angle_v3.c,31 :: 		}
	GOTO       L_main2
L_main3:
;jyro_angle_v3.c,32 :: 		n_avel=((tmp/10.0)-bias)*SEN;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_tmp_L0+0, 0
	MOVWF      R0
	MOVF       main_tmp_L0+1, 0
	MOVWF      R1
	MOVF       main_tmp_L0+2, 0
	MOVWF      R2
	MOVF       main_tmp_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       main_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      50
	MOVWF      R4
	MOVLW      145
	MOVWF      R5
	MOVLW      58
	MOVWF      R6
	MOVLW      137
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_n_avel_L0+0
	MOVF       R1, 0
	MOVWF      main_n_avel_L0+1
	MOVF       R2, 0
	MOVWF      main_n_avel_L0+2
	MOVF       R3, 0
	MOVWF      main_n_avel_L0+3
;jyro_angle_v3.c,33 :: 		angle+=integral(o_avel, n_avel, 0.2808);
	MOVF       main_o_avel_L0+0, 0
	MOVWF      FARG_integral+0
	MOVF       main_o_avel_L0+1, 0
	MOVWF      FARG_integral+1
	MOVF       main_o_avel_L0+2, 0
	MOVWF      FARG_integral+2
	MOVF       main_o_avel_L0+3, 0
	MOVWF      FARG_integral+3
	MOVF       R0, 0
	MOVWF      FARG_integral+0
	MOVF       R1, 0
	MOVWF      FARG_integral+1
	MOVF       R2, 0
	MOVWF      FARG_integral+2
	MOVF       R3, 0
	MOVWF      FARG_integral+3
	MOVLW      5
	MOVWF      FARG_integral+0
	MOVLW      197
	MOVWF      FARG_integral+1
	MOVLW      15
	MOVWF      FARG_integral+2
	MOVLW      125
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
;jyro_angle_v3.c,34 :: 		output(angle);
	MOVF       R0, 0
	MOVWF      FARG_output+0
	MOVF       R1, 0
	MOVWF      FARG_output+1
	MOVF       R2, 0
	MOVWF      FARG_output+2
	MOVF       R3, 0
	MOVWF      FARG_output+3
	CALL       _output+0
;jyro_angle_v3.c,35 :: 		}
	GOTO       L_main0
;jyro_angle_v3.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;jyro_angle_v3.c,38 :: 		void setup()
;jyro_angle_v3.c,40 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;jyro_angle_v3.c,42 :: 		ANSELA=0x03;
	MOVLW      3
	MOVWF      ANSELA+0
;jyro_angle_v3.c,43 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;jyro_angle_v3.c,44 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;jyro_angle_v3.c,45 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;jyro_angle_v3.c,46 :: 		TRISA=0x03;
	MOVLW      3
	MOVWF      TRISA+0
;jyro_angle_v3.c,47 :: 		TRISB=0x00;
	CLRF       TRISB+0
;jyro_angle_v3.c,48 :: 		TRISC=0x00;
	CLRF       TRISC+0
;jyro_angle_v3.c,49 :: 		TRISD=0x00;
	CLRF       TRISD+0
;jyro_angle_v3.c,50 :: 		TRISE=0x00;
	CLRF       TRISE+0
;jyro_angle_v3.c,52 :: 		PORTA=0x00;
	CLRF       PORTA+0
;jyro_angle_v3.c,53 :: 		PORTB=0x00;
	CLRF       PORTB+0
;jyro_angle_v3.c,54 :: 		PORTC=0x00;
	CLRF       PORTC+0
;jyro_angle_v3.c,55 :: 		PORTD=0x00;
	CLRF       PORTD+0
;jyro_angle_v3.c,56 :: 		PORTE=0x00;
	CLRF       PORTE+0
;jyro_angle_v3.c,58 :: 		ADC_Init();
	CALL       _ADC_Init+0
;jyro_angle_v3.c,60 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;jyro_angle_v3.c,62 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11
	MOVLW      187
	MOVWF      R12
	MOVLW      223
	MOVWF      R13
L_setup6:
	DECFSZ     R13, 1
	GOTO       L_setup6
	DECFSZ     R12, 1
	GOTO       L_setup6
	DECFSZ     R11, 1
	GOTO       L_setup6
	NOP
	NOP
;jyro_angle_v3.c,63 :: 		}
L_end_setup:
	RETURN
; end of _setup

_integral:

;jyro_angle_v3.c,65 :: 		double integral(double a, double b, double n)
;jyro_angle_v3.c,67 :: 		return (a+b)*n/2.0;
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
	MOVF       FARG_integral_n+0, 0
	MOVWF      R4
	MOVF       FARG_integral_n+1, 0
	MOVWF      R5
	MOVF       FARG_integral_n+2, 0
	MOVWF      R6
	MOVF       FARG_integral_n+3, 0
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
;jyro_angle_v3.c,68 :: 		}
L_end_integral:
	RETURN
; end of _integral

_round_off3:

;jyro_angle_v3.c,70 :: 		double round_off3(double number)
;jyro_angle_v3.c,72 :: 		return (double)((int)((number+0.005)*100.0))/100.0;
	MOVF       FARG_round_off3_number+0, 0
	MOVWF      R0
	MOVF       FARG_round_off3_number+1, 0
	MOVWF      R1
	MOVF       FARG_round_off3_number+2, 0
	MOVWF      R2
	MOVF       FARG_round_off3_number+3, 0
	MOVWF      R3
	MOVLW      10
	MOVWF      R4
	MOVLW      215
	MOVWF      R5
	MOVLW      35
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	CALL       _Int2Double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Div_32x32_FP+0
;jyro_angle_v3.c,73 :: 		}
L_end_round_off3:
	RETURN
; end of _round_off3

_read_bias:

;jyro_angle_v3.c,75 :: 		double read_bias()
;jyro_angle_v3.c,78 :: 		double bias=0.0;
	CLRF       read_bias_bias_L0+0
	CLRF       read_bias_bias_L0+1
	CLRF       read_bias_bias_L0+2
	CLRF       read_bias_bias_L0+3
;jyro_angle_v3.c,80 :: 		for(i=0; i<100; i++){
	CLRF       read_bias_i_L0+0
	CLRF       read_bias_i_L0+1
L_read_bias7:
	MOVLW      128
	XORWF      read_bias_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__read_bias33
	MOVLW      100
	SUBWF      read_bias_i_L0+0, 0
L__read_bias33:
	BTFSC      STATUS+0, 0
	GOTO       L_read_bias8
;jyro_angle_v3.c,81 :: 		bias+=ADC_read(AN_X)*D2V;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      9
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
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
;jyro_angle_v3.c,82 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_read_bias10:
	DECFSZ     R13, 1
	GOTO       L_read_bias10
	DECFSZ     R12, 1
	GOTO       L_read_bias10
	NOP
;jyro_angle_v3.c,80 :: 		for(i=0; i<100; i++){
	INCF       read_bias_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       read_bias_i_L0+1, 1
;jyro_angle_v3.c,83 :: 		}
	GOTO       L_read_bias7
L_read_bias8:
;jyro_angle_v3.c,87 :: 		return bias/100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
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
;jyro_angle_v3.c,88 :: 		}
L_end_read_bias:
	RETURN
; end of _read_bias

_output:

;jyro_angle_v3.c,90 :: 		void output(double x)
;jyro_angle_v3.c,92 :: 		double m=0.0;
	CLRF       output_m_L0+0
	CLRF       output_m_L0+1
	CLRF       output_m_L0+2
	CLRF       output_m_L0+3
	CLRF       output_n_L0+0
	CLRF       output_n_L0+1
	CLRF       output_k_L0+0
	CLRF       output_k_L0+1
;jyro_angle_v3.c,95 :: 		UART_write((x>=0) ? '+' : '-');
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
	GOTO       L_output11
	MOVLW      43
	MOVWF      R0
	GOTO       L_output12
L_output11:
	MOVLW      45
	MOVWF      R0
L_output12:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;jyro_angle_v3.c,97 :: 		if(x<0)
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
	GOTO       L_output13
;jyro_angle_v3.c,98 :: 		x=-x;
	MOVLW      0
	XORWF      FARG_output_x+0, 1
	MOVLW      0
	XORWF      FARG_output_x+1, 1
	MOVLW      128
	XORWF      FARG_output_x+2, 1
	MOVLW      0
	XORWF      FARG_output_x+3, 1
L_output13:
;jyro_angle_v3.c,100 :: 		x=modf(x, &m);
	MOVF       FARG_output_x+0, 0
	MOVWF      FARG_modf_val+0
	MOVF       FARG_output_x+1, 0
	MOVWF      FARG_modf_val+1
	MOVF       FARG_output_x+2, 0
	MOVWF      FARG_modf_val+2
	MOVF       FARG_output_x+3, 0
	MOVWF      FARG_modf_val+3
	MOVLW      output_m_L0+0
	MOVWF      FARG_modf_iptr+0
	MOVLW      hi_addr(output_m_L0+0)
	MOVWF      FARG_modf_iptr+1
	CALL       _modf+0
	MOVF       R0, 0
	MOVWF      FLOC__output+0
	MOVF       R1, 0
	MOVWF      FLOC__output+1
	MOVF       R2, 0
	MOVWF      FLOC__output+2
	MOVF       R3, 0
	MOVWF      FLOC__output+3
	MOVF       FLOC__output+0, 0
	MOVWF      FARG_output_x+0
	MOVF       FLOC__output+1, 0
	MOVWF      FARG_output_x+1
	MOVF       FLOC__output+2, 0
	MOVWF      FARG_output_x+2
	MOVF       FLOC__output+3, 0
	MOVWF      FARG_output_x+3
;jyro_angle_v3.c,101 :: 		n=(int)m;
	MOVF       output_m_L0+0, 0
	MOVWF      R0
	MOVF       output_m_L0+1, 0
	MOVWF      R1
	MOVF       output_m_L0+2, 0
	MOVWF      R2
	MOVF       output_m_L0+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      output_n_L0+0
	MOVF       R1, 0
	MOVWF      output_n_L0+1
;jyro_angle_v3.c,102 :: 		k=(int)(x*10000.0);
	MOVF       FLOC__output+0, 0
	MOVWF      R0
	MOVF       FLOC__output+1, 0
	MOVWF      R1
	MOVF       FLOC__output+2, 0
	MOVWF      R2
	MOVF       FLOC__output+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      28
	MOVWF      R6
	MOVLW      140
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      output_k_L0+0
	MOVF       R1, 0
	MOVWF      output_k_L0+1
;jyro_angle_v3.c,104 :: 		UART_write(dec2ascii((n%1000-n%100)/100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       output_n_L0+0, 0
	MOVWF      R0
	MOVF       output_n_L0+1, 0
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
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_n_L0+0, 0
	MOVWF      R0
	MOVF       output_n_L0+1, 0
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
;jyro_angle_v3.c,105 :: 		UART_write(dec2ascii((n%100-n%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_n_L0+0, 0
	MOVWF      R0
	MOVF       output_n_L0+1, 0
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
	MOVF       output_n_L0+0, 0
	MOVWF      R0
	MOVF       output_n_L0+1, 0
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
;jyro_angle_v3.c,106 :: 		UART_write(dec2ascii(n%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_n_L0+0, 0
	MOVWF      R0
	MOVF       output_n_L0+1, 0
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
;jyro_angle_v3.c,107 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;jyro_angle_v3.c,108 :: 		UART_write(dec2ascii((k%10000-k%1000)/1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;jyro_angle_v3.c,109 :: 		UART_write(dec2ascii((k%1000-k%100)/100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
;jyro_angle_v3.c,110 :: 		UART_write(dec2ascii((k%100-k%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
;jyro_angle_v3.c,111 :: 		UART_write(dec2ascii(k%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       output_k_L0+0, 0
	MOVWF      R0
	MOVF       output_k_L0+1, 0
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
;jyro_angle_v3.c,112 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;jyro_angle_v3.c,113 :: 		}
L_end_output:
	RETURN
; end of _output

_dec2ascii:

;jyro_angle_v3.c,115 :: 		char dec2ascii(char dec)
;jyro_angle_v3.c,117 :: 		switch(dec){
	GOTO       L_dec2ascii14
;jyro_angle_v3.c,118 :: 		case 0: return '0';
L_dec2ascii16:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,119 :: 		case 1: return '1';
L_dec2ascii17:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,120 :: 		case 2: return '2';
L_dec2ascii18:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,121 :: 		case 3: return '3';
L_dec2ascii19:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,122 :: 		case 4: return '4';
L_dec2ascii20:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,123 :: 		case 5: return '5';
L_dec2ascii21:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,124 :: 		case 6: return '6';
L_dec2ascii22:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,125 :: 		case 7: return '7';
L_dec2ascii23:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,126 :: 		case 8: return '8';
L_dec2ascii24:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,127 :: 		case 9: return '9';
L_dec2ascii25:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,128 :: 		default: return '*';
L_dec2ascii26:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v3.c,129 :: 		}
L_dec2ascii14:
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii16
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii17
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii18
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii19
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii20
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii21
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii22
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii23
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii24
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii25
	GOTO       L_dec2ascii26
;jyro_angle_v3.c,130 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii
