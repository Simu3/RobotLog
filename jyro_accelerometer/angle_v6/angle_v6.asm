
_Main:

;angle_v6.c,34 :: 		void Main()
;angle_v6.c,36 :: 		double accele_x_bias   = 0.0, accele_y_bias   = 0.0;
	MOVLW      ?ICSMain_accele_x_bias_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSMain_accele_x_bias_L0+0)
	MOVWF      FSR0H
	MOVLW      Main_accele_x_bias_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(Main_accele_x_bias_L0+0)
	MOVWF      FSR1H
	MOVLW      60
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_v6.c,45 :: 		Setup();
	CALL       _Setup+0
;angle_v6.c,47 :: 		Set_Bias(&accele_x_bias, &accele_y_bias, &jyro_x_bias, &jyro_y_bias);
	MOVLW      Main_accele_x_bias_L0+0
	MOVWF      FARG_Set_Bias+0
	MOVLW      hi_addr(Main_accele_x_bias_L0+0)
	MOVWF      FARG_Set_Bias+1
	MOVLW      Main_accele_y_bias_L0+0
	MOVWF      FARG_Set_Bias+0
	MOVLW      hi_addr(Main_accele_y_bias_L0+0)
	MOVWF      FARG_Set_Bias+1
	MOVLW      Main_jyro_x_bias_L0+0
	MOVWF      FARG_Set_Bias+0
	MOVLW      hi_addr(Main_jyro_x_bias_L0+0)
	MOVWF      FARG_Set_Bias+1
	MOVLW      Main_jyro_y_bias_L0+0
	MOVWF      FARG_Set_Bias+0
	MOVLW      hi_addr(Main_jyro_y_bias_L0+0)
	MOVWF      FARG_Set_Bias+1
	CALL       _Set_Bias+0
