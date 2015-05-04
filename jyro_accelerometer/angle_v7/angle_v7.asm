
_Main:

;angle_v7.c,22 :: 		void Main()
;angle_v7.c,24 :: 		double accele_x_bias = 0.0, accele_y_bias = 0.0;
	MOVLW      ?ICSMain_accele_x_bias_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSMain_accele_x_bias_L0+0)
	MOVWF      FSR0H
	MOVLW      Main_accele_x_bias_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(Main_accele_x_bias_L0+0)
	MOVWF      FSR1H
	MOVLW      54
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_v7.c,32 :: 		SetUp();
	CALL       _SetUp+0
;angle_v7.c,34 :: 		for(i = 0; i < 100; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main0:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main40
	MOVLW      100
	SUBWF      Main_i_L0+0, 0
L__Main40:
	BTFSC      STATUS+0, 0
	GOTO       L_Main1
;angle_v7.c,35 :: 		accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
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
;angle_v7.c,36 :: 		accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
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
;angle_v7.c,37 :: 		jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
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
;angle_v7.c,38 :: 		jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
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
;angle_v7.c,34 :: 		for(i = 0; i < 100; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_v7.c,39 :: 		}
	GOTO       L_Main0
L_Main1:
;angle_v7.c,41 :: 		accele_x_bias /= 100.0;
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
;angle_v7.c,42 :: 		accele_y_bias /= 100.0;
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
;angle_v7.c,43 :: 		jyro_x_bias   /= 100.0;
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
;angle_v7.c,44 :: 		jyro_y_bias   /= 100.0;
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
;angle_v7.c,46 :: 		while(1){
L_Main3:
;angle_v7.c,47 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle_v7.c,49 :: 		accele_x = (ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias) * ACCELE_COEFFICIENT;
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
;angle_v7.c,50 :: 		accele_y = (ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias) * ACCELE_COEFFICIENT;
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
;angle_v7.c,51 :: 		accele_z = (ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS) * ACCELE_COEFFICIENT;
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
;angle_v7.c,52 :: 		jyro_x   = (ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias)   * JYRO_COEFFICIENT;
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
;angle_v7.c,53 :: 		jyro_y   = (ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias)   * JYRO_COEFFICIENT;
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
;angle_v7.c,55 :: 		theta_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 / PI);
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
	MOVF       R0, 0
	MOVWF      Main_theta_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_x_L0+3
;angle_v7.c,56 :: 		theta_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 / PI);
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
	MOVF       R0, 0
	MOVWF      Main_theta_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_y_L0+3
;angle_v7.c,58 :: 		roll  += (jyro_x * DT) - (W * roll  * DT) + (W * theta_x * DT); //相補フィルタ
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
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_x_L0+3, 0
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
	MOVLW      213
	MOVWF      R0
	MOVLW      137
	MOVWF      R1
	MOVLW      87
	MOVWF      R2
	MOVLW      126
	MOVWF      R3
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__Main+4, 0
	MOVWF      R0
	MOVF       FLOC__Main+5, 0
	MOVWF      R1
	MOVF       FLOC__Main+6, 0
	MOVWF      R2
	MOVF       FLOC__Main+7, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVLW      213
	MOVWF      R0
	MOVLW      137
	MOVWF      R1
	MOVLW      87
	MOVWF      R2
	MOVLW      126
	MOVWF      R3
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_x_L0+3, 0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
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
;angle_v7.c,59 :: 		pitch += (jyro_y * DT) - (W * pitch * DT) + (W * theta_y * DT);
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
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_y_L0+3, 0
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
	MOVLW      213
	MOVWF      R0
	MOVLW      137
	MOVWF      R1
	MOVLW      87
	MOVWF      R2
	MOVLW      126
	MOVWF      R3
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__Main+4, 0
	MOVWF      R0
	MOVF       FLOC__Main+5, 0
	MOVWF      R1
	MOVF       FLOC__Main+6, 0
	MOVWF      R2
	MOVF       FLOC__Main+7, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVLW      213
	MOVWF      R0
	MOVLW      137
	MOVWF      R1
	MOVLW      87
	MOVWF      R2
	MOVLW      126
	MOVWF      R3
	MOVF       Main_theta_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_y_L0+3, 0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
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
;angle_v7.c,61 :: 		if(-0.15 < roll  && roll  < 0.15)
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
	MOVWF      R7
	MOVLW      154
	MOVWF      R0
	MOVLW      153
	MOVWF      R1
	MOVLW      153
	MOVWF      R2
	MOVLW      124
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main7
	MOVLW      154
	MOVWF      R4
	MOVLW      153
	MOVWF      R5
	MOVLW      25
	MOVWF      R6
	MOVLW      124
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
	GOTO       L_Main7
L__Main38:
;angle_v7.c,62 :: 		roll = 0.0;
	CLRF       Main_roll_L0+0
	CLRF       Main_roll_L0+1
	CLRF       Main_roll_L0+2
	CLRF       Main_roll_L0+3
L_Main7:
;angle_v7.c,63 :: 		if(-0.15 < pitch && pitch < 0.15)
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R7
	MOVLW      154
	MOVWF      R0
	MOVLW      153
	MOVWF      R1
	MOVLW      153
	MOVWF      R2
	MOVLW      124
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main10
	MOVLW      154
	MOVWF      R4
	MOVLW      153
	MOVWF      R5
	MOVLW      25
	MOVWF      R6
	MOVLW      124
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
	GOTO       L_Main10
L__Main37:
;angle_v7.c,64 :: 		pitch = 0.0;
	CLRF       Main_pitch_L0+0
	CLRF       Main_pitch_L0+1
	CLRF       Main_pitch_L0+2
	CLRF       Main_pitch_L0+3
