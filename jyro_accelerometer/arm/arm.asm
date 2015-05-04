
_Main:

;arm.c,28 :: 		void Main()
;arm.c,30 :: 		double accele_x_bias = 0.0, accele_y_bias = 0.0;
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
;arm.c,38 :: 		SetUp();
	CALL       _SetUp+0
;arm.c,40 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11
	MOVLW      187
	MOVWF      R12
	MOVLW      223
	MOVWF      R13
L_Main0:
	DECFSZ     R13, 1
	GOTO       L_Main0
	DECFSZ     R12, 1
	GOTO       L_Main0
	DECFSZ     R11, 1
	GOTO       L_Main0
	NOP
	NOP
;arm.c,42 :: 		SetPosition(ROLL_ID,  ROLL_CENTER);
	MOVLW      1
	MOVWF      FARG_SetPosition+0
	MOVLW      112
	MOVWF      FARG_SetPosition+0
	MOVLW      23
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;arm.c,43 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_Main1:
	DECFSZ     R13, 1
	GOTO       L_Main1
	DECFSZ     R12, 1
	GOTO       L_Main1
	DECFSZ     R11, 1
	GOTO       L_Main1
	NOP
;arm.c,44 :: 		SetPosition(PITCH_ID, PITCH_CENTER);
	CLRF       FARG_SetPosition+0
	MOVLW      24
	MOVWF      FARG_SetPosition+0
	MOVLW      21
	MOVWF      FARG_SetPosition+1
	CALL       _SetPosition+0
;arm.c,45 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_Main2:
	DECFSZ     R13, 1
	GOTO       L_Main2
	DECFSZ     R12, 1
	GOTO       L_Main2
	DECFSZ     R11, 1
	GOTO       L_Main2
	NOP
;arm.c,47 :: 		for(i = 0; i < 100; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main3:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main38
	MOVLW      100
	SUBWF      Main_i_L0+0, 0
L__Main38:
	BTFSC      STATUS+0, 0
	GOTO       L_Main4
;arm.c,48 :: 		accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
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
;arm.c,49 :: 		accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
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
;arm.c,50 :: 		jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
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
;arm.c,51 :: 		jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
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
;arm.c,47 :: 		for(i = 0; i < 100; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;arm.c,52 :: 		}
	GOTO       L_Main3
L_Main4:
;arm.c,54 :: 		accele_x_bias /= 100.0;
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
;arm.c,55 :: 		accele_y_bias /= 100.0;
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
;arm.c,56 :: 		jyro_x_bias   /= 100.0;
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
;arm.c,57 :: 		jyro_y_bias   /= 100.0;
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
;arm.c,59 :: 		while(1){
L_Main6:
;arm.c,60 :: 		TMR0 = 0;
	CLRF       TMR0+0
;arm.c,62 :: 		accele_x = (ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias) * ACCELE_COEFFICIENT;
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
;arm.c,63 :: 		accele_y = (ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias) * ACCELE_COEFFICIENT;
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
;arm.c,64 :: 		accele_z = (ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS) * ACCELE_COEFFICIENT;
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
;arm.c,65 :: 		jyro_x   = (ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias)   * JYRO_COEFFICIENT;
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
;arm.c,66 :: 		jyro_y   = (ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias)   * JYRO_COEFFICIENT;
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
;arm.c,68 :: 		theta_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 / PI);
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
;arm.c,69 :: 		theta_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 / PI);
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
;arm.c,71 :: 		roll  += (jyro_x * DT) - (W * roll  * DT) + (W * theta_x * DT); //‘Š•âƒtƒBƒ‹ƒ^
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
	MOVLW      44
	MOVWF      R0
	MOVLW      201
	MOVWF      R1
	MOVLW      20
	MOVWF      R2
	MOVLW      128
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
	MOVLW      44
	MOVWF      R0
	MOVLW      201
	MOVWF      R1
	MOVLW      20
	MOVWF      R2
	MOVLW      128
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
;arm.c,72 :: 		pitch += (jyro_y * DT) - (W * pitch * DT) + (W * theta_y * DT);
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
	MOVLW      44
	MOVWF      R0
	MOVLW      201
	MOVWF      R1
	MOVLW      20
	MOVWF      R2
	MOVLW      128
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
	MOVLW      44
	MOVWF      R0
	MOVLW      201
	MOVWF      R1
	MOVLW      20
	MOVWF      R2
	MOVLW      128
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
;arm.c,74 :: 		if(roll > 18.0)
	MOVF       Main_roll_L0+0, 0
	MOVWF      R4
	MOVF       Main_roll_L0+1, 0
	MOVWF      R5
	MOVF       Main_roll_L0+2, 0
	MOVWF      R6
	MOVF       Main_roll_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      16
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main8
;arm.c,75 :: 		roll = 18.0;
	MOVLW      0
	MOVWF      Main_roll_L0+0
	MOVLW      0
	MOVWF      Main_roll_L0+1
	MOVLW      16
	MOVWF      Main_roll_L0+2
	MOVLW      131
	MOVWF      Main_roll_L0+3
	GOTO       L_Main9