;angle_v6.c,49 :: 		while(1){
L_Main0:
;angle_v6.c,50 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle_v6.c,52 :: 		accele_x = ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias;
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
	MOVF       R0, 0
	MOVWF      Main_accele_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_x_L0+3
;angle_v6.c,53 :: 		accele_y = ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias;
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
	MOVF       R0, 0
	MOVWF      Main_accele_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_y_L0+3
;angle_v6.c,54 :: 		accele_z = ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS;
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      192
	MOVWF      R5
	MOVLW      24
	MOVWF      R6
	MOVLW      136
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_accele_z_L0+0
	MOVF       R1, 0
	MOVWF      Main_accele_z_L0+1
	MOVF       R2, 0
	MOVWF      Main_accele_z_L0+2
	MOVF       R3, 0
	MOVWF      Main_accele_z_L0+3
;angle_v6.c,55 :: 		jyro_x   = ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias;
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
	MOVF       R0, 0
	MOVWF      Main_jyro_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_x_L0+3
;angle_v6.c,56 :: 		jyro_y   = ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias;
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
	MOVF       R0, 0
	MOVWF      Main_jyro_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_jyro_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_jyro_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_jyro_y_L0+3
;angle_v6.c,58 :: 		static_angle_x = Static_Angle(accele_x, accele_y, accele_z);                //ê√ìIäpìxÇÃéZèo
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
	MOVWF      Main_static_angle_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_static_angle_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_static_angle_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_static_angle_x_L0+3
;angle_v6.c,59 :: 		static_angle_y = Static_Angle(accele_y, accele_x, accele_z);
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
	MOVWF      Main_static_angle_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_static_angle_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_static_angle_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_static_angle_y_L0+3
;angle_v6.c,61 :: 		dynamic_angle_x = Dynamic_Angle(jyro_x);                                    //ìÆìIäpìxÇÃéZèo
	MOVF       Main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_x_L0+3, 0
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
	MOVWF      Main_dynamic_angle_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_dynamic_angle_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_dynamic_angle_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_dynamic_angle_x_L0+3
;angle_v6.c,62 :: 		dynamic_angle_y = Dynamic_Angle(jyro_y);
	MOVF       Main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_jyro_y_L0+3, 0
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
	MOVWF      Main_dynamic_angle_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_dynamic_angle_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_dynamic_angle_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_dynamic_angle_y_L0+3
;angle_v6.c,64 :: 		angle_x = Composition_Of_Angle(angle_x, static_angle_x, dynamic_angle_x);   //äpìxÇÃçáê¨
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       Main_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_angle_x_L0+3, 0
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
	MOVF       Main_angle_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_angle_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_angle_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_angle_x_L0+3, 0
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
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       Main_static_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_static_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_static_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_static_angle_x_L0+3, 0
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
	MOVF       Main_dynamic_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_dynamic_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_dynamic_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_dynamic_angle_x_L0+3, 0
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
	MOVWF      Main_angle_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_angle_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_angle_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_angle_x_L0+3
;angle_v6.c,65 :: 		angle_y = Composition_Of_Angle(angle_y, static_angle_y, dynamic_angle_y);
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       Main_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_angle_y_L0+3, 0
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
	MOVF       Main_angle_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_angle_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_angle_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_angle_y_L0+3, 0
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
	MOVLW      59
	MOVWF      R0
	MOVLW      70
	MOVWF      R1
	MOVLW      113
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       Main_static_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_static_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_static_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_static_angle_y_L0+3, 0
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
	MOVF       Main_dynamic_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_dynamic_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_dynamic_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_dynamic_angle_y_L0+3, 0
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
	MOVWF      Main_angle_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_angle_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_angle_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_angle_y_L0+3
;angle_v6.c,70 :: 		Output(-angle_x * 0.8, -angle_y * 0.8, static_angle_x, static_angle_y);
	MOVLW      0
	XORWF      Main_angle_x_L0+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      Main_angle_x_L0+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      Main_angle_x_L0+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      Main_angle_x_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_Output+0
	MOVF       R1, 0
	MOVWF      FARG_Output+1
	MOVF       R2, 0
	MOVWF      FARG_Output+2
	MOVF       R3, 0
	MOVWF      FARG_Output+3
	MOVLW      0
	XORWF      Main_angle_y_L0+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      Main_angle_y_L0+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      Main_angle_y_L0+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      Main_angle_y_L0+3, 0
	MOVWF      R3
	MOVLW      205
	MOVWF      R4
	MOVLW      204
	MOVWF      R5
	MOVLW      76
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_Output+0
	MOVF       R1, 0
	MOVWF      FARG_Output+1
	MOVF       R2, 0
	MOVWF      FARG_Output+2
	MOVF       R3, 0
	MOVWF      FARG_Output+3
	MOVF       Main_static_angle_x_L0+0, 0
	MOVWF      FARG_Output+0
	MOVF       Main_static_angle_x_L0+1, 0
	MOVWF      FARG_Output+1
	MOVF       Main_static_angle_x_L0+2, 0
	MOVWF      FARG_Output+2
	MOVF       Main_static_angle_x_L0+3, 0
	MOVWF      FARG_Output+3
	MOVF       Main_static_angle_y_L0+0, 0
	MOVWF      FARG_Output+0
	MOVF       Main_static_angle_y_L0+1, 0
	MOVWF      FARG_Output+1
	MOVF       Main_static_angle_y_L0+2, 0
	MOVWF      FARG_Output+2
	MOVF       Main_static_angle_y_L0+3, 0
	MOVWF      FARG_Output+3
	CALL       _Output+0
;angle_v6.c,73 :: 		}
	GOTO       L_Main0
;angle_v6.c,74 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;angle_v6.c,76 :: 		void Setup()
;angle_v6.c,78 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v6.c,80 :: 		OPTION_REG = 0x07;  //É^ÉCÉ}Å[0ê›íË
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_v6.c,82 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v6.c,83 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_v6.c,84 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_v6.c,85 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_v6.c,87 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v6.c,88 :: 		TRISB  = 0x00;
	CLRF       TRISB+0
