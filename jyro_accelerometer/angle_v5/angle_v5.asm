
_main:

;angle_v5.c,23 :: 		void main()
;angle_v5.c,25 :: 		int    i = 0;
	MOVLW      ?ICSmain_i_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSmain_i_L0+0)
	MOVWF      FSR0H
	MOVLW      main_i_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(main_i_L0+0)
	MOVWF      FSR1H
	MOVLW      54
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_v5.c,33 :: 		Setup();
	CALL       _Setup+0
;angle_v5.c,35 :: 		for(; i < 10; i ++){
L_main0:
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
	GOTO       L_main1
;angle_v5.c,36 :: 		accele_x_bias += ADC_read(ANAROG_PIN_ACCELE_X);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_accele_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_x_bias_L0+3
;angle_v5.c,37 :: 		accele_y_bias += ADC_read(ANAROG_PIN_ACCELE_Y);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_accele_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_y_bias_L0+3
;angle_v5.c,38 :: 		jyro_x_bias   += ADC_read(ANAROG_PIN_JYRO_X);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jyro_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_x_bias_L0+3
;angle_v5.c,39 :: 		jyro_y_bias   += ADC_read(ANAROG_PIN_JYRO_Y);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jyro_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_y_bias_L0+3
;angle_v5.c,35 :: 		for(; i < 10; i ++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v5.c,40 :: 		}
	GOTO       L_main0
L_main1:
;angle_v5.c,42 :: 		accele_x_bias /= 10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_accele_x_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_x_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_x_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_x_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_x_bias_L0+3
;angle_v5.c,43 :: 		accele_y_bias /= 10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_accele_y_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_y_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_y_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_y_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_y_bias_L0+3
;angle_v5.c,44 :: 		jyro_x_bias   /= 10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_jyro_x_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_x_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_x_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_x_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_x_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_x_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_x_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_x_bias_L0+3
;angle_v5.c,45 :: 		jyro_y_bias   /= 10.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_jyro_y_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_y_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_y_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_y_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_y_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_y_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_y_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_y_bias_L0+3
;angle_v5.c,47 :: 		while(1){
L_main3:
;angle_v5.c,48 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle_v5.c,50 :: 		accele_x = ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias;
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_accele_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_x_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_x_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_x_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_x_L0+3
;angle_v5.c,51 :: 		accele_y = ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_accele_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_accele_y_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_y_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_y_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_y_L0+3
;angle_v5.c,52 :: 		accele_z = ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS;
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      64
	SUBWF      R0, 1
	MOVLW      2
	SUBWFB     R1, 1
	CALL       _Word2Double+0
	MOVF       R0, 0
	MOVWF      main_accele_z_L0+0
	MOVF       R1, 0
	MOVWF      main_accele_z_L0+1
	MOVF       R2, 0
	MOVWF      main_accele_z_L0+2
	MOVF       R3, 0
	MOVWF      main_accele_z_L0+3
;angle_v5.c,53 :: 		jyro_x   = ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias;
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jyro_x_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_x_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_x_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_x_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_x_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_x_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_x_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_x_L0+3
;angle_v5.c,54 :: 		jyro_y   = ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias;
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jyro_y_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_y_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_y_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_y_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_y_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_y_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_y_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_y_L0+3
;angle_v5.c,56 :: 		angle_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 / PI);
	MOVF       main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      R3
	MOVF       main_accele_y_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_y_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_y_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_y_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      R3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_z_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_z_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_z_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
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
	MOVF       main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_x_L0+3, 0
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
	MOVWF      main_angle_x_L0+0
	MOVF       R1, 0
	MOVWF      main_angle_x_L0+1
	MOVF       R2, 0
	MOVWF      main_angle_x_L0+2
	MOVF       R3, 0
	MOVWF      main_angle_x_L0+3
;angle_v5.c,57 :: 		angle_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 / PI);
	MOVF       main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      R3
	MOVF       main_accele_x_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_x_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_x_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_x_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      R3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      R4
	MOVF       main_accele_z_L0+1, 0
	MOVWF      R5
	MOVF       main_accele_z_L0+2, 0
	MOVWF      R6
	MOVF       main_accele_z_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
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
	MOVF       main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_y_L0+3, 0
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
	MOVWF      main_angle_y_L0+0
	MOVF       R1, 0
	MOVWF      main_angle_y_L0+1
	MOVF       R2, 0
	MOVWF      main_angle_y_L0+2
	MOVF       R3, 0
	MOVWF      main_angle_y_L0+3
