
_main:

;angle.c,228 :: 		void main()
;angle.c,239 :: 		accele_z = jyro_x = jyro_y = angle_x = angle_y = old_angle_x = new_angle_x = old_angle_y = new_angle_y = 0.0;
	CLRF       main_new_angle_y_L0+0
	CLRF       main_new_angle_y_L0+1
	CLRF       main_new_angle_y_L0+2
	CLRF       main_new_angle_y_L0+3
	CLRF       main_old_angle_y_L0+0
	CLRF       main_old_angle_y_L0+1
	CLRF       main_old_angle_y_L0+2
	CLRF       main_old_angle_y_L0+3
	CLRF       main_new_angle_x_L0+0
	CLRF       main_new_angle_x_L0+1
	CLRF       main_new_angle_x_L0+2
	CLRF       main_new_angle_x_L0+3
	CLRF       main_old_angle_x_L0+0
	CLRF       main_old_angle_x_L0+1
	CLRF       main_old_angle_x_L0+2
	CLRF       main_old_angle_x_L0+3
	CLRF       main_angle_y_L0+0
	CLRF       main_angle_y_L0+1
	CLRF       main_angle_y_L0+2
	CLRF       main_angle_y_L0+3
	CLRF       main_angle_x_L0+0
	CLRF       main_angle_x_L0+1
	CLRF       main_angle_x_L0+2
	CLRF       main_angle_x_L0+3
	CLRF       main_jyro_y_L0+0
	CLRF       main_jyro_y_L0+1
	CLRF       main_jyro_y_L0+2
	CLRF       main_jyro_y_L0+3
	CLRF       main_jyro_x_L0+0
	CLRF       main_jyro_x_L0+1
	CLRF       main_jyro_x_L0+2
	CLRF       main_jyro_x_L0+3
	CLRF       main_accele_z_L0+0
	CLRF       main_accele_z_L0+1
	CLRF       main_accele_z_L0+2
	CLRF       main_accele_z_L0+3
	CLRF       main_accele_y_L0+0
	CLRF       main_accele_y_L0+1
	CLRF       main_accele_y_L0+2
	CLRF       main_accele_y_L0+3
	CLRF       main_accele_x_L0+0
	CLRF       main_accele_x_L0+1
	CLRF       main_accele_x_L0+2
	CLRF       main_accele_x_L0+3
	CLRF       main_jyro_y_bias_L0+0
	CLRF       main_jyro_y_bias_L0+1
	CLRF       main_jyro_y_bias_L0+2
	CLRF       main_jyro_y_bias_L0+3
	CLRF       main_jyro_x_bias_L0+0
	CLRF       main_jyro_x_bias_L0+1
	CLRF       main_jyro_x_bias_L0+2
	CLRF       main_jyro_x_bias_L0+3
	CLRF       main_accele_y_bias_L0+0
	CLRF       main_accele_y_bias_L0+1
	CLRF       main_accele_y_bias_L0+2
	CLRF       main_accele_y_bias_L0+3
	CLRF       main_accele_x_bias_L0+0
	CLRF       main_accele_x_bias_L0+1
	CLRF       main_accele_x_bias_L0+2
	CLRF       main_accele_x_bias_L0+3
;angle.c,241 :: 		Setup();
	CALL       _Setup+0
;angle.c,243 :: 		sin(accele_x);
	MOVF       main_accele_x_L0+0, 0
	MOVWF      FARG_sin_f+0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      FARG_sin_f+1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      FARG_sin_f+2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      FARG_sin_f+3
	CALL       _sin+0