;angle_v6.c,89 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_v6.c,90 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_v6.c,91 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_v6.c,93 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_v6.c,94 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_v6.c,95 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_v6.c,96 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_v6.c,97 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_v6.c,99 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v6.c,101 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v6.c,105 :: 		Soft_UART_Init(&PORTB, 6, 4, 9600, 0);
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
;angle_v6.c,108 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_Setup2:
	DECFSZ     R13, 1
	GOTO       L_Setup2
	DECFSZ     R12, 1
	GOTO       L_Setup2
	DECFSZ     R11, 1
	GOTO       L_Setup2
	NOP
;angle_v6.c,109 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Set_bias:

;angle_v6.c,111 :: 		void Set_bias(double *accele_x_bias, double *accele_y_bias, double *jyro_x_bias, double *jyro_y_bias)
;angle_v6.c,115 :: 		for(i = 0; i < 100; i ++){
	CLRF       Set_bias_i_L0+0
	CLRF       Set_bias_i_L0+1
L_Set_bias3:
	MOVLW      128
	XORWF      Set_bias_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Set_bias74
	MOVLW      100
	SUBWF      Set_bias_i_L0+0, 0
L__Set_bias74:
	BTFSC      STATUS+0, 0
	GOTO       L_Set_bias4
;angle_v6.c,116 :: 		*accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FARG_Set_bias_accele_x_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_accele_x_bias+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Set_bias_accele_x_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_accele_x_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,117 :: 		*accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FARG_Set_bias_accele_y_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_accele_y_bias+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Set_bias_accele_y_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_accele_y_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,118 :: 		*jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FARG_Set_bias_jyro_x_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_jyro_x_bias+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Set_bias_jyro_x_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_jyro_x_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,119 :: 		*jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FARG_Set_bias_jyro_y_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_jyro_y_bias+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Set_bias_jyro_y_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_jyro_y_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,115 :: 		for(i = 0; i < 100; i ++){
	INCF       Set_bias_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Set_bias_i_L0+1, 1
;angle_v6.c,120 :: 		}
	GOTO       L_Set_bias3
L_Set_bias4:
;angle_v6.c,122 :: 		*accele_x_bias /= 100.0;
	MOVF       FARG_Set_bias_accele_x_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_accele_x_bias+1, 0
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FARG_Set_bias_accele_x_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_accele_x_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,123 :: 		*accele_y_bias /= 100.0;
	MOVF       FARG_Set_bias_accele_y_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_accele_y_bias+1, 0
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FARG_Set_bias_accele_y_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_accele_y_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,124 :: 		*jyro_x_bias   /= 100.0;
	MOVF       FARG_Set_bias_jyro_x_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_jyro_x_bias+1, 0
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FARG_Set_bias_jyro_x_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_jyro_x_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,125 :: 		*jyro_y_bias   /= 100.0;
	MOVF       FARG_Set_bias_jyro_y_bias+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Set_bias_jyro_y_bias+1, 0
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FARG_Set_bias_jyro_y_bias+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Set_bias_jyro_y_bias+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,126 :: 		}
L_end_Set_bias:
	RETURN
; end of _Set_bias

_Rotate_Converter:

;angle_v6.c,128 :: 		void Rotate_Converter(double angle_x, double angle_y, double *right_rotate, double *left_rotate)
;angle_v6.c,130 :: 		*right_rotate  = (angle_x >= 0.0) ?  angle_x * 0.5 : -angle_x * 0.5;  //âEë§Ç…åXÇ¢ÇΩÇÁè„Ç…ìÆÇ©Ç∑
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Rotate_Converter6
	MOVF       FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_x+3, 0
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
	MOVWF      FLOC__Rotate_Converter+0
	MOVF       R1, 0
	MOVWF      FLOC__Rotate_Converter+1
	MOVF       R2, 0
	MOVWF      FLOC__Rotate_Converter+2
	MOVF       R3, 0
	MOVWF      FLOC__Rotate_Converter+3
	GOTO       L_Rotate_Converter7
L_Rotate_Converter6:
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+3, 0
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
	MOVWF      FLOC__Rotate_Converter+0
	MOVF       R1, 0
	MOVWF      FLOC__Rotate_Converter+1
	MOVF       R2, 0
	MOVWF      FLOC__Rotate_Converter+2
	MOVF       R3, 0
	MOVWF      FLOC__Rotate_Converter+3