L_Main8:
;arm.c,76 :: 		else if(roll < -18.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      144
	MOVWF      R6
	MOVLW      131
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
	GOTO       L_Main10
;arm.c,77 :: 		roll = -18.0;
	MOVLW      0
	MOVWF      Main_roll_L0+0
	MOVLW      0
	MOVWF      Main_roll_L0+1
	MOVLW      144
	MOVWF      Main_roll_L0+2
	MOVLW      131
	MOVWF      Main_roll_L0+3
L_Main10:
L_Main9:
;arm.c,79 :: 		if(pitch > 18.0)
	MOVF       Main_pitch_L0+0, 0
	MOVWF      R4
	MOVF       Main_pitch_L0+1, 0
	MOVWF      R5
	MOVF       Main_pitch_L0+2, 0
	MOVWF      R6
	MOVF       Main_pitch_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      16
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Main11
;arm.c,80 :: 		pitch = 18.0;
	MOVLW      0
	MOVWF      Main_pitch_L0+0
	MOVLW      0
	MOVWF      Main_pitch_L0+1
	MOVLW      16
	MOVWF      Main_pitch_L0+2
	MOVLW      131
	MOVWF      Main_pitch_L0+3
	GOTO       L_Main12
L_Main11:
;arm.c,81 :: 		else if(pitch < -18.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      144
	MOVWF      R6
	MOVLW      131
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
	GOTO       L_Main13
;arm.c,82 :: 		pitch = -18.0;
	MOVLW      0
	MOVWF      Main_pitch_L0+0
	MOVLW      0
	MOVWF      Main_pitch_L0+1
	MOVLW      144
	MOVWF      Main_pitch_L0+2
	MOVLW      131
	MOVWF      Main_pitch_L0+3
L_Main13:
L_Main12:
;arm.c,99 :: 		}
	GOTO       L_Main6
;arm.c,100 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;arm.c,102 :: 		void SetUp()
;arm.c,104 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;arm.c,106 :: 		OPTION_REG = 0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;arm.c,108 :: 		TXSTA.TX9 = 1;
	BSF        TXSTA+0, 6
;arm.c,110 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;arm.c,111 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;arm.c,112 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;arm.c,113 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;arm.c,115 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;arm.c,116 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;arm.c,117 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;arm.c,118 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;arm.c,119 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;arm.c,121 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;arm.c,122 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;arm.c,123 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;arm.c,124 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;arm.c,125 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;arm.c,127 :: 		ADC_Init();
	CALL       _ADC_Init+0
;arm.c,129 :: 		UART1_Init(115200);
	BSF        BAUDCON+0, 3
	MOVLW      16
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;arm.c,136 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp14:
	DECFSZ     R13, 1
	GOTO       L_SetUp14
	DECFSZ     R12, 1
	GOTO       L_SetUp14
	NOP
;arm.c,137 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_SetPosition:

;arm.c,139 :: 		void SetPosition(unsigned char id, int position)
;arm.c,143 :: 		cmd   = 0x80 | id;
	MOVLW      128
	IORWF       FARG_SetPosition_id+0, 0
	MOVWF      R3
	MOVF       R3, 0
	MOVWF      SetPosition_cmd_L0+0
;arm.c,144 :: 		pos_h = (unsigned char)((position >> 7) & 0x7F);
	MOVLW      7
	MOVWF      R2
	MOVF       FARG_SetPosition_position+0, 0
	MOVWF      R0
	MOVF       FARG_SetPosition_position+1, 0
	MOVWF      R1
	MOVF       R2, 0
L__SetPosition41:
	BTFSC      STATUS+0, 2
	GOTO       L__SetPosition42
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__SetPosition41
L__SetPosition42:
	MOVLW      127
	ANDWF      R0, 0
	MOVWF      SetPosition_pos_h_L0+0
;arm.c,145 :: 		pos_l = (unsigned char)(position & 0x7F);
	MOVLW      127
	ANDWF      FARG_SetPosition_position+0, 0
	MOVWF      SetPosition_pos_l_L0+0
;arm.c,147 :: 		TXSTA.TX9D = ParityCheck(cmd);
	MOVF       R3, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition43
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition44
L__SetPosition43:
	BSF        TXSTA+0, 0
L__SetPosition44:
;arm.c,148 :: 		UART1_Write(cmd);
	MOVF       SetPosition_cmd_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm.c,149 :: 		TXSTA.TX9D = ParityCheck(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition45
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition46
L__SetPosition45:
	BSF        TXSTA+0, 0
L__SetPosition46:
;arm.c,150 :: 		UART1_Write(pos_h);
	MOVF       SetPosition_pos_h_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm.c,151 :: 		TXSTA.TX9D = ParityCheck(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_ParityCheck+0
	CALL       _ParityCheck+0
	BTFSC      R0, 0
	GOTO       L__SetPosition47
	BCF        TXSTA+0, 0
	GOTO       L__SetPosition48
L__SetPosition47:
	BSF        TXSTA+0, 0
L__SetPosition48:
;arm.c,152 :: 		UART1_Write(pos_l);
	MOVF       SetPosition_pos_l_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;arm.c,154 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13
L_SetPosition15:
	DECFSZ     R13, 1
	GOTO       L_SetPosition15
	NOP
;arm.c,155 :: 		}
L_end_SetPosition:
	RETURN
; end of _SetPosition

_ParityCheck:

;arm.c,157 :: 		char ParityCheck(unsigned char _data)
;arm.c,159 :: 		return ((_data & 0b10000000) >> 7) ^
	MOVLW      128
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R1
	MOVLW      7
	MOVWF      R0
	MOVF       R1, 0
	MOVWF      R3
	MOVF       R0, 0
L__ParityCheck50:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck51
	LSRF       R3, 1
	ADDLW      255
	GOTO       L__ParityCheck50
L__ParityCheck51:
;arm.c,160 :: 		((_data & 0b01000000) >> 6) ^
	MOVLW      64
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck52:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck53
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck52
L__ParityCheck53:
	MOVF       R0, 0
	XORWF      R3, 1
;arm.c,161 :: 		((_data & 0b00100000) >> 5) ^
	MOVLW      32
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVLW      5
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__ParityCheck54:
	BTFSC      STATUS+0, 2
	GOTO       L__ParityCheck55
	LSRF       R0, 1
	ADDLW      255
	GOTO       L__ParityCheck54
L__ParityCheck55:
	MOVF       R0, 0
	XORWF      R3, 1
;arm.c,162 :: 		((_data & 0b00010000) >> 4) ^
	MOVLW      16
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm.c,163 :: 		((_data & 0b00001000) >> 3) ^
	MOVLW      8
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm.c,164 :: 		((_data & 0b00000100) >> 2) ^
	MOVLW      4
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 1
;arm.c,165 :: 		((_data & 0b00000010) >> 1) ^
	MOVLW      2
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSRF       R0, 1
	MOVF       R0, 0
	XORWF      R3, 0
	MOVWF      R1
;arm.c,166 :: 		(_data & 0b00000001);
	MOVLW      1
	ANDWF      FARG_ParityCheck__data+0, 0
	MOVWF      R0
	MOVF       R1, 0
	XORWF      R0, 1
;arm.c,167 :: 		}
L_end_ParityCheck:
	RETURN
; end of _ParityCheck

_Debug:

;arm.c,169 :: 		void Debug(double roll, double pitch)
;arm.c,173 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,174 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,175 :: 		Soft_UART_Write((roll >= 0.0) ? '+' : '-');
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
;arm.c,176 :: 		tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
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
;arm.c,177 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;arm.c,178 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;arm.c,179 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,180 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;arm.c,181 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,183 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,184 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,185 :: 		Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
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
;arm.c,186 :: 		tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
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
;arm.c,187 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;arm.c,188 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;arm.c,189 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,190 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;arm.c,191 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,192 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_AcceleCheck:

;arm.c,194 :: 		void AcceleCheck(double accele_x, double accele_y, double accele_z)
;arm.c,198 :: 		tmp = (int)accele_x;
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
;arm.c,199 :: 		Soft_UART_Write('X');
	MOVLW      88
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,200 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,201 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;arm.c,202 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;arm.c,203 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;arm.c,204 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;arm.c,205 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,207 :: 		tmp = (int)accele_y;
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
;arm.c,208 :: 		Soft_UART_Write('Y');
	MOVLW      89
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,209 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,210 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;arm.c,211 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;arm.c,212 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;arm.c,213 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;arm.c,214 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,216 :: 		tmp = (int)accele_z;
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
;arm.c,217 :: 		Soft_UART_Write('Z');
	MOVLW      90
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,218 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,219 :: 		Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
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
;arm.c,220 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
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
;arm.c,221 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
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
;arm.c,222 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;arm.c,223 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;arm.c,224 :: 		}
L_end_AcceleCheck:
	RETURN
; end of _AcceleCheck

_Dec2Ascii:

;arm.c,226 :: 		char Dec2Ascii(char dec)
;arm.c,228 :: 		switch(dec){
	GOTO       L_Dec2Ascii24
;arm.c,229 :: 		case 0:  return '0';
L_Dec2Ascii26:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,230 :: 		case 1:  return '1';
L_Dec2Ascii27:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,231 :: 		case 2:  return '2';
L_Dec2Ascii28:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,232 :: 		case 3:  return '3';
L_Dec2Ascii29:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,233 :: 		case 4:  return '4';
L_Dec2Ascii30:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,234 :: 		case 5:  return '5';
L_Dec2Ascii31:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,235 :: 		case 6:  return '6';
L_Dec2Ascii32:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,236 :: 		case 7:  return '7';
L_Dec2Ascii33:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,237 :: 		case 8:  return '8';
L_Dec2Ascii34:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,238 :: 		case 9:  return '9';
L_Dec2Ascii35:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,239 :: 		default: return '*';
L_Dec2Ascii36:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;arm.c,240 :: 		}
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
;arm.c,241 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