;angle.c,245 :: 		for(i = 0; i < 10; i ++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main0:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main64:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;angle.c,246 :: 		accele_x_bias += ADC_read(ANAROG_PIN_ACCELE_X);
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
;angle.c,247 :: 		accele_y_bias += ADC_read(ANAROG_PIN_ACCELE_Y);
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
;angle.c,248 :: 		jyro_x_bias += ADC_read(ANAROG_PIN_JYRO_X);
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
;angle.c,249 :: 		jyro_y_bias += ADC_read(ANAROG_PIN_JYRO_Y);
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
;angle.c,245 :: 		for(i = 0; i < 10; i ++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle.c,250 :: 		}
	GOTO       L_main0
L_main1:
;angle.c,252 :: 		accele_x_bias = accele_x_bias / 10.0;
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
;angle.c,253 :: 		accele_y_bias = accele_y_bias / 10.0;
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
;angle.c,254 :: 		jyro_x_bias = jyro_x_bias / 10.0;
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
;angle.c,255 :: 		jyro_y_bias = jyro_y_bias / 10.0;
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
;angle.c,257 :: 		while(1){
L_main3:
;angle.c,258 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle.c,259 :: 		old_angle_x = new_angle_x;
	MOVF       main_new_angle_x_L0+0, 0
	MOVWF      main_old_angle_x_L0+0
	MOVF       main_new_angle_x_L0+1, 0
	MOVWF      main_old_angle_x_L0+1
	MOVF       main_new_angle_x_L0+2, 0
	MOVWF      main_old_angle_x_L0+2
	MOVF       main_new_angle_x_L0+3, 0
	MOVWF      main_old_angle_x_L0+3
;angle.c,260 :: 		old_angle_y = new_angle_y;
	MOVF       main_new_angle_y_L0+0, 0
	MOVWF      main_old_angle_y_L0+0
	MOVF       main_new_angle_y_L0+1, 0
	MOVWF      main_old_angle_y_L0+1
	MOVF       main_new_angle_y_L0+2, 0
	MOVWF      main_old_angle_y_L0+2
	MOVF       main_new_angle_y_L0+3, 0
	MOVWF      main_old_angle_y_L0+3
;angle.c,262 :: 		accele_x = accele_y = accele_z = jyro_x = jyro_y = 0.0;
	CLRF       main_jyro_y_L0+0
	CLRF       main_jyro_y_L0+1
	CLRF       main_jyro_y_L0+2
	CLRF       main_jyro_y_L0+3
	CLRF       main_jyro_x_L0+0
	CLRF       main_jyro_x_L0+1
	CLRF       main_jyro_x_L0+2
	CLRF       main_jyro_x_L0+3
	CLRF       main_accele_z_L0+0
	CLRF       main_accele_z_L0+1
	CLRF       main_accele_z_L0+2
	CLRF       main_accele_z_L0+3
	CLRF       main_accele_y_L0+0
	CLRF       main_accele_y_L0+1
	CLRF       main_accele_y_L0+2
	CLRF       main_accele_y_L0+3
	CLRF       main_accele_x_L0+0
	CLRF       main_accele_x_L0+1
	CLRF       main_accele_x_L0+2
	CLRF       main_accele_x_L0+3
;angle.c,264 :: 		accele_x = ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias;
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
;angle.c,265 :: 		accele_y = ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias;
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
;angle.c,266 :: 		accele_z = ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS;
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
;angle.c,267 :: 		jyro_x = ADC_read(ANAROG_PIN_JYRO_X) - jyro_x_bias;
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
;angle.c,268 :: 		jyro_y = ADC_read(ANAROG_PIN_JYRO_Y) - jyro_y_bias;
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
;angle.c,270 :: 		angle_x = (accele_x >= 0.0) ? Angle_Via_ArcTan_3(accele_x, accele_y, accele_z)
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       main_accele_x_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       main_accele_x_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_y_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	CALL       _Angle_Via_ArcTan_3+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
;angle.c,271 :: 		: -Angle_Via_ArcTan_3(accele_x, accele_y, accele_z);
	GOTO       L_main6
L_main5:
	MOVF       main_accele_x_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_y_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	CALL       _Angle_Via_ArcTan_3+0
	MOVLW      0
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
L_main6:
	MOVF       FLOC__main+0, 0
	MOVWF      main_angle_x_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_angle_x_L0+1
	MOVF       FLOC__main+2, 0
	MOVWF      main_angle_x_L0+2
	MOVF       FLOC__main+3, 0
	MOVWF      main_angle_x_L0+3
;angle.c,272 :: 		angle_y = (accele_y >= 0.0) ? Angle_Via_ArcTan_3(accele_y, accele_x, accele_z)
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       main_accele_y_L0+0, 0
	MOVWF      R0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      R1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      R2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       main_accele_y_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_x_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	CALL       _Angle_Via_ArcTan_3+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
;angle.c,273 :: 		: -Angle_Via_ArcTan_3(accele_y, accele_x, accele_z);
	GOTO       L_main8
L_main7:
	MOVF       main_accele_y_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_y_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_y_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_y_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_x_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_x_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_x_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_x_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	MOVF       main_accele_z_L0+0, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+0
	MOVF       main_accele_z_L0+1, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+1
	MOVF       main_accele_z_L0+2, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+2
	MOVF       main_accele_z_L0+3, 0
	MOVWF      FARG_Angle_Via_ArcTan_3+3
	CALL       _Angle_Via_ArcTan_3+0
	MOVLW      0
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
L_main8:
	MOVF       FLOC__main+0, 0
	MOVWF      main_angle_y_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_angle_y_L0+1
	MOVF       FLOC__main+2, 0
	MOVWF      main_angle_y_L0+2
	MOVF       FLOC__main+3, 0
	MOVWF      main_angle_y_L0+3
;angle.c,275 :: 		jyro_x = jyro_x * JYRO_COEFFICIENT;
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
;angle.c,276 :: 		jyro_y = jyro_y * JYRO_COEFFICIENT;
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
;angle.c,278 :: 		if(angle_x >= 20.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       main_angle_x_L0+0, 0
	MOVWF      R0
	MOVF       main_angle_x_L0+1, 0
	MOVWF      R1
	MOVF       main_angle_x_L0+2, 0
	MOVWF      R2
	MOVF       main_angle_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;angle.c,279 :: 		angle_x = 20.0;
	MOVLW      0
	MOVWF      main_angle_x_L0+0
	MOVLW      0
	MOVWF      main_angle_x_L0+1
	MOVLW      32
	MOVWF      main_angle_x_L0+2
	MOVLW      131
	MOVWF      main_angle_x_L0+3
	GOTO       L_main10
L_main9:
;angle.c,280 :: 		else if(angle_x <= -20.0)
	MOVF       main_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_x_L0+3, 0
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
	GOTO       L_main11
;angle.c,281 :: 		angle_x = -20.0;
	MOVLW      0
	MOVWF      main_angle_x_L0+0
	MOVLW      0
	MOVWF      main_angle_x_L0+1
	MOVLW      160
	MOVWF      main_angle_x_L0+2
	MOVLW      131
	MOVWF      main_angle_x_L0+3
L_main11:
L_main10:
;angle.c,282 :: 		if(angle_y >= 20.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       main_angle_y_L0+0, 0
	MOVWF      R0
	MOVF       main_angle_y_L0+1, 0
	MOVWF      R1
	MOVF       main_angle_y_L0+2, 0
	MOVWF      R2
	MOVF       main_angle_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;angle.c,283 :: 		angle_y = 20.0;
	MOVLW      0
	MOVWF      main_angle_y_L0+0
	MOVLW      0
	MOVWF      main_angle_y_L0+1
	MOVLW      32
	MOVWF      main_angle_y_L0+2
	MOVLW      131
	MOVWF      main_angle_y_L0+3
	GOTO       L_main13
L_main12:
;angle.c,284 :: 		else if(angle_y <= -20.0)
	MOVF       main_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       main_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       main_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       main_angle_y_L0+3, 0
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
	GOTO       L_main14
;angle.c,285 :: 		angle_y = -20.0;
	MOVLW      0
	MOVWF      main_angle_y_L0+0
	MOVLW      0
	MOVWF      main_angle_y_L0+1
	MOVLW      160
	MOVWF      main_angle_y_L0+2
	MOVLW      131
	MOVWF      main_angle_y_L0+3
L_main14:
L_main13:
;angle.c,287 :: 		if((-1.0 <= jyro_x) && (jyro_x <= 1.0) && (-0.5 <= new_angle_x) && (new_angle_x <= 0.5))
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       main_jyro_x_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_x_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_x_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_x_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      0
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	MOVF       main_new_angle_x_L0+0, 0
	MOVWF      R0
	MOVF       main_new_angle_x_L0+1, 0
	MOVWF      R1
	MOVF       main_new_angle_x_L0+2, 0
	MOVWF      R2
	MOVF       main_new_angle_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_new_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       main_new_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       main_new_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       main_new_angle_x_L0+3, 0
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
	GOTO       L_main17
L__main60:
;angle.c,288 :: 		new_angle_x = 0.0;
	CLRF       main_new_angle_x_L0+0
	CLRF       main_new_angle_x_L0+1
	CLRF       main_new_angle_x_L0+2
	CLRF       main_new_angle_x_L0+3
	GOTO       L_main18
L_main17:
;angle.c,290 :: 		new_angle_x = old_angle_x - (W * old_angle_x * TIME) + (W * angle_x * TIME) + (W * jyro_x * TIME);
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_old_angle_x_L0+0, 0
	MOVWF      R4
	MOVF       main_old_angle_x_L0+1, 0
	MOVWF      R5
	MOVF       main_old_angle_x_L0+2, 0
	MOVWF      R6
	MOVF       main_old_angle_x_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       main_old_angle_x_L0+0, 0
	MOVWF      R0
	MOVF       main_old_angle_x_L0+1, 0
	MOVWF      R1
	MOVF       main_old_angle_x_L0+2, 0
	MOVWF      R2
	MOVF       main_old_angle_x_L0+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+4
	MOVF       R1, 0
	MOVWF      FLOC__main+5
	MOVF       R2, 0
	MOVWF      FLOC__main+6
	MOVF       R3, 0
	MOVWF      FLOC__main+7
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
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
	MOVWF      FLOC__main+4
	MOVF       R1, 0
	MOVWF      FLOC__main+5
	MOVF       R2, 0
	MOVWF      FLOC__main+6
	MOVF       R3, 0
	MOVWF      FLOC__main+7
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_jyro_x_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_x_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_x_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_x_L0+3, 0
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
	MOVWF      main_new_angle_x_L0+0
	MOVF       R1, 0
	MOVWF      main_new_angle_x_L0+1
	MOVF       R2, 0
	MOVWF      main_new_angle_x_L0+2
	MOVF       R3, 0
	MOVWF      main_new_angle_x_L0+3
L_main18:
;angle.c,291 :: 		if((-1.0 <= jyro_y) && (jyro_y <= 1.0) && (-0.5 <= new_angle_y) && (new_angle_y <= 0.5))
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	MOVF       main_jyro_y_L0+0, 0
	MOVWF      R0
	MOVF       main_jyro_y_L0+1, 0
	MOVWF      R1
	MOVF       main_jyro_y_L0+2, 0
	MOVWF      R2
	MOVF       main_jyro_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_y_L0+3, 0
	MOVWF      R7
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      0
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	MOVF       main_new_angle_y_L0+0, 0
	MOVWF      R0
	MOVF       main_new_angle_y_L0+1, 0
	MOVWF      R1
	MOVF       main_new_angle_y_L0+2, 0
	MOVWF      R2
	MOVF       main_new_angle_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       main_new_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       main_new_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       main_new_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       main_new_angle_y_L0+3, 0
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
	GOTO       L_main21
L__main59:
;angle.c,292 :: 		new_angle_y = 0.0;
	CLRF       main_new_angle_y_L0+0
	CLRF       main_new_angle_y_L0+1
	CLRF       main_new_angle_y_L0+2
	CLRF       main_new_angle_y_L0+3
	GOTO       L_main22
L_main21:
;angle.c,294 :: 		new_angle_y = old_angle_y - (W * old_angle_y * TIME) + (W * angle_y * TIME) + (W * jyro_y * TIME);
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_old_angle_y_L0+0, 0
	MOVWF      R4
	MOVF       main_old_angle_y_L0+1, 0
	MOVWF      R5
	MOVF       main_old_angle_y_L0+2, 0
	MOVWF      R6
	MOVF       main_old_angle_y_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       main_old_angle_y_L0+0, 0
	MOVWF      R0
	MOVF       main_old_angle_y_L0+1, 0
	MOVWF      R1
	MOVF       main_old_angle_y_L0+2, 0
	MOVWF      R2
	MOVF       main_old_angle_y_L0+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__main+4
	MOVF       R1, 0
	MOVWF      FLOC__main+5
	MOVF       R2, 0
	MOVWF      FLOC__main+6
	MOVF       R3, 0
	MOVWF      FLOC__main+7
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
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
	MOVWF      FLOC__main+4
	MOVF       R1, 0
	MOVWF      FLOC__main+5
	MOVF       R2, 0
	MOVWF      FLOC__main+6
	MOVF       R3, 0
	MOVWF      FLOC__main+7
	MOVLW      219
	MOVWF      R0
	MOVLW      15
	MOVWF      R1
	MOVLW      73
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	MOVF       main_jyro_y_L0+0, 0
	MOVWF      R4
	MOVF       main_jyro_y_L0+1, 0
	MOVWF      R5
	MOVF       main_jyro_y_L0+2, 0
	MOVWF      R6
	MOVF       main_jyro_y_L0+3, 0
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
	MOVWF      main_new_angle_y_L0+0
	MOVF       R1, 0
	MOVWF      main_new_angle_y_L0+1
	MOVF       R2, 0
	MOVWF      main_new_angle_y_L0+2
	MOVF       R3, 0
	MOVWF      main_new_angle_y_L0+3
L_main22:
;angle.c,296 :: 		Output(new_angle_x, new_angle_y);
	MOVF       main_new_angle_x_L0+0, 0
	MOVWF      FARG_Output+0
	MOVF       main_new_angle_x_L0+1, 0
	MOVWF      FARG_Output+1
	MOVF       main_new_angle_x_L0+2, 0
	MOVWF      FARG_Output+2
	MOVF       main_new_angle_x_L0+3, 0
	MOVWF      FARG_Output+3
	MOVF       main_new_angle_y_L0+0, 0
	MOVWF      FARG_Output+0
	MOVF       main_new_angle_y_L0+1, 0
	MOVWF      FARG_Output+1
	MOVF       main_new_angle_y_L0+2, 0
	MOVWF      FARG_Output+2
	MOVF       main_new_angle_y_L0+3, 0
	MOVWF      FARG_Output+3
	CALL       _Output+0
;angle.c,297 :: 		}
	GOTO       L_main3
;angle.c,298 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Setup:

;angle.c,300 :: 		void Setup()
;angle.c,302 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle.c,304 :: 		OPTION_REG = 0x07;
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle.c,306 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle.c,307 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle.c,308 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle.c,309 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle.c,310 :: 		TRISA = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle.c,311 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;angle.c,312 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;angle.c,313 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;angle.c,314 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;angle.c,316 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;angle.c,317 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;angle.c,318 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;angle.c,319 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;angle.c,320 :: 		PORTE = 0x00;
	CLRF       PORTE+0
;angle.c,322 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle.c,324 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle.c,326 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_Setup23:
	DECFSZ     R13, 1
	GOTO       L_Setup23
	DECFSZ     R12, 1
	GOTO       L_Setup23
	DECFSZ     R11, 1
	GOTO       L_Setup23
	NOP
;angle.c,327 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_Output:

;angle.c,329 :: 		void Output(double a, double b)
;angle.c,333 :: 		UART_write((a >= 0.0) ? '+' : '-');
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
	GOTO       L_Output24
	MOVLW      43
	MOVWF      R0
	GOTO       L_Output25
L_Output24:
	MOVLW      45
	MOVWF      R0
L_Output25:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,334 :: 		tmp = (a >= 0.0) ? a * 10.0 : -a * 10.0;
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
	GOTO       L_Output26
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
	GOTO       L_Output27
L_Output26:
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
L_Output27:
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
;angle.c,335 :: 		UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle.c,336 :: 		UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
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
;angle.c,337 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,338 :: 		UART_write(Dec2Ascii(tmp % 10));
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
;angle.c,339 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,341 :: 		UART_write((b >= 0.0) ? '+' : '-');
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
	GOTO       L_Output28
	MOVLW      43
	MOVWF      R0
	GOTO       L_Output29
L_Output28:
	MOVLW      45
	MOVWF      R0
L_Output29:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,342 :: 		tmp = (b >= 0.0) ? b * 10.0 : -b * 10.0;
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
	GOTO       L_Output30
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
	GOTO       L_Output31
L_Output30:
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
L_Output31:
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
;angle.c,343 :: 		UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle.c,344 :: 		UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
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
;angle.c,345 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,346 :: 		UART_write(Dec2Ascii(tmp % 10));
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
;angle.c,347 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle.c,348 :: 		}
L_end_Output:
	RETURN
; end of _Output

_Dec2Ascii:

;angle.c,350 :: 		char Dec2Ascii(char dec)
;angle.c,352 :: 		switch(dec){
	GOTO       L_Dec2Ascii32
;angle.c,353 :: 		case 0: return '0';
L_Dec2Ascii34:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,354 :: 		case 1: return '1';
L_Dec2Ascii35:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,355 :: 		case 2: return '2';
L_Dec2Ascii36:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,356 :: 		case 3: return '3';
L_Dec2Ascii37:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,357 :: 		case 4: return '4';
L_Dec2Ascii38:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,358 :: 		case 5: return '5';
L_Dec2Ascii39:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,359 :: 		case 6: return '6';
L_Dec2Ascii40:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,360 :: 		case 7: return '7';
L_Dec2Ascii41:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,361 :: 		case 8: return '8';
L_Dec2Ascii42:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,362 :: 		case 9: return '9';
L_Dec2Ascii43:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,363 :: 		default: return '*';
L_Dec2Ascii44:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle.c,364 :: 		}
L_Dec2Ascii32:
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii34
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii35
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii36
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii37
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii38
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii39
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii40
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii41
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii42
	MOVF       FARG_Dec2Ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Dec2Ascii43
	GOTO       L_Dec2Ascii44
;angle.c,365 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii

_Angle_Via_ArcTan_3:

;angle.c,367 :: 		double Angle_Via_ArcTan_3(double a, double b, double c)
;angle.c,369 :: 		int left = 0, right = 200, median = 100;
	CLRF       Angle_Via_ArcTan_3_left_L0+0
	CLRF       Angle_Via_ArcTan_3_left_L0+1
	MOVLW      200
	MOVWF      Angle_Via_ArcTan_3_right_L0+0
	MOVLW      0
	MOVWF      Angle_Via_ArcTan_3_right_L0+1
	MOVLW      100
	MOVWF      Angle_Via_ArcTan_3_median_L0+0
	MOVLW      0
	MOVWF      Angle_Via_ArcTan_3_median_L0+1
;angle.c,372 :: 		a = (a >= 0) ? a : -a;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_Angle_Via_ArcTan_3_a+0, 0
	MOVWF      R0
	MOVF       FARG_Angle_Via_ArcTan_3_a+1, 0
	MOVWF      R1
	MOVF       FARG_Angle_Via_ArcTan_3_a+2, 0
	MOVWF      R2
	MOVF       FARG_Angle_Via_ArcTan_3_a+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_345
	MOVF       FARG_Angle_Via_ArcTan_3_a+0, 0
	MOVWF      R4
	MOVF       FARG_Angle_Via_ArcTan_3_a+1, 0
	MOVWF      R5
	MOVF       FARG_Angle_Via_ArcTan_3_a+2, 0
	MOVWF      R6
	MOVF       FARG_Angle_Via_ArcTan_3_a+3, 0
	MOVWF      R7
	GOTO       L_Angle_Via_ArcTan_346
L_Angle_Via_ArcTan_345:
	MOVLW      0
	XORWF      FARG_Angle_Via_ArcTan_3_a+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_Angle_Via_ArcTan_3_a+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_Angle_Via_ArcTan_3_a+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_Angle_Via_ArcTan_3_a+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_Angle_Via_ArcTan_346:
	MOVF       R4, 0
	MOVWF      FARG_Angle_Via_ArcTan_3_a+0
	MOVF       R5, 0
	MOVWF      FARG_Angle_Via_ArcTan_3_a+1
	MOVF       R6, 0
	MOVWF      FARG_Angle_Via_ArcTan_3_a+2
	MOVF       R7, 0
	MOVWF      FARG_Angle_Via_ArcTan_3_a+3
;angle.c,374 :: 		tmp = a / sqrt(b * b + c * c);
	MOVF       FARG_Angle_Via_ArcTan_3_b+0, 0
	MOVWF      R0
	MOVF       FARG_Angle_Via_ArcTan_3_b+1, 0
	MOVWF      R1
	MOVF       FARG_Angle_Via_ArcTan_3_b+2, 0
	MOVWF      R2
	MOVF       FARG_Angle_Via_ArcTan_3_b+3, 0
	MOVWF      R3
	MOVF       FARG_Angle_Via_ArcTan_3_b+0, 0
	MOVWF      R4
	MOVF       FARG_Angle_Via_ArcTan_3_b+1, 0
	MOVWF      R5
	MOVF       FARG_Angle_Via_ArcTan_3_b+2, 0
	MOVWF      R6
	MOVF       FARG_Angle_Via_ArcTan_3_b+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Angle_Via_ArcTan_3+0
	MOVF       R1, 0
	MOVWF      FLOC__Angle_Via_ArcTan_3+1
	MOVF       R2, 0
	MOVWF      FLOC__Angle_Via_ArcTan_3+2
	MOVF       R3, 0
	MOVWF      FLOC__Angle_Via_ArcTan_3+3
	MOVF       FARG_Angle_Via_ArcTan_3_c+0, 0
	MOVWF      R0
	MOVF       FARG_Angle_Via_ArcTan_3_c+1, 0
	MOVWF      R1
	MOVF       FARG_Angle_Via_ArcTan_3_c+2, 0
	MOVWF      R2
	MOVF       FARG_Angle_Via_ArcTan_3_c+3, 0
	MOVWF      R3
	MOVF       FARG_Angle_Via_ArcTan_3_c+0, 0
	MOVWF      R4
	MOVF       FARG_Angle_Via_ArcTan_3_c+1, 0
	MOVWF      R5
	MOVF       FARG_Angle_Via_ArcTan_3_c+2, 0
	MOVWF      R6
	MOVF       FARG_Angle_Via_ArcTan_3_c+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Angle_Via_ArcTan_3+0, 0
	MOVWF      R4
	MOVF       FLOC__Angle_Via_ArcTan_3+1, 0
	MOVWF      R5
	MOVF       FLOC__Angle_Via_ArcTan_3+2, 0
	MOVWF      R6
	MOVF       FLOC__Angle_Via_ArcTan_3+3, 0
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
	MOVF       FARG_Angle_Via_ArcTan_3_a+0, 0
	MOVWF      R0
	MOVF       FARG_Angle_Via_ArcTan_3_a+1, 0
	MOVWF      R1
	MOVF       FARG_Angle_Via_ArcTan_3_a+2, 0
	MOVWF      R2
	MOVF       FARG_Angle_Via_ArcTan_3_a+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Angle_Via_ArcTan_3_tmp_L0+0
	MOVF       R1, 0
	MOVWF      Angle_Via_ArcTan_3_tmp_L0+1
	MOVF       R2, 0
	MOVWF      Angle_Via_ArcTan_3_tmp_L0+2
	MOVF       R3, 0
	MOVWF      Angle_Via_ArcTan_3_tmp_L0+3
;angle.c,377 :: 		while(left < right){
L_Angle_Via_ArcTan_347:
	MOVLW      128
	XORWF      Angle_Via_ArcTan_3_left_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      Angle_Via_ArcTan_3_right_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Angle_Via_ArcTan_369
	MOVF       Angle_Via_ArcTan_3_right_L0+0, 0
	SUBWF      Angle_Via_ArcTan_3_left_L0+0, 0
L__Angle_Via_ArcTan_369:
	BTFSC      STATUS+0, 0
	GOTO       L_Angle_Via_ArcTan_348
;angle.c,378 :: 		if(-0.001 <= (TAN_LIST[median] - tmp) && (TAN_LIST[median] - tmp) <= 0.001)
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TAN_LIST+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_TAN_LIST+0)
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
	MOVF       Angle_Via_ArcTan_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       Angle_Via_ArcTan_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       Angle_Via_ArcTan_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       Angle_Via_ArcTan_3_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      111
	MOVWF      R4
	MOVLW      18
	MOVWF      R5
	MOVLW      131
	MOVWF      R6
	MOVLW      117
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_351
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TAN_LIST+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_TAN_LIST+0)
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
	MOVF       Angle_Via_ArcTan_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       Angle_Via_ArcTan_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       Angle_Via_ArcTan_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       Angle_Via_ArcTan_3_tmp_L0+3, 0
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
	MOVLW      117
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_351
L__Angle_Via_ArcTan_362:
;angle.c,379 :: 		return (double) median / 10.0;
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	GOTO       L_end_Angle_Via_ArcTan_3
L_Angle_Via_ArcTan_351:
;angle.c,380 :: 		else if(TAN_LIST[median] < tmp)
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TAN_LIST+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_TAN_LIST+0)
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
	MOVF       Angle_Via_ArcTan_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       Angle_Via_ArcTan_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       Angle_Via_ArcTan_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       Angle_Via_ArcTan_3_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_353