L_Rotate_Converter7:
	MOVF       FARG_Rotate_Converter_right_rotate+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Rotate_Converter_right_rotate+1, 0
	MOVWF      FSR1H
	MOVF       FLOC__Rotate_Converter+0, 0
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,131 :: 		*right_rotate += (angle_y >= 0.0) ? -angle_y :  angle_y;  //ëOï˚Ç…åXÇ¢ÇΩÇÁâ∫Ç…ìÆÇ©Ç∑
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Rotate_Converter8
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
	GOTO       L_Rotate_Converter9
L_Rotate_Converter8:
	MOVF       FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
L_Rotate_Converter9:
	MOVF       FARG_Rotate_Converter_right_rotate+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Rotate_Converter_right_rotate+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Rotate_Converter_right_rotate+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Rotate_Converter_right_rotate+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,132 :: 		*left_rotate   = (angle_x >= 0.0) ? -angle_x * 0.5 :  angle_x * 0.5;  //âEë§Ç…åXÇ¢ÇΩÇÁâ∫Ç…ìÆÇ©Ç∑
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Rotate_Converter10
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_x+3, 0
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
	MOVWF      FLOC__Rotate_Converter+0
	MOVF       R1, 0
	MOVWF      FLOC__Rotate_Converter+1
	MOVF       R2, 0
	MOVWF      FLOC__Rotate_Converter+2
	MOVF       R3, 0
	MOVWF      FLOC__Rotate_Converter+3
	GOTO       L_Rotate_Converter11
L_Rotate_Converter10:
	MOVF       FARG_Rotate_Converter_angle_x+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_x+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_x+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_x+3, 0
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
	MOVWF      FLOC__Rotate_Converter+0
	MOVF       R1, 0
	MOVWF      FLOC__Rotate_Converter+1
	MOVF       R2, 0
	MOVWF      FLOC__Rotate_Converter+2
	MOVF       R3, 0
	MOVWF      FLOC__Rotate_Converter+3
L_Rotate_Converter11:
	MOVF       FARG_Rotate_Converter_left_rotate+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Rotate_Converter_left_rotate+1, 0
	MOVWF      FSR1H
	MOVF       FLOC__Rotate_Converter+0, 0
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       FLOC__Rotate_Converter+3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,133 :: 		*left_rotate  += (angle_y >= 0.0) ? -angle_y :  angle_y;  //ëOï˚Ç…åXÇ¢ÇΩÇÁâ∫Ç…ìÆÇ©Ç∑
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Rotate_Converter12
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
	GOTO       L_Rotate_Converter13
L_Rotate_Converter12:
	MOVF       FARG_Rotate_Converter_angle_y+0, 0
	MOVWF      R0
	MOVF       FARG_Rotate_Converter_angle_y+1, 0
	MOVWF      R1
	MOVF       FARG_Rotate_Converter_angle_y+2, 0
	MOVWF      R2
	MOVF       FARG_Rotate_Converter_angle_y+3, 0
	MOVWF      R3
L_Rotate_Converter13:
	MOVF       FARG_Rotate_Converter_left_rotate+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Rotate_Converter_left_rotate+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R4
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R5
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R6
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       FARG_Rotate_Converter_left_rotate+0, 0
	MOVWF      FSR1L
	MOVF       FARG_Rotate_Converter_left_rotate+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       R3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_v6.c,134 :: 		}
L_end_Rotate_Converter:
	RETURN
; end of _Rotate_Converter

_Output:

;angle_v6.c,136 :: 		void Output(double data1, double data2, double data3, double data4)
;angle_v6.c,138 :: 		double angle_x = 0.0, angle_y = 0.0;
	CLRF       Output_angle_x_L0+0
	CLRF       Output_angle_x_L0+1
	CLRF       Output_angle_x_L0+2
	CLRF       Output_angle_x_L0+3
	CLRF       Output_angle_y_L0+0
	CLRF       Output_angle_y_L0+1
	CLRF       Output_angle_y_L0+2
	CLRF       Output_angle_y_L0+3
