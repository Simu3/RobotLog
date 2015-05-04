
_Main:

;angle_v10.c,24 :: 		void Main()
;angle_v10.c,26 :: 		double accele_x_bias = 0.0, accele_y_bias = 0.0;
	MOVLW      ?ICSMain_accele_x_bias_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSMain_accele_x_bias_L0+0)
	MOVWF      FSR0H
	MOVLW      Main_accele_x_bias_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(Main_accele_x_bias_L0+0)
	MOVWF      FSR1H
	MOVLW      66
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_v10.c,36 :: 		SetUp();
	CALL       _SetUp+0
;angle_v10.c,38 :: 		for(i = 0; i < 100; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main0:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main45
	MOVLW      100
	SUBWF      Main_i_L0+0, 0
L__Main45:
	BTFSC      STATUS+0, 0
	GOTO       L_Main1
;angle_v10.c,39 :: 		accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_accele_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_x_bias_L0+3
;angle_v10.c,40 :: 		accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_accele_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_y_bias_L0+3
;angle_v10.c,41 :: 		jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_jyro_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_x_bias_L0+3
;angle_v10.c,42 :: 		jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_jyro_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_y_bias_L0+3
;angle_v10.c,43 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12
	MOVLW      235
	MOVWF      R13
L_Main3:
	DECFSZ     R13, 1
	GOTO       L_Main3
	DECFSZ     R12, 1
	GOTO       L_Main3
;angle_v10.c,38 :: 		for(i = 0; i < 100; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_v10.c,44 :: 		}
	GOTO       L_Main0
L_Main1:
;angle_v10.c,46 :: 		accele_x_bias /= 100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       Main_accele_x_bias_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_x_bias_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_x_bias_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_x_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_x_bias_L0+3
;angle_v10.c,47 :: 		accele_y_bias /= 100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       Main_accele_y_bias_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_y_bias_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_y_bias_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_y_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_y_bias_L0+3
;angle_v10.c,48 :: 		jyro_x_bias   /= 100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       Main_jyro_x_bias_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_x_bias_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_x_bias_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_x_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_x_bias_L0+3
;angle_v10.c,49 :: 		jyro_y_bias   /= 100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       Main_jyro_y_bias_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_y_bias_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_y_bias_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_y_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_y_bias_L0+3
;angle_v10.c,51 :: 		while(1){
L_Main4:
;angle_v10.c,52 :: 		while(ARM_STATE == 0){
L_Main6:
	BTFSC      PORTB+0, 5
	GOTO       L_Main7
;angle_v10.c,53 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,54 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,55 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,57 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12
	MOVLW      235
	MOVWF      R13
L_Main8:
	DECFSZ     R13, 1
	GOTO       L_Main8
	DECFSZ     R12, 1
	GOTO       L_Main8
;angle_v10.c,59 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,60 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,61 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,63 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12
	MOVLW      235
	MOVWF      R13
L_Main9:
	DECFSZ     R13, 1
	GOTO       L_Main9
	DECFSZ     R12, 1
	GOTO       L_Main9
;angle_v10.c,64 :: 		}
	GOTO       L_Main6
L_Main7:
;angle_v10.c,66 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle_v10.c,68 :: 		accele_x[0] = (ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias) * ACCELE_COEFFICIENT;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_accele_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_x_L0+3
;angle_v10.c,69 :: 		accele_y[0] = (ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias) * ACCELE_COEFFICIENT;
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_accele_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_y_L0+3
;angle_v10.c,70 :: 		accele_z[0] = (ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS) * ACCELE_COEFFICIENT;
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      128
	MOVWF      R5
	MOVLW      125
	MOVWF      R6
	MOVLW      135
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_z_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_z_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_z_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_z_L0+3
;angle_v10.c,71 :: 		jyro_x[0]   = (ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias)   * JYRO_COEFFICIENT;
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_jyro_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      76
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      9
	MOVWF      R6
	MOVLW      112
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_x_L0+3
;angle_v10.c,72 :: 		jyro_y[0]   = (ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias)   * JYRO_COEFFICIENT;
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       Main_jyro_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      76
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      9
	MOVWF      R6
	MOVLW      112
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_y_L0+3
;angle_v10.c,75 :: 		accele_x[0] = accele_x[1] * (1.0 - LPF_COEFFICIENT) + accele_x[0] * LPF_COEFFICIENT;
	MOVF       Main_accele_x_L0+4, 0
	MOVWF      R0
	MOVF       Main_accele_x_L0+5, 0
	MOVWF      R1
	MOVF       Main_accele_x_L0+6, 0
	MOVWF      R2
	MOVF       Main_accele_x_L0+7, 0
	MOVWF      R3
	MOVLW      102
	MOVWF      R4
	MOVLW      102
	MOVWF      R5
	MOVLW      102
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_x_L0+3
;angle_v10.c,76 :: 		accele_y[0] = accele_y[1] * (1.0 - LPF_COEFFICIENT) + accele_y[0] * LPF_COEFFICIENT;
	MOVF       Main_accele_y_L0+4, 0
	MOVWF      R0
	MOVF       Main_accele_y_L0+5, 0
	MOVWF      R1
	MOVF       Main_accele_y_L0+6, 0
	MOVWF      R2
	MOVF       Main_accele_y_L0+7, 0
	MOVWF      R3
	MOVLW      102
	MOVWF      R4
	MOVLW      102
	MOVWF      R5
	MOVLW      102
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_y_L0+3
;angle_v10.c,77 :: 		accele_z[0] = accele_z[1] * (1.0 - LPF_COEFFICIENT) + accele_z[0] * LPF_COEFFICIENT;
	MOVF       Main_accele_z_L0+4, 0
	MOVWF      R0
	MOVF       Main_accele_z_L0+5, 0
	MOVWF      R1
	MOVF       Main_accele_z_L0+6, 0
	MOVWF      R2
	MOVF       Main_accele_z_L0+7, 0
	MOVWF      R3
	MOVLW      102
	MOVWF      R4
	MOVLW      102
	MOVWF      R5
	MOVLW      102
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_z_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_z_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_z_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_z_L0+3
;angle_v10.c,80 :: 		jyro_x[0] = jyro_x[0] - (jyro_x[1] * (1.0 - HPF_COEFFICIENT) + jyro_x[0] * HPF_COEFFICIENT);
	MOVF       Main_jyro_x_L0+4, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+5, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+6, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+7, 0
	MOVWF      R3
	MOVLW      102
	MOVWF      R4
	MOVLW      102
	MOVWF      R5
	MOVLW      102
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_x_L0+3
;angle_v10.c,81 :: 		jyro_y[0] = jyro_y[0] - (jyro_y[1] * (1.0 - HPF_COEFFICIENT) + jyro_y[0] * HPF_COEFFICIENT);
	MOVF       Main_jyro_y_L0+4, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+5, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+6, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+7, 0
	MOVWF      R3
	MOVLW      102
	MOVWF      R4
	MOVLW      102
	MOVWF      R5
	MOVLW      102
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_jyro_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_y_L0+3
;angle_v10.c,86 :: 		roll  = (roll  + (jyro_x[1] + jyro_x[0]) * DT * 0.5) * (1.0 - COMPLEMENT_COEFFICIENT)
	MOVF       Main_jyro_x_L0+4, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+5, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+6, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+7, 0
	MOVWF      R3
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
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
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVLW      123
	MOVWF      R4
	MOVLW      20
	MOVWF      R5
	MOVLW      110
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R3
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      R3
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
;angle_v10.c,87 :: 		+ atan(accele_x[0] / sqrt(accele_y[0] * accele_y[0] + accele_z[0] * accele_z[0])) * (180.0 / PI) * COMPLEMENT_COEFFICIENT;
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
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
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_atan_f+0
	MOVF       R1, 0
	MOVWF      FARG_atan_f+1
	MOVF       R2, 0
	MOVWF      FARG_atan_f+2
	MOVF       R3, 0
	MOVWF      FARG_atan_f+3
	CALL       _atan+0
	MOVLW      224
	MOVWF      R4
	MOVLW      46
	MOVWF      R5
	MOVLW      101
	MOVWF      R6
	MOVLW      132
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      41
	MOVWF      R4
	MOVLW      92
	MOVWF      R5
	MOVLW      15
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_roll_L0+0
	MOVF       R1, 0
	MOVWF      Main_roll_L0+1
	MOVF       R2, 0
	MOVWF      Main_roll_L0+2
	MOVF       R3, 0
	MOVWF      Main_roll_L0+3
;angle_v10.c,88 :: 		pitch = (pitch + (jyro_y[1] + jyro_y[0]) * DT * 0.5) * (1.0 - COMPLEMENT_COEFFICIENT)
	MOVF       Main_jyro_y_L0+4, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+5, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+6, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+7, 0
	MOVWF      R3
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
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
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVLW      123
	MOVWF      R4
	MOVLW      20
	MOVWF      R5
	MOVLW      110
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R3
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      R3
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
;angle_v10.c,89 :: 		+ atan(accele_y[0] / sqrt(accele_x[0] * accele_x[0] + accele_z[0] * accele_z[0])) * (180.0 / PI) * COMPLEMENT_COEFFICIENT;
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
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
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_atan_f+0
	MOVF       R1, 0
	MOVWF      FARG_atan_f+1
	MOVF       R2, 0
	MOVWF      FARG_atan_f+2
	MOVF       R3, 0
	MOVWF      FARG_atan_f+3
	CALL       _atan+0
	MOVLW      224
	MOVWF      R4
	MOVLW      46
	MOVWF      R5
	MOVLW      101
	MOVWF      R6
	MOVLW      132
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      41
	MOVWF      R4
	MOVLW      92
	MOVWF      R5
	MOVLW      15
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_pitch_L0+0
	MOVF       R1, 0
	MOVWF      Main_pitch_L0+1
	MOVF       R2, 0
	MOVWF      Main_pitch_L0+2
	MOVF       R3, 0
	MOVWF      Main_pitch_L0+3
;angle_v10.c,92 :: 		if(-0.1 < roll  && roll  < 0.1)
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
	MOVWF      R7
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      204
	MOVWF      R2
	MOVLW      123
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main12
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	MOVF       Main_roll_L0+0, 0
	MOVWF      R0
	MOVF       Main_roll_L0+1, 0
	MOVWF      R1
	MOVF       Main_roll_L0+2, 0
	MOVWF      R2
	MOVF       Main_roll_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main12
L__Main43:
;angle_v10.c,93 :: 		roll = 0.0;
	CLRF       Main_roll_L0+0
	CLRF       Main_roll_L0+1
	CLRF       Main_roll_L0+2
	CLRF       Main_roll_L0+3
L_Main12:
;angle_v10.c,94 :: 		if(-0.1 < pitch && pitch < 0.1)
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R7
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      204
	MOVWF      R2
	MOVLW      123
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main15
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      123
	MOVWF      R7
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R0
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R1
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R2
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main15
L__Main42:
;angle_v10.c,95 :: 		pitch = 0.0;
	CLRF       Main_pitch_L0+0
	CLRF       Main_pitch_L0+1
	CLRF       Main_pitch_L0+2
	CLRF       Main_pitch_L0+3
L_Main15:
;angle_v10.c,107 :: 		OutPut(pitch - roll * 0.5, pitch + roll * 0.5);  //right, left
	MOVF       Main_roll_L0+0, 0
	MOVWF      R0
	MOVF       Main_roll_L0+1, 0
	MOVWF      R1
	MOVF       Main_roll_L0+2, 0
	MOVWF      R2
	MOVF       Main_roll_L0+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R0
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R1
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R2
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_OutPut+0
	MOVF       R1, 0
	MOVWF      FARG_OutPut+1
	MOVF       R2, 0
	MOVWF      FARG_OutPut+2
	MOVF       R3, 0
	MOVWF      FARG_OutPut+3
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R0
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R1
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R2
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R3
	MOVF       FLOC__Main+0, 0
	MOVWF      R4
	MOVF       FLOC__Main+1, 0
	MOVWF      R5
	MOVF       FLOC__Main+2, 0
	MOVWF      R6
	MOVF       FLOC__Main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_OutPut+0
	MOVF       R1, 0
	MOVWF      FARG_OutPut+1
	MOVF       R2, 0
	MOVWF      FARG_OutPut+2
	MOVF       R3, 0
	MOVWF      FARG_OutPut+3
	CALL       _OutPut+0
;angle_v10.c,110 :: 		accele_x[1] = accele_x[0];
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      Main_accele_x_L0+4
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      Main_accele_x_L0+5
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      Main_accele_x_L0+6
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      Main_accele_x_L0+7
;angle_v10.c,111 :: 		accele_y[1] = accele_y[0];
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      Main_accele_y_L0+4
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      Main_accele_y_L0+5
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      Main_accele_y_L0+6
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      Main_accele_y_L0+7
;angle_v10.c,112 :: 		accele_z[1] = accele_z[0];
	MOVF       Main_accele_z_L0+0, 0
	MOVWF      Main_accele_z_L0+4
	MOVF       Main_accele_z_L0+1, 0
	MOVWF      Main_accele_z_L0+5
	MOVF       Main_accele_z_L0+2, 0
	MOVWF      Main_accele_z_L0+6
	MOVF       Main_accele_z_L0+3, 0
	MOVWF      Main_accele_z_L0+7
;angle_v10.c,114 :: 		jyro_x[1] = jyro_x[0];
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      Main_jyro_x_L0+4
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      Main_jyro_x_L0+5
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      Main_jyro_x_L0+6
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      Main_jyro_x_L0+7
;angle_v10.c,115 :: 		jyro_y[1] = jyro_y[0];
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      Main_jyro_y_L0+4
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      Main_jyro_y_L0+5
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      Main_jyro_y_L0+6
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      Main_jyro_y_L0+7
;angle_v10.c,116 :: 		}
	GOTO       L_Main4
;angle_v10.c,117 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;angle_v10.c,119 :: 		void SetUp()
;angle_v10.c,121 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v10.c,123 :: 		OPTION_REG = 0x07;  //タイマー0設定
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_v10.c,125 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v10.c,126 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_v10.c,127 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_v10.c,128 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_v10.c,130 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v10.c,131 :: 		TRISB  = 0x20;
	MOVLW      32
	MOVWF      TRISB+0
;angle_v10.c,132 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_v10.c,133 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_v10.c,134 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_v10.c,136 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_v10.c,137 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_v10.c,138 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_v10.c,139 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_v10.c,140 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_v10.c,142 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v10.c,144 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v10.c,149 :: 		Soft_UART_Init(&PORTB, 6, 4, 9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTB+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      6
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      4
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;angle_v10.c,152 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp16:
	DECFSZ     R13, 1
	GOTO       L_SetUp16
	DECFSZ     R12, 1
	GOTO       L_SetUp16
	NOP
;angle_v10.c,153 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_OutPut:

;angle_v10.c,155 :: 		void OutPut(double right, double left)
;angle_v10.c,159 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,160 :: 		UART1_Write((right >= 0.0) ? 0 : 1); //+ : 0 - : 1
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_OutPut_right+0, 0
	MOVWF      R0
	MOVF       FARG_OutPut_right+1, 0
	MOVWF      R1
	MOVF       FARG_OutPut_right+2, 0
	MOVWF      R2
	MOVF       FARG_OutPut_right+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OutPut17
	CLRF       R0
	GOTO       L_OutPut18
L_OutPut17:
	MOVLW      1
	MOVWF      R0
L_OutPut18:
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,161 :: 		tmp = (int)(abs(right) * 10.0);
	MOVF       FARG_OutPut_right+0, 0
	MOVWF      R0
	MOVF       FARG_OutPut_right+1, 0
	MOVWF      R1
	MOVF       FARG_OutPut_right+2, 0
	MOVWF      R2
	MOVF       FARG_OutPut_right+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_abs_a+0
	MOVF       R1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	CALL       _Int2Double+0
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
;angle_v10.c,162 :: 		UART1_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v10.c,164 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,165 :: 		Soft_UART_Write((left >= 0.0) ? 0 : 1);
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_OutPut_left+0, 0
	MOVWF      R0
	MOVF       FARG_OutPut_left+1, 0
	MOVWF      R1
	MOVF       FARG_OutPut_left+2, 0
	MOVWF      R2
	MOVF       FARG_OutPut_left+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_OutPut19
	CLRF       R0
	GOTO       L_OutPut20
L_OutPut19:
	MOVLW      1
	MOVWF      R0
L_OutPut20:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,166 :: 		tmp = (int)(abs(left) * 10.0);
	MOVF       FARG_OutPut_left+0, 0
	MOVWF      R0
	MOVF       FARG_OutPut_left+1, 0
	MOVWF      R1
	MOVF       FARG_OutPut_left+2, 0
	MOVWF      R2
	MOVF       FARG_OutPut_left+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_abs_a+0
	MOVF       R1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	CALL       _Int2Double+0
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
;angle_v10.c,167 :: 		Soft_UART_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,168 :: 		}
L_end_OutPut:
	RETURN
; end of _OutPut

_Debug:

;angle_v10.c,170 :: 		void Debug(double roll, double pitch)
;angle_v10.c,174 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,175 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,176 :: 		Soft_UART_Write((roll >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_roll+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_roll+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_roll+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_roll+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug21
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug22
L_Debug21:
	MOVLW      45
	MOVWF      R0
L_Debug22:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,177 :: 		tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_roll+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_roll+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_roll+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_roll+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug23
	MOVF       FARG_Debug_roll+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_roll+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_roll+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_roll+3, 0
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
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVF       R2, 0
	MOVWF      FLOC__Debug+2
	MOVF       R3, 0
	MOVWF      FLOC__Debug+3
	GOTO       L_Debug24
L_Debug23:
	MOVLW      0
	XORWF      FARG_Debug_roll+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Debug_roll+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Debug_roll+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Debug_roll+3, 0
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
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVF       R2, 0
	MOVWF      FLOC__Debug+2
	MOVF       R3, 0
	MOVWF      FLOC__Debug+3
L_Debug24:
	MOVF       FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       FLOC__Debug+1, 0
	MOVWF      R1
	MOVF       FLOC__Debug+2, 0
	MOVWF      R2
	MOVF       FLOC__Debug+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      Debug_tmp_L0+0
	MOVF       R1, 0
	MOVWF      Debug_tmp_L0+1
;angle_v10.c,178 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,179 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,180 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,181 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,182 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,184 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,185 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,186 :: 		Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_pitch+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_pitch+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_pitch+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_pitch+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug25
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug26
L_Debug25:
	MOVLW      45
	MOVWF      R0
L_Debug26:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,187 :: 		tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_pitch+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_pitch+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_pitch+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_pitch+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug27
	MOVF       FARG_Debug_pitch+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_pitch+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_pitch+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_pitch+3, 0
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
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVF       R2, 0
	MOVWF      FLOC__Debug+2
	MOVF       R3, 0
	MOVWF      FLOC__Debug+3
	GOTO       L_Debug28
L_Debug27:
	MOVLW      0
	XORWF      FARG_Debug_pitch+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Debug_pitch+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Debug_pitch+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Debug_pitch+3, 0
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
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVF       R2, 0
	MOVWF      FLOC__Debug+2
	MOVF       R3, 0
	MOVWF      FLOC__Debug+3
L_Debug28:
	MOVF       FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       FLOC__Debug+1, 0
	MOVWF      R1
	MOVF       FLOC__Debug+2, 0
	MOVWF      R2
	MOVF       FLOC__Debug+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      Debug_tmp_L0+0
	MOVF       R1, 0
	MOVWF      Debug_tmp_L0+1
;angle_v10.c,188 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,189 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Debug+0
	MOVF       R1, 0
	MOVWF      FLOC__Debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Debug+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,190 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,191 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Debug_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Debug_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,192 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,194 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,195 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,196 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,197 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,198 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,199 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,200 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,201 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,202 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,203 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,204 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,205 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,206 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,207 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,208 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,209 :: 		Soft_UART_Write('\b');
	MOVLW      8
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,210 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_AcceleCheck:

;angle_v10.c,212 :: 		void AcceleCheck(double accele_x, double accele_y, double accele_z)
;angle_v10.c,216 :: 		tmp = (int)accele_x;
	MOVF       FARG_AcceleCheck_accele_x+0, 0
	MOVWF      R0
	MOVF       FARG_AcceleCheck_accele_x+1, 0
	MOVWF      R1
	MOVF       FARG_AcceleCheck_accele_x+2, 0
	MOVWF      R2
	MOVF       FARG_AcceleCheck_accele_x+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      AcceleCheck_tmp_L0+0
	MOVF       R1, 0
	MOVWF      AcceleCheck_tmp_L0+1
;angle_v10.c,217 :: 		Soft_UART_Write('X');
	MOVLW      88
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,218 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,219 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,220 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,221 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,222 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,223 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,225 :: 		tmp = (int)accele_y;
	MOVF       FARG_AcceleCheck_accele_y+0, 0
	MOVWF      R0
	MOVF       FARG_AcceleCheck_accele_y+1, 0
	MOVWF      R1
	MOVF       FARG_AcceleCheck_accele_y+2, 0
	MOVWF      R2
	MOVF       FARG_AcceleCheck_accele_y+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      AcceleCheck_tmp_L0+0
	MOVF       R1, 0
	MOVWF      AcceleCheck_tmp_L0+1
;angle_v10.c,226 :: 		Soft_UART_Write('Y');
	MOVLW      89
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,227 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,228 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,229 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,230 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,231 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,232 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,234 :: 		tmp = (int)accele_z;
	MOVF       FARG_AcceleCheck_accele_z+0, 0
	MOVWF      R0
	MOVF       FARG_AcceleCheck_accele_z+1, 0
	MOVWF      R1
	MOVF       FARG_AcceleCheck_accele_z+2, 0
	MOVWF      R2
	MOVF       FARG_AcceleCheck_accele_z+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      AcceleCheck_tmp_L0+0
	MOVF       R1, 0
	MOVWF      AcceleCheck_tmp_L0+1
;angle_v10.c,235 :: 		Soft_UART_Write('Z');
	MOVLW      90
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,236 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,237 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
	MOVLW      16
	MOVWF      R4
	MOVLW      39
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,238 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,239 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__AcceleCheck+0
	MOVF       R1, 0
	MOVWF      FLOC__AcceleCheck+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__AcceleCheck+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__AcceleCheck+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,240 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       AcceleCheck_tmp_L0+0, 0
	MOVWF      R0
	MOVF       AcceleCheck_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_Dec2Ascii+0
	CALL       _Dec2Ascii+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,241 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v10.c,242 :: 		}
L_end_AcceleCheck:
	RETURN
; end of _AcceleCheck

_Dec2Ascii:

;angle_v10.c,244 :: 		char Dec2Ascii(char dec)
;angle_v10.c,246 :: 		switch(dec){
	GOTO       L_Dec2Ascii29
;angle_v10.c,247 :: 		case 0:  return '0';
L_Dec2Ascii31:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,248 :: 		case 1:  return '1';
L_Dec2Ascii32:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,249 :: 		case 2:  return '2';
L_Dec2Ascii33:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,250 :: 		case 3:  return '3';
L_Dec2Ascii34:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,251 :: 		case 4:  return '4';
L_Dec2Ascii35:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,252 :: 		case 5:  return '5';
L_Dec2Ascii36:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,253 :: 		case 6:  return '6';
L_Dec2Ascii37:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,254 :: 		case 7:  return '7';
L_Dec2Ascii38:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,255 :: 		case 8:  return '8';
L_Dec2Ascii39:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,256 :: 		case 9:  return '9';
L_Dec2Ascii40:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,257 :: 		default: return '*';
L_Dec2Ascii41:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v10.c,258 :: 		}
L_Dec2Ascii29:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii31
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii32
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii33
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii34
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii35
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii36
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii37
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii38
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii39
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii40
	GOTO       L_Dec2Ascii41
;angle_v10.c,259 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