;angle_v5.c,59 :: 		jyro_x = jyro_x * JYRO_COEFFICIENT;
	MOVF       main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_x_L0+3, 0
	MOVWF      R3
	MOVLW      224
	MOVWF      R4
	MOVLW      191
	MOVWF      R5
	MOVLW      58
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_x_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_x_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_x_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_x_L0+3
;angle_v5.c,60 :: 		jyro_y = jyro_y * JYRO_COEFFICIENT;
	MOVF       main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_y_L0+3, 0
	MOVWF      R3
	MOVLW      224
	MOVWF      R4
	MOVLW      191
	MOVWF      R5
	MOVLW      58
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jyro_y_L0+0
	MOVF       R1, 0
	MOVWF      main_jyro_y_L0+1
	MOVF       R2, 0
	MOVWF      main_jyro_y_L0+2
	MOVF       R3, 0
	MOVWF      main_jyro_y_L0+3
;angle_v5.c,62 :: 		x += -(W * x * TIME) + (W * angle_x * TIME) + (jyro_x * TIME);
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_x_L0+0, 0
	MOVWF      R4
	MOVF       main_x_L0+1, 0
	MOVWF      R5
	MOVF       main_x_L0+2, 0
	MOVWF      R6
	MOVF       main_x_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	XORWF      R0, 0
	MOVWF      FLOC__main+4
	MOVLW      0
	XORWF      R1, 0
	MOVWF      FLOC__main+5
	MOVLW      128
	XORWF      R2, 0
	MOVWF      FLOC__main+6
	MOVLW      0
	XORWF      R3, 0
	MOVWF      FLOC__main+7
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_x_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+4, 0
	MOVWF      R4
	MOVF       FLOC__main+5, 0
	MOVWF      R5
	MOVF       FLOC__main+6, 0
	MOVWF      R6
	MOVF       FLOC__main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_x_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       main_x_L0+0, 0
	MOVWF      R4
	MOVF       main_x_L0+1, 0
	MOVWF      R5
	MOVF       main_x_L0+2, 0
	MOVWF      R6
	MOVF       main_x_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_x_L0+0
	MOVF       R1, 0
	MOVWF      main_x_L0+1
	MOVF       R2, 0
	MOVWF      main_x_L0+2
	MOVF       R3, 0
	MOVWF      main_x_L0+3
;angle_v5.c,63 :: 		y += -(W * y * TIME) + (W * angle_y * TIME) + (jyro_y * TIME);
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_y_L0+0, 0
	MOVWF      R4
	MOVF       main_y_L0+1, 0
	MOVWF      R5
	MOVF       main_y_L0+2, 0
	MOVWF      R6
	MOVF       main_y_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	XORWF      R0, 0
	MOVWF      FLOC__main+4
	MOVLW      0
	XORWF      R1, 0
	MOVWF      FLOC__main+5
	MOVLW      128
	XORWF      R2, 0
	MOVWF      FLOC__main+6
	MOVLW      0
	XORWF      R3, 0
	MOVWF      FLOC__main+7
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_y_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+4, 0
	MOVWF      R4
	MOVF       FLOC__main+5, 0
	MOVWF      R5
	MOVF       FLOC__main+6, 0
	MOVWF      R6
	MOVF       FLOC__main+7, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
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
	MOVF       main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_y_L0+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4
	MOVF       FLOC__main+1, 0
	MOVWF      R5
	MOVF       FLOC__main+2, 0
	MOVWF      R6
	MOVF       FLOC__main+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       main_y_L0+0, 0
	MOVWF      R4
	MOVF       main_y_L0+1, 0
	MOVWF      R5
	MOVF       main_y_L0+2, 0
	MOVWF      R6
	MOVF       main_y_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_y_L0+0
	MOVF       R1, 0
	MOVWF      main_y_L0+1
	MOVF       R2, 0
	MOVWF      main_y_L0+2
	MOVF       R3, 0
	MOVWF      main_y_L0+3