;angle_v6.c,140 :: 		angle_x = data1;
	MOVF       FARG_Output_data1+0, 0
	MOVWF      Output_angle_x_L0+0
	MOVF       FARG_Output_data1+1, 0
	MOVWF      Output_angle_x_L0+1
	MOVF       FARG_Output_data1+2, 0
	MOVWF      Output_angle_x_L0+2
	MOVF       FARG_Output_data1+3, 0
	MOVWF      Output_angle_x_L0+3
;angle_v6.c,141 :: 		angle_y = data2;
	MOVF       FARG_Output_data2+0, 0
	MOVWF      Output_angle_y_L0+0
	MOVF       FARG_Output_data2+1, 0
	MOVWF      Output_angle_y_L0+1
	MOVF       FARG_Output_data2+2, 0
	MOVWF      Output_angle_y_L0+2
	MOVF       FARG_Output_data2+3, 0
	MOVWF      Output_angle_y_L0+3
;angle_v6.c,143 :: 		if(DEAD_ANGLE_AREA_MIN < data3 && data3 < DEAD_ANGLE_AREA_MAX)
	MOVF       FARG_Output_data3+0, 0
	MOVWF      R4
	MOVF       FARG_Output_data3+1, 0
	MOVWF      R5
	MOVF       FARG_Output_data3+2, 0
	MOVWF      R6
	MOVF       FARG_Output_data3+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      128
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output16
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_Output_data3+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data3+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data3+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data3+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output16
L__Output68:
;angle_v6.c,144 :: 		angle_x = 0.0;
	CLRF       Output_angle_x_L0+0
	CLRF       Output_angle_x_L0+1
	CLRF       Output_angle_x_L0+2
	CLRF       Output_angle_x_L0+3
L_Output16:
;angle_v6.c,145 :: 		if(DEAD_ANGLE_AREA_MIN < data4 && data4 < DEAD_ANGLE_AREA_MAX)
	MOVF       FARG_Output_data4+0, 0
	MOVWF      R4
	MOVF       FARG_Output_data4+1, 0
	MOVWF      R5
	MOVF       FARG_Output_data4+2, 0
	MOVWF      R6
	MOVF       FARG_Output_data4+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      128
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output19
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_Output_data4+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data4+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data4+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data4+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output19
L__Output67:
;angle_v6.c,146 :: 		angle_y = 0.0;
	CLRF       Output_angle_y_L0+0
	CLRF       Output_angle_y_L0+1
	CLRF       Output_angle_y_L0+2
	CLRF       Output_angle_y_L0+3
L_Output19:
;angle_v6.c,148 :: 		if(data1 >= ANGLE_X_MAX)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       FARG_Output_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output20
;angle_v6.c,149 :: 		angle_x = ANGLE_X_MAX;
	MOVLW      0
	MOVWF      Output_angle_x_L0+0
	MOVLW      0
	MOVWF      Output_angle_x_L0+1
	MOVLW      32
	MOVWF      Output_angle_x_L0+2
	MOVLW      131
	MOVWF      Output_angle_x_L0+3
	GOTO       L_Output21
L_Output20:
;angle_v6.c,150 :: 		else if(data1 <= ANGLE_X_MIN)
	MOVF       FARG_Output_data1+0, 0
	MOVWF      R4
	MOVF       FARG_Output_data1+1, 0
	MOVWF      R5
	MOVF       FARG_Output_data1+2, 0
	MOVWF      R6
	MOVF       FARG_Output_data1+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      160
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output22
;angle_v6.c,151 :: 		angle_x = ANGLE_X_MIN;
	MOVLW      0
	MOVWF      Output_angle_x_L0+0
	MOVLW      0
	MOVWF      Output_angle_x_L0+1
	MOVLW      160
	MOVWF      Output_angle_x_L0+2
	MOVLW      131
	MOVWF      Output_angle_x_L0+3
