
_Main:

;angle_simple.c,20 :: 		void Main()
;angle_simple.c,22 :: 		double accele_x_bias = 0.0, accele_y_bias = 0.0;
	MOVLW      ?ICSMain_accele_x_bias_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSMain_accele_x_bias_L0+0)
	MOVWF      FSR0H
	MOVLW      Main_accele_x_bias_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(Main_accele_x_bias_L0+0)
	MOVWF      FSR1H
	MOVLW      50
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_simple.c,35 :: 		SetUp();
	CALL       _SetUp+0
;angle_simple.c,37 :: 		for(i = 0; i < 100; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main0:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main48
	MOVLW      100
	SUBWF      Main_i_L0+0, 0
L__Main48:
	BTFSC      STATUS+0, 0
	GOTO       L_Main1
;angle_simple.c,38 :: 		accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
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
;angle_simple.c,39 :: 		accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
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
;angle_simple.c,40 :: 		jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
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
;angle_simple.c,41 :: 		jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
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
;angle_simple.c,37 :: 		for(i = 0; i < 100; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_simple.c,42 :: 		}
	GOTO       L_Main0
L_Main1:
;angle_simple.c,44 :: 		accele_x_bias /= 100.0;
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
;angle_simple.c,45 :: 		accele_y_bias /= 100.0;
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
;angle_simple.c,46 :: 		jyro_x_bias   /= 100.0;
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
;angle_simple.c,47 :: 		jyro_y_bias   /= 100.0;
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
;angle_simple.c,49 :: 		while(1){
L_Main3:
;angle_simple.c,55 :: 		accele_x = (ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias) * ACCELE_COEFFICIENT;
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
;angle_simple.c,56 :: 		accele_y = (ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias) * ACCELE_COEFFICIENT;
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
;angle_simple.c,57 :: 		accele_z = (ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS) * ACCELE_COEFFICIENT;
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;angle_simple.c,58 :: 		jyro_x   = (ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias)   * JYRO_COEFFICIENT;
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
;angle_simple.c,59 :: 		jyro_y   = (ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias)   * JYRO_COEFFICIENT;
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
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVF       R2, 0
	MOVWF      FLOC__Main+2
	MOVF       R3, 0
	MOVWF      FLOC__Main+3
	MOVF       FLOC__Main+0, 0
	MOVWF      Main_jyro_y_L0+0
	MOVF       FLOC__Main+1, 0
	MOVWF      Main_jyro_y_L0+1
	MOVF       FLOC__Main+2, 0
	MOVWF      Main_jyro_y_L0+2
	MOVF       FLOC__Main+3, 0
	MOVWF      Main_jyro_y_L0+3
;angle_simple.c,61 :: 		ang_var_x += jyro_x;
	MOVF       Main_ang_var_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_ang_var_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_ang_var_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_ang_var_x_L0+3, 0
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
	MOVWF      Main_ang_var_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_ang_var_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_ang_var_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_ang_var_x_L0+3
;angle_simple.c,62 :: 		ang_var_y += jyro_y;
	MOVF       Main_ang_var_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_ang_var_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_ang_var_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_ang_var_y_L0+3, 0
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
	MOVWF      Main_ang_var_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_ang_var_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_ang_var_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_ang_var_y_L0+3
;angle_simple.c,64 :: 		if(-0.05 < jyro_x && jyro_x < 0.05) jyro_x = 0.0;
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      R7
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      204
	MOVWF      R2
	MOVLW      122
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main7
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      122
	MOVWF      R7
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main7
L__Main46:
	CLRF       Main_jyro_x_L0+0
	CLRF       Main_jyro_x_L0+1
	CLRF       Main_jyro_x_L0+2
	CLRF       Main_jyro_x_L0+3
L_Main7:
;angle_simple.c,65 :: 		if(-0.05 < jyro_y && jyro_y < 0.05) jyro_y = 0.0;
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      R7
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      204
	MOVWF      R2
	MOVLW      122
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main10
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      122
	MOVWF      R7
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main10
L__Main45:
	CLRF       Main_jyro_y_L0+0
	CLRF       Main_jyro_y_L0+1
	CLRF       Main_jyro_y_L0+2
	CLRF       Main_jyro_y_L0+3
L_Main10:
;angle_simple.c,67 :: 		roll  += ang_var_x;
	MOVF       Main_roll_L0+0, 0
	MOVWF      R0
	MOVF       Main_roll_L0+1, 0
	MOVWF      R1
	MOVF       Main_roll_L0+2, 0
	MOVWF      R2
	MOVF       Main_roll_L0+3, 0
	MOVWF      R3
	MOVF       Main_ang_var_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_ang_var_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_ang_var_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_ang_var_x_L0+3, 0
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
;angle_simple.c,68 :: 		pitch += ang_var_y;
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R0
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R1
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R2
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R3
	MOVF       Main_ang_var_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_ang_var_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_ang_var_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_ang_var_y_L0+3, 0
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
;angle_simple.c,70 :: 		if(-0.01 < accele_x && accele_x < 0.01) roll  = 0.0;
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R7
	MOVLW      10
	MOVWF      R0
	MOVLW      215
	MOVWF      R1
	MOVLW      163
	MOVWF      R2
	MOVLW      120
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main13
	MOVLW      10
	MOVWF      R4
	MOVLW      215
	MOVWF      R5
	MOVLW      35
	MOVWF      R6
	MOVLW      120
	MOVWF      R7
	MOVF       Main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main13
L__Main44:
	CLRF       Main_roll_L0+0
	CLRF       Main_roll_L0+1
	CLRF       Main_roll_L0+2
	CLRF       Main_roll_L0+3
L_Main13:
;angle_simple.c,71 :: 		if(-0.01 < accele_y && accele_y < 0.01) pitch = 0.0;
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R7
	MOVLW      10
	MOVWF      R0
	MOVLW      215
	MOVWF      R1
	MOVLW      163
	MOVWF      R2
	MOVLW      120
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main16
	MOVLW      10
	MOVWF      R4
	MOVLW      215
	MOVWF      R5
	MOVLW      35
	MOVWF      R6
	MOVLW      120
	MOVWF      R7
	MOVF       Main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_accele_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main16
L__Main43:
	CLRF       Main_pitch_L0+0
	CLRF       Main_pitch_L0+1
	CLRF       Main_pitch_L0+2
	CLRF       Main_pitch_L0+3
L_Main16:
;angle_simple.c,80 :: 		Debug(roll, pitch);
	MOVF       Main_roll_L0+0, 0
	MOVWF      FARG_Debug+0
	MOVF       Main_roll_L0+1, 0
	MOVWF      FARG_Debug+1
	MOVF       Main_roll_L0+2, 0
	MOVWF      FARG_Debug+2
	MOVF       Main_roll_L0+3, 0
	MOVWF      FARG_Debug+3
	MOVF       Main_pitch_L0+0, 0
	MOVWF      FARG_Debug+0
	MOVF       Main_pitch_L0+1, 0
	MOVWF      FARG_Debug+1
	MOVF       Main_pitch_L0+2, 0
	MOVWF      FARG_Debug+2
	MOVF       Main_pitch_L0+3, 0
	MOVWF      FARG_Debug+3
	CALL       _Debug+0
;angle_simple.c,85 :: 		}
	GOTO       L_Main3
;angle_simple.c,86 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;angle_simple.c,88 :: 		void SetUp()
;angle_simple.c,90 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_simple.c,92 :: 		OPTION_REG = 0x07;  //タイマー0設定
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_simple.c,94 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_simple.c,95 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_simple.c,96 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_simple.c,97 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_simple.c,99 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_simple.c,100 :: 		TRISB  = 0x20;
	MOVLW      32
	MOVWF      TRISB+0
;angle_simple.c,101 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_simple.c,102 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_simple.c,103 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_simple.c,105 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_simple.c,106 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_simple.c,107 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_simple.c,108 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_simple.c,109 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_simple.c,111 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_simple.c,113 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_simple.c,116 :: 		Soft_UART_Init(&PORTB, 4, 6, 9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTB+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      4
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      6
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;angle_simple.c,121 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp17:
	DECFSZ     R13, 1
	GOTO       L_SetUp17
	DECFSZ     R12, 1
	GOTO       L_SetUp17
	NOP
;angle_simple.c,122 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_OutPut:

;angle_simple.c,124 :: 		void OutPut(double right, double left)
;angle_simple.c,128 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_simple.c,129 :: 		UART1_Write((right >= 0.0) ? 0 : 1); //+ : 0 - : 1
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
	GOTO       L_OutPut18
	CLRF       R0
	GOTO       L_OutPut19
L_OutPut18:
	MOVLW      1
	MOVWF      R0
L_OutPut19:
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_simple.c,130 :: 		tmp = (int)(abs(right) * 10.0);
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
;angle_simple.c,131 :: 		UART1_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_simple.c,133 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,134 :: 		Soft_UART_Write((left >= 0.0) ? 0 : 1);
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
	GOTO       L_OutPut20
	CLRF       R0
	GOTO       L_OutPut21
L_OutPut20:
	MOVLW      1
	MOVWF      R0
L_OutPut21:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,135 :: 		tmp = (int)(abs(left) * 10.0);
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
;angle_simple.c,136 :: 		Soft_UART_Write(tmp);
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,137 :: 		}
L_end_OutPut:
	RETURN
; end of _OutPut

_Debug:

;angle_simple.c,139 :: 		void Debug(double roll, double pitch)
;angle_simple.c,143 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,144 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,145 :: 		Soft_UART_Write((roll >= 0.0) ? '+' : '-');
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
	GOTO       L_Debug22
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug23
L_Debug22:
	MOVLW      45
	MOVWF      R0
L_Debug23:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,146 :: 		tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
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
	GOTO       L_Debug24
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
	GOTO       L_Debug25
L_Debug24:
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
L_Debug25:
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
;angle_simple.c,147 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_simple.c,148 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_simple.c,149 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,150 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_simple.c,151 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,153 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,154 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,155 :: 		Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
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
	GOTO       L_Debug26
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug27
L_Debug26:
	MOVLW      45
	MOVWF      R0
L_Debug27:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,156 :: 		tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
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
	GOTO       L_Debug28
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
	GOTO       L_Debug29
L_Debug28:
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
L_Debug29:
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
;angle_simple.c,157 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_simple.c,158 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_simple.c,159 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,160 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_simple.c,161 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,162 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_AcceleCheck:

;angle_simple.c,164 :: 		void AcceleCheck(double accele_x, double accele_y, double accele_z)
;angle_simple.c,168 :: 		tmp = (int)accele_x;
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
;angle_simple.c,169 :: 		Soft_UART_Write('X');
	MOVLW      88
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,170 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,171 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_simple.c,172 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_simple.c,173 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_simple.c,174 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_simple.c,175 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,177 :: 		tmp = (int)accele_y;
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
;angle_simple.c,178 :: 		Soft_UART_Write('Y');
	MOVLW      89
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,179 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,180 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_simple.c,181 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_simple.c,182 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_simple.c,183 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_simple.c,184 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,186 :: 		tmp = (int)accele_z;
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
;angle_simple.c,187 :: 		Soft_UART_Write('Z');
	MOVLW      90
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,188 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,189 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;angle_simple.c,190 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;angle_simple.c,191 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;angle_simple.c,192 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_simple.c,193 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_simple.c,194 :: 		}
L_end_AcceleCheck:
	RETURN