;angle.c,381 :: 		left = median + 1;
	MOVLW      1
	ADDWF      Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      Angle_Via_ArcTan_3_left_L0+0
	MOVLW      0
	ADDWFC     Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      Angle_Via_ArcTan_3_left_L0+1
	GOTO       L_Angle_Via_ArcTan_354
L_Angle_Via_ArcTan_353:
;angle.c,383 :: 		right = median - 1;
	MOVLW      1
	SUBWF      Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      Angle_Via_ArcTan_3_right_L0+0
	MOVLW      0
	SUBWFB     Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      Angle_Via_ArcTan_3_right_L0+1
L_Angle_Via_ArcTan_354:
;angle.c,385 :: 		median = (left + right) / 2;
	MOVF       Angle_Via_ArcTan_3_right_L0+0, 0
	ADDWF      Angle_Via_ArcTan_3_left_L0+0, 0
	MOVWF      Angle_Via_ArcTan_3_median_L0+0
	MOVF       Angle_Via_ArcTan_3_right_L0+1, 0
	ADDWFC     Angle_Via_ArcTan_3_left_L0+1, 0
	MOVWF      Angle_Via_ArcTan_3_median_L0+1
	ASRF       Angle_Via_ArcTan_3_median_L0+1, 1
	RRF        Angle_Via_ArcTan_3_median_L0+0, 1