L_Output22:
L_Output21:
;angle_v6.c,152 :: 		if(data2 >= ANGLE_Y_MAX)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       FARG_Output_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output23
;angle_v6.c,153 :: 		angle_y = ANGLE_Y_MAX;
	MOVLW      0
	MOVWF      Output_angle_y_L0+0
	MOVLW      0
	MOVWF      Output_angle_y_L0+1
	MOVLW      32
	MOVWF      Output_angle_y_L0+2
	MOVLW      131
	MOVWF      Output_angle_y_L0+3
	GOTO       L_Output24
L_Output23:
;angle_v6.c,154 :: 		else if(data2 <= ANGLE_Y_MIN)
	MOVF       FARG_Output_data2+0, 0
	MOVWF      R4
	MOVF       FARG_Output_data2+1, 0
	MOVWF      R5
	MOVF       FARG_Output_data2+2, 0
	MOVWF      R6
	MOVF       FARG_Output_data2+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      160
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output25
;angle_v6.c,155 :: 		angle_y = ANGLE_Y_MIN;
	MOVLW      0
	MOVWF      Output_angle_y_L0+0
	MOVLW      0
	MOVWF      Output_angle_y_L0+1
	MOVLW      160
	MOVWF      Output_angle_y_L0+2
	MOVLW      131
	MOVWF      Output_angle_y_L0+3
L_Output25:
L_Output24:
;angle_v6.c,157 :: 		data1 = angle_x;
	MOVF       Output_angle_x_L0+0, 0
	MOVWF      FARG_Output_data1+0
	MOVF       Output_angle_x_L0+1, 0
	MOVWF      FARG_Output_data1+1
	MOVF       Output_angle_x_L0+2, 0
	MOVWF      FARG_Output_data1+2
	MOVF       Output_angle_x_L0+3, 0
	MOVWF      FARG_Output_data1+3
;angle_v6.c,158 :: 		data2 = angle_y;
	MOVF       Output_angle_y_L0+0, 0
	MOVWF      FARG_Output_data2+0
	MOVF       Output_angle_y_L0+1, 0
	MOVWF      FARG_Output_data2+1
	MOVF       Output_angle_y_L0+2, 0
	MOVWF      FARG_Output_data2+2
	MOVF       Output_angle_y_L0+3, 0
	MOVWF      FARG_Output_data2+3
;angle_v6.c,161 :: 		UART1_Write(0);
	CLRF       FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v6.c,162 :: 		UART1_Write((data1 >= 0.0) ? 0 : 1);                             //+ : 0 - : 1
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output26
	CLRF       R0
	GOTO       L_Output27
L_Output26:
	MOVLW      1
	MOVWF      R0
L_Output27:
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v6.c,163 :: 		UART1_Write((data1 >= 0.0) ? (data1 * 10.0) : (-data1 * 10.0));  //âÒì]äpÉfÅ[É^
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output28
	MOVF       FARG_Output_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data1+3, 0
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
	GOTO       L_Output29
L_Output28:
	MOVLW      0
	XORWF      FARG_Output_data1+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Output_data1+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Output_data1+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Output_data1+3, 0
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
L_Output29:
	MOVF       FLOC__Output+0, 0
	MOVWF      R0
	MOVF       FLOC__Output+1, 0
	MOVWF      R1
	MOVF       FLOC__Output+2, 0
	MOVWF      R2
	MOVF       FLOC__Output+3, 0
	MOVWF      R3
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;angle_v6.c,165 :: 		Soft_UART_Write(0);
	CLRF       FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,166 :: 		Soft_UART_Write((data2 >= 0.0) ? 0 : 1);
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output30
	CLRF       R0
	GOTO       L_Output31
L_Output30:
	MOVLW      1
	MOVWF      R0
L_Output31:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,167 :: 		Soft_UART_Write((data2 >= 0.0) ? (data2 * 10.0) : (-data2 * 10.0));
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Output_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Output32
	MOVF       FARG_Output_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Output_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Output_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Output_data2+3, 0
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
	GOTO       L_Output33