;angle_v5.c,65 :: 		Output(x, y);
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_Output+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_Output+1
	MOVF       main_x_L0+2, 0
	MOVWF      FARG_Output+2
	MOVF       main_x_L0+3, 0
	MOVWF      FARG_Output+3
	MOVF       R0, 0
	MOVWF      FARG_Output+0
	MOVF       R1, 0
	MOVWF      FARG_Output+1
	MOVF       R2, 0
	MOVWF      FARG_Output+2
	MOVF       R3, 0
	MOVWF      FARG_Output+3
	CALL       _Output+0
;angle_v5.c,66 :: 		}
	GOTO       L_main3
;angle_v5.c,67 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Setup:

;angle_v5.c,69 :: 		void Setup()
;angle_v5.c,71 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v5.c,73 :: 		OPTION_REG = 0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_v5.c,75 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v5.c,76 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_v5.c,77 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_v5.c,78 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_v5.c,79 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v5.c,80 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;angle_v5.c,81 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_v5.c,82 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_v5.c,83 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_v5.c,85 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_v5.c,86 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_v5.c,87 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_v5.c,88 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_v5.c,89 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_v5.c,91 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v5.c,93 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v5.c,95 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_Setup5:
	DECFSZ     R13, 1
	GOTO       L_Setup5
	DECFSZ     R12, 1
	GOTO       L_Setup5
	DECFSZ     R11, 1
	GOTO       L_Setup5
	NOP
;angle_v5.c,96 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Output:

;angle_v5.c,98 :: 		void Output(double a, double b)
;angle_v5.c,102 :: 		UART_write((a >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_a+0, 0
	MOVWF      R0
	MOVF       FARG_Output_a+1, 0
	MOVWF      R1
	MOVF       FARG_Output_a+2, 0
	MOVWF      R2
	MOVF       FARG_Output_a+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output6
	MOVLW      43
	MOVWF      R0
	GOTO       L_Output7
L_Output6:
	MOVLW      45
	MOVWF      R0
L_Output7:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,103 :: 		tmp = (a >= 0.0) ? a * 10.0 : -a * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_a+0, 0
	MOVWF      R0
	MOVF       FARG_Output_a+1, 0
	MOVWF      R1
	MOVF       FARG_Output_a+2, 0
	MOVWF      R2
	MOVF       FARG_Output_a+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output8
	MOVF       FARG_Output_a+0, 0
	MOVWF      R0
	MOVF       FARG_Output_a+1, 0
	MOVWF      R1
	MOVF       FARG_Output_a+2, 0
	MOVWF      R2
	MOVF       FARG_Output_a+3, 0
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVF       R2, 0
	MOVWF      FLOC__Output+2
	MOVF       R3, 0
	MOVWF      FLOC__Output+3
	GOTO       L_Output9
L_Output8:
	MOVLW      0
	XORWF      FARG_Output_a+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Output_a+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Output_a+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Output_a+3, 0
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVF       R2, 0
	MOVWF      FLOC__Output+2
	MOVF       R3, 0
	MOVWF      FLOC__Output+3
L_Output9:
	MOVF       FLOC__Output+0, 0
	MOVWF      R0
	MOVF       FLOC__Output+1, 0
	MOVWF      R1
	MOVF       FLOC__Output+2, 0
	MOVWF      R2
	MOVF       FLOC__Output+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      Output_tmp_L0+0
	MOVF       R1, 0
	MOVWF      Output_tmp_L0+1
;angle_v5.c,104 :: 		UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Output+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,105 :: 		UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Output+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,106 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,107 :: 		UART_write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,108 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,110 :: 		UART_write((b >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_b+0, 0
	MOVWF      R0
	MOVF       FARG_Output_b+1, 0
	MOVWF      R1
	MOVF       FARG_Output_b+2, 0
	MOVWF      R2
	MOVF       FARG_Output_b+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output10
	MOVLW      43
	MOVWF      R0
	GOTO       L_Output11
L_Output10:
	MOVLW      45
	MOVWF      R0
L_Output11:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,111 :: 		tmp = (b >= 0.0) ? b * 10.0 : -b * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_b+0, 0
	MOVWF      R0
	MOVF       FARG_Output_b+1, 0
	MOVWF      R1
	MOVF       FARG_Output_b+2, 0
	MOVWF      R2
	MOVF       FARG_Output_b+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output12
	MOVF       FARG_Output_b+0, 0
	MOVWF      R0
	MOVF       FARG_Output_b+1, 0
	MOVWF      R1
	MOVF       FARG_Output_b+2, 0
	MOVWF      R2
	MOVF       FARG_Output_b+3, 0
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVF       R2, 0
	MOVWF      FLOC__Output+2
	MOVF       R3, 0
	MOVWF      FLOC__Output+3
	GOTO       L_Output13
L_Output12:
	MOVLW      0
	XORWF      FARG_Output_b+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Output_b+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Output_b+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Output_b+3, 0
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVF       R2, 0
	MOVWF      FLOC__Output+2
	MOVF       R3, 0
	MOVWF      FLOC__Output+3
L_Output13:
	MOVF       FLOC__Output+0, 0
	MOVWF      R0
	MOVF       FLOC__Output+1, 0
	MOVWF      R1
	MOVF       FLOC__Output+2, 0
	MOVWF      R2
	MOVF       FLOC__Output+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      Output_tmp_L0+0
	MOVF       R1, 0
	MOVWF      Output_tmp_L0+1
;angle_v5.c,112 :: 		UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Output+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,113 :: 		UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__Output+0
	MOVF       R1, 0
	MOVWF      FLOC__Output+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__Output+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__Output+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,114 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,115 :: 		UART_write(Dec2Ascii(tmp % 10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       Output_tmp_L0+0, 0
	MOVWF      R0
	MOVF       Output_tmp_L0+1, 0
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
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,116 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v5.c,117 :: 		}
L_end_Output:
	RETURN
; end of _Output

_Dec2Ascii:

;angle_v5.c,119 :: 		char Dec2Ascii(char dec)
;angle_v5.c,121 :: 		switch(dec){
	GOTO       L_Dec2Ascii14
;angle_v5.c,122 :: 		case 0:  return '0';
L_Dec2Ascii16:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,123 :: 		case 1:  return '1';
L_Dec2Ascii17:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,124 :: 		case 2:  return '2';
L_Dec2Ascii18:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,125 :: 		case 3:  return '3';
L_Dec2Ascii19:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,126 :: 		case 4:  return '4';
L_Dec2Ascii20:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,127 :: 		case 5:  return '5';
L_Dec2Ascii21:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,128 :: 		case 6:  return '6';
L_Dec2Ascii22:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,129 :: 		case 7:  return '7';
L_Dec2Ascii23:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,130 :: 		case 8:  return '8';
L_Dec2Ascii24:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,131 :: 		case 9:  return '9';
L_Dec2Ascii25:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,132 :: 		default: return '*';
L_Dec2Ascii26:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v5.c,133 :: 		}
L_Dec2Ascii14:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii16
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii17
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii18
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii19
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii20
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii21
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii22
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii23
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii24
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii25
	GOTO       L_Dec2Ascii26
;angle_v5.c,134 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