L_Main10:
;angle_v7.c,76 :: 		OutPut(pitch - roll, pitch + roll);  //right, left
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
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
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
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
;angle_v7.c,78 :: 		}
	GOTO       L_Main3
;angle_v7.c,79 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;angle_v7.c,81 :: 		void SetUp()
;angle_v7.c,83 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v7.c,85 :: 		OPTION_REG = 0x07;  //タイマー0設定
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_v7.c,87 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v7.c,88 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_v7.c,89 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_v7.c,90 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_v7.c,92 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v7.c,93 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;angle_v7.c,94 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_v7.c,95 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_v7.c,96 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_v7.c,98 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_v7.c,99 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_v7.c,100 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_v7.c,101 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_v7.c,102 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_v7.c,104 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v7.c,106 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v7.c,111 :: 		Soft_UART_Init(&PORTB, 6, 4, 9600, 0);
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
;angle_v7.c,114 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp11:
	DECFSZ     R13, 1
	GOTO       L_SetUp11
	DECFSZ     R12, 1
	GOTO       L_SetUp11
	NOP
;angle_v7.c,115 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_OutPut:

;angle_v7.c,117 :: 		void OutPut(double right, double left)
;angle_v7.c,121 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v7.c,122 :: 		UART1_Write((right >= 0.0) ? 0 : 1); //+ : 0 - : 1
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
	GOTO       L_OutPut12
	CLRF       R0
	GOTO       L_OutPut13
L_OutPut12:
	MOVLW      1
	MOVWF      R0
L_OutPut13:
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v7.c,123 :: 		tmp = (int)(abs(right) * 10.0);
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
;angle_v7.c,124 :: 		UART1_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v7.c,126 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,127 :: 		Soft_UART_Write((left >= 0.0) ? 0 : 1);
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
	GOTO       L_OutPut14
	CLRF       R0
	GOTO       L_OutPut15
L_OutPut14:
	MOVLW      1
	MOVWF      R0
L_OutPut15:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,128 :: 		tmp = (int)(abs(left) * 10.0);
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
;angle_v7.c,129 :: 		Soft_UART_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,130 :: 		}
L_end_OutPut:
	RETURN
; end of _OutPut

_Debug:

;angle_v7.c,132 :: 		void Debug(double roll, double pitch)
;angle_v7.c,136 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,137 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,138 :: 		Soft_UART_Write((roll >= 0.0) ? '+' : '-');
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
	GOTO       L_Debug16
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug17
L_Debug16:
	MOVLW      45
	MOVWF      R0
L_Debug17:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,139 :: 		tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
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
	GOTO       L_Debug18
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
	GOTO       L_Debug19
L_Debug18:
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
L_Debug19:
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
;angle_v7.c,140 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_v7.c,141 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_v7.c,142 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,143 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v7.c,144 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,146 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,147 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,148 :: 		Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
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
	GOTO       L_Debug20
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug21
L_Debug20:
	MOVLW      45
	MOVWF      R0
L_Debug21:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,149 :: 		tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
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
	GOTO       L_Debug22
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
	GOTO       L_Debug23
L_Debug22:
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
L_Debug23:
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
;angle_v7.c,150 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_v7.c,151 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_v7.c,152 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,153 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v7.c,154 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,155 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_AcceleCheck:

;angle_v7.c,157 :: 		void AcceleCheck(double accele_x, double accele_y, double accele_z)
;angle_v7.c,161 :: 		tmp = (int)accele_x;
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
;angle_v7.c,162 :: 		Soft_UART_Write('X');
	MOVLW      88
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,163 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,164 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_v7.c,165 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_v7.c,166 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_v7.c,167 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v7.c,168 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,170 :: 		tmp = (int)accele_y;
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
;angle_v7.c,171 :: 		Soft_UART_Write('Y');
	MOVLW      89
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,172 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,173 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_v7.c,174 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_v7.c,175 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_v7.c,176 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v7.c,177 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,179 :: 		tmp = (int)accele_z;
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
;angle_v7.c,180 :: 		Soft_UART_Write('Z');
	MOVLW      90
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,181 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,182 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_v7.c,183 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_v7.c,184 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_v7.c,185 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v7.c,186 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v7.c,187 :: 		}
L_end_AcceleCheck:
	RETURN
; end of _AcceleCheck

_Dec2Ascii:

;angle_v7.c,189 :: 		char Dec2Ascii(char dec)
;angle_v7.c,191 :: 		switch(dec){
	GOTO       L_Dec2Ascii24
;angle_v7.c,192 :: 		case 0:  return '0';
L_Dec2Ascii26:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,193 :: 		case 1:  return '1';
L_Dec2Ascii27:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,194 :: 		case 2:  return '2';
L_Dec2Ascii28:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,195 :: 		case 3:  return '3';
L_Dec2Ascii29:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,196 :: 		case 4:  return '4';
L_Dec2Ascii30:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,197 :: 		case 5:  return '5';
L_Dec2Ascii31:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,198 :: 		case 6:  return '6';
L_Dec2Ascii32:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,199 :: 		case 7:  return '7';
L_Dec2Ascii33:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,200 :: 		case 8:  return '8';
L_Dec2Ascii34:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,201 :: 		case 9:  return '9';
L_Dec2Ascii35:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,202 :: 		default: return '*';
L_Dec2Ascii36:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v7.c,203 :: 		}
L_Dec2Ascii24:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii26
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii27
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii28
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii29
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii30
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii31
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii32
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii33
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii34
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii35
	GOTO       L_Dec2Ascii36
;angle_v7.c,204 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