L_Output32:
	MOVLW      0
	XORWF      FARG_Output_data2+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Output_data2+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Output_data2+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Output_data2+3, 0
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
L_Output33:
	MOVF       FLOC__Output+0, 0
	MOVWF      R0
	MOVF       FLOC__Output+1, 0
	MOVWF      R1
	MOVF       FLOC__Output+2, 0
	MOVWF      R2
	MOVF       FLOC__Output+3, 0
	MOVWF      R3
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,168 :: 		}
L_end_Output:
	RETURN
; end of _Output

_Debug:

;angle_v6.c,170 :: 		void Debug(double data1, double data2, double data3, double data4)
;angle_v6.c,174 :: 		if(DEAD_ANGLE_AREA_MIN < data3 && data3 < DEAD_ANGLE_AREA_MAX)
	MOVF       FARG_Debug_data3+0, 0
	MOVWF      R4
	MOVF       FARG_Debug_data3+1, 0
	MOVWF      R5
	MOVF       FARG_Debug_data3+2, 0
	MOVWF      R6
	MOVF       FARG_Debug_data3+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      128
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug36
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_Debug_data3+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data3+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data3+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data3+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug36
L__Debug70:
;angle_v6.c,175 :: 		data1 = 0.0;
	CLRF       FARG_Debug_data1+0
	CLRF       FARG_Debug_data1+1
	CLRF       FARG_Debug_data1+2
	CLRF       FARG_Debug_data1+3
L_Debug36:
;angle_v6.c,176 :: 		if(DEAD_ANGLE_AREA_MIN < data4 && data4 < DEAD_ANGLE_AREA_MAX)
	MOVF       FARG_Debug_data4+0, 0
	MOVWF      R4
	MOVF       FARG_Debug_data4+1, 0
	MOVWF      R5
	MOVF       FARG_Debug_data4+2, 0
	MOVWF      R6
	MOVF       FARG_Debug_data4+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      128
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug39
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       FARG_Debug_data4+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data4+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data4+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data4+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug39
L__Debug69:
;angle_v6.c,177 :: 		data2 = 0.0;
	CLRF       FARG_Debug_data2+0
	CLRF       FARG_Debug_data2+1
	CLRF       FARG_Debug_data2+2
	CLRF       FARG_Debug_data2+3
L_Debug39:
;angle_v6.c,179 :: 		if(data1 >= ANGLE_X_MAX)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       FARG_Debug_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug40
;angle_v6.c,180 :: 		data1 = ANGLE_X_MAX;
	MOVLW      0
	MOVWF      FARG_Debug_data1+0
	MOVLW      0
	MOVWF      FARG_Debug_data1+1
	MOVLW      32
	MOVWF      FARG_Debug_data1+2
	MOVLW      131
	MOVWF      FARG_Debug_data1+3
	GOTO       L_Debug41
L_Debug40:
;angle_v6.c,181 :: 		else if(data1 <= ANGLE_X_MIN)
	MOVF       FARG_Debug_data1+0, 0
	MOVWF      R4
	MOVF       FARG_Debug_data1+1, 0
	MOVWF      R5
	MOVF       FARG_Debug_data1+2, 0
	MOVWF      R6
	MOVF       FARG_Debug_data1+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      160
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug42
;angle_v6.c,182 :: 		data1 = ANGLE_X_MIN;
	MOVLW      0
	MOVWF      FARG_Debug_data1+0
	MOVLW      0
	MOVWF      FARG_Debug_data1+1
	MOVLW      160
	MOVWF      FARG_Debug_data1+2
	MOVLW      131
	MOVWF      FARG_Debug_data1+3
L_Debug42:
L_Debug41:
;angle_v6.c,183 :: 		if(data2 >= ANGLE_Y_MAX)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       FARG_Debug_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug43
;angle_v6.c,184 :: 		data2 = ANGLE_Y_MAX;
	MOVLW      0
	MOVWF      FARG_Debug_data2+0
	MOVLW      0
	MOVWF      FARG_Debug_data2+1
	MOVLW      32
	MOVWF      FARG_Debug_data2+2
	MOVLW      131
	MOVWF      FARG_Debug_data2+3
	GOTO       L_Debug44