; end of _AcceleCheck

_Dec2Ascii:

;angle_simple.c,196 :: 		char Dec2Ascii(char dec)
;angle_simple.c,198 :: 		switch(dec){
	GOTO       L_Dec2Ascii30
;angle_simple.c,199 :: 		case 0:  return '0';
L_Dec2Ascii32:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,200 :: 		case 1:  return '1';
L_Dec2Ascii33:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,201 :: 		case 2:  return '2';
L_Dec2Ascii34:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,202 :: 		case 3:  return '3';
L_Dec2Ascii35:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,203 :: 		case 4:  return '4';
L_Dec2Ascii36:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,204 :: 		case 5:  return '5';
L_Dec2Ascii37:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,205 :: 		case 6:  return '6';
L_Dec2Ascii38:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,206 :: 		case 7:  return '7';
L_Dec2Ascii39:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,207 :: 		case 8:  return '8';
L_Dec2Ascii40:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,208 :: 		case 9:  return '9';
L_Dec2Ascii41:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,209 :: 		default: return '*';
L_Dec2Ascii42:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_simple.c,210 :: 		}
L_Dec2Ascii30:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii32
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii33
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii34
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii35
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii36
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii37
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii38
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii39
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii40
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii41
	GOTO       L_Dec2Ascii42
;angle_simple.c,211 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