;angle.c,386 :: 		}
	GOTO       L_Angle_Via_ArcTan_347
L_Angle_Via_ArcTan_348:
;angle.c,388 :: 		if(-0.001 <= (TAN_LIST[median] - tmp) && (TAN_LIST[median] - tmp) <= 0.001)
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TAN_LIST+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_TAN_LIST+0)
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
	MOVF       Angle_Via_ArcTan_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       Angle_Via_ArcTan_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       Angle_Via_ArcTan_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       Angle_Via_ArcTan_3_tmp_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVLW      111
	MOVWF      R4
	MOVLW      18
	MOVWF      R5
	MOVLW      131
	MOVWF      R6
	MOVLW      117
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_357
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _TAN_LIST+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_TAN_LIST+0)
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
	MOVF       Angle_Via_ArcTan_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       Angle_Via_ArcTan_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       Angle_Via_ArcTan_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       Angle_Via_ArcTan_3_tmp_L0+3, 0
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
	MOVLW      117
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Angle_Via_ArcTan_357
L__Angle_Via_ArcTan_361:
;angle.c,389 :: 		return (double) median / 10.0;
	MOVF       Angle_Via_ArcTan_3_median_L0+0, 0
	MOVWF      R0
	MOVF       Angle_Via_ArcTan_3_median_L0+1, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	GOTO       L_end_Angle_Via_ArcTan_3
L_Angle_Via_ArcTan_357:
;angle.c,391 :: 		return 99.9;
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      71
	MOVWF      R2
	MOVLW      133
	MOVWF      R3
;angle.c,392 :: 		}
L_end_Angle_Via_ArcTan_3:
	RETURN
; end of _Angle_Via_ArcTan_3