L_Debug43:
;angle_v6.c,185 :: 		else if(data2 <= ANGLE_Y_MIN)
	MOVF       FARG_Debug_data2+0, 0
	MOVWF      R4
	MOVF       FARG_Debug_data2+1, 0
	MOVWF      R5
	MOVF       FARG_Debug_data2+2, 0
	MOVWF      R6
	MOVF       FARG_Debug_data2+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      160
	MOVWF      R2
	MOVLW      131
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug45
;angle_v6.c,186 :: 		data2 = ANGLE_Y_MIN;
	MOVLW      0
	MOVWF      FARG_Debug_data2+0
	MOVLW      0
	MOVWF      FARG_Debug_data2+1
	MOVLW      160
	MOVWF      FARG_Debug_data2+2
	MOVLW      131
	MOVWF      FARG_Debug_data2+3
L_Debug45:
L_Debug44:
;angle_v6.c,188 :: 		Soft_UART_Write((data1 >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug46
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug47
L_Debug46:
	MOVLW      45
	MOVWF      R0
L_Debug47:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,189 :: 		tmp = (data1 >= 0.0) ? data1 * 10.0 : -data1 * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data1+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug48
	MOVF       FARG_Debug_data1+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data1+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data1+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data1+3, 0
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
	GOTO       L_Debug49
L_Debug48:
	MOVLW      0
	XORWF      FARG_Debug_data1+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Debug_data1+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Debug_data1+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Debug_data1+3, 0
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
L_Debug49:
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
;angle_v6.c,190 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_v6.c,191 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
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
;angle_v6.c,192 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,193 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v6.c,194 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,196 :: 		Soft_UART_Write((data2 >= 0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug50
	MOVLW      43
	MOVWF      R0
	GOTO       L_Debug51
L_Debug50:
	MOVLW      45
	MOVWF      R0
L_Debug51:
	MOVF       R0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,197 :: 		tmp = (data2 >= 0.0) ? data2 * 10.0 : -data2 * 10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Debug_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data2+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Debug52
	MOVF       FARG_Debug_data2+0, 0
	MOVWF      R0
	MOVF       FARG_Debug_data2+1, 0
	MOVWF      R1
	MOVF       FARG_Debug_data2+2, 0
	MOVWF      R2
	MOVF       FARG_Debug_data2+3, 0
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
	GOTO       L_Debug53
L_Debug52:
	MOVLW      0
	XORWF      FARG_Debug_data2+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Debug_data2+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Debug_data2+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Debug_data2+3, 0
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
L_Debug53:
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
;angle_v6.c,198 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_v6.c,199 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
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
;angle_v6.c,200 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,201 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_v6.c,202 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_v6.c,203 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_Dec2Ascii:

;angle_v6.c,205 :: 		char Dec2Ascii(char dec)
;angle_v6.c,207 :: 		switch(dec){
	GOTO       L_Dec2Ascii54
;angle_v6.c,208 :: 		case 0:  return '0';
L_Dec2Ascii56:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,209 :: 		case 1:  return '1';
L_Dec2Ascii57:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,210 :: 		case 2:  return '2';
L_Dec2Ascii58:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,211 :: 		case 3:  return '3';
L_Dec2Ascii59:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,212 :: 		case 4:  return '4';
L_Dec2Ascii60:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,213 :: 		case 5:  return '5';
L_Dec2Ascii61:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,214 :: 		case 6:  return '6';
L_Dec2Ascii62:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,215 :: 		case 7:  return '7';
L_Dec2Ascii63:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,216 :: 		case 8:  return '8';
L_Dec2Ascii64:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,217 :: 		case 9:  return '9';
L_Dec2Ascii65:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,218 :: 		default: return '*';
L_Dec2Ascii66:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_v6.c,219 :: 		}
L_Dec2Ascii54:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii56
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii57
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii58
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii59
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii60
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii61
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii62
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii63
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii64
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii65
	GOTO       L_Dec2Ascii66
;angle_v6.c,220 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
