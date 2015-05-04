
_Main:

;angle_particle.c,18 :: 		void Main()
;angle_particle.c,20 :: 		double jyro_x_bias = 0.0, jyro_y_bias = 0.0;
	MOVLW      ?ICSMain_jyro_x_bias_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(?ICSMain_jyro_x_bias_L0+0)
	MOVWF      FSR0H
	MOVLW      Main_jyro_x_bias_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(Main_jyro_x_bias_L0+0)
	MOVWF      FSR1H
	MOVLW      38
	MOVWF      R0
	MOVLW      1
	MOVWF      R1
	CALL       ___CC2DW+0
;angle_particle.c,29 :: 		SetUp();
	CALL       _SetUp+0
;angle_particle.c,32 :: 		for(i = 0; i < 15; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main0:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main43
	MOVLW      15
	SUBWF      Main_i_L0+0, 0
L__Main43:
	BTFSC      STATUS+0, 0
	GOTO       L_Main1
;angle_particle.c,33 :: 		particle[i].theta_x   = 0.0;
	MOVLW      _particle+0
	MOVWF      FLOC__Main+4
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+5
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+4, 0
	MOVWF      FSR1L
	MOVF       R1, 0
	ADDWFC     FLOC__Main+5, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;angle_particle.c,34 :: 		particle[i].theta_y   = 0.0;
	MOVF       FLOC__Main+4, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+5, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;angle_particle.c,35 :: 		particle[i].ang_vel_x = 0.0;
	MOVF       FLOC__Main+4, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+5, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      8
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;angle_particle.c,36 :: 		particle[i].ang_vel_y = 0.0;
	MOVF       FLOC__Main+4, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+5, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      12
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;angle_particle.c,37 :: 		particle[i].weight    = 0.0;
	MOVF       FLOC__Main+4, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+5, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      16
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;angle_particle.c,32 :: 		for(i = 0; i < 15; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,38 :: 		}
	GOTO       L_Main0
L_Main1:
;angle_particle.c,40 :: 		for(i = 0; i < 100; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main3:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main44
	MOVLW      100
	SUBWF      Main_i_L0+0, 0
L__Main44:
	BTFSC      STATUS+0, 0
	GOTO       L_Main4
;angle_particle.c,41 :: 		jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
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
;angle_particle.c,42 :: 		jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
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
;angle_particle.c,40 :: 		for(i = 0; i < 100; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,43 :: 		}
	GOTO       L_Main3
L_Main4:
;angle_particle.c,45 :: 		jyro_x_bias   /= 100.0;
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
;angle_particle.c,46 :: 		jyro_y_bias   /= 100.0;
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
;angle_particle.c,48 :: 		while(1){
L_Main6:
;angle_particle.c,49 :: 		jyro_x = (ADC_read(ANAROG_PIN_JYRO_X) - jyro_x_bias) * JYRO_COEFFICIENT;
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
;angle_particle.c,50 :: 		jyro_y = (ADC_read(ANAROG_PIN_JYRO_Y) - jyro_y_bias) * JYRO_COEFFICIENT;
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
;angle_particle.c,52 :: 		ang_vel_x = jyro_x * dt;
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
	MOVF       R0, 0
	MOVWF      Main_ang_vel_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_ang_vel_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_ang_vel_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_ang_vel_x_L0+3
;angle_particle.c,53 :: 		ang_vel_y = jyro_y * dt;
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
	MOVF       R0, 0
	MOVWF      Main_ang_vel_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_ang_vel_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_ang_vel_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_ang_vel_y_L0+3
;angle_particle.c,55 :: 		theta_x = ang_vel_x * dt;
	MOVF       Main_ang_vel_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_ang_vel_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_ang_vel_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_ang_vel_x_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      Main_theta_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_x_L0+3
;angle_particle.c,56 :: 		theta_y = ang_vel_y * dt;
	MOVF       Main_ang_vel_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_ang_vel_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_ang_vel_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_ang_vel_y_L0+3, 0
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
	MOVF       R0, 0
	MOVWF      Main_theta_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_y_L0+3
;angle_particle.c,59 :: 		TMR0 = 0;
	CLRF       TMR0+0
;angle_particle.c,60 :: 		for(i = 0; i < 15; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main8:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main45
	MOVLW      15
	SUBWF      Main_i_L0+0, 0
L__Main45:
	BTFSC      STATUS+0, 0
	GOTO       L_Main9
;angle_particle.c,61 :: 		srand((double)TMR0);
	MOVF       TMR0+0, 0
	MOVWF      R0
	CALL       _Byte2Double+0
	CALL       _Double2Word+0
	MOVF       R0, 0
	MOVWF      FARG_srand_x+0
	MOVF       R1, 0
	MOVWF      FARG_srand_x+1
	CALL       _srand+0
;angle_particle.c,62 :: 		particle[i].theta_x = (theta_x + rand() % (int)pow(sigma, 2.0)) * particle[i].weight;
	MOVLW      _particle+0
	MOVWF      FLOC__Main+10
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+11
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+10, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+11, 0
	ADDWFC     R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__Main+8
	MOVF       R1, 0
	MOVWF      FLOC__Main+9
	CALL       _rand+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVLW      0
	MOVWF      FARG_pow_x+0
	MOVLW      0
	MOVWF      FARG_pow_x+1
	MOVLW      32
	MOVWF      FARG_pow_x+2
	MOVLW      130
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       FLOC__Main+0, 0
	MOVWF      R0
	MOVF       FLOC__Main+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_x_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      16
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+8, 0
	MOVWF      FSR1L
	MOVF       FLOC__Main+9, 0
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
;angle_particle.c,63 :: 		particle[i].theta_y = (theta_y + rand() % (int)pow(sigma, 2.0)) * particle[i].weight;
	MOVF       FLOC__Main+10, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+11, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FLOC__Main+8
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__Main+9
	CALL       _rand+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+0
	MOVF       R1, 0
	MOVWF      FLOC__Main+1
	MOVLW      0
	MOVWF      FARG_pow_x+0
	MOVLW      0
	MOVWF      FARG_pow_x+1
	MOVLW      32
	MOVWF      FARG_pow_x+2
	MOVLW      130
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       FLOC__Main+0, 0
	MOVWF      R0
	MOVF       FLOC__Main+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	CALL       _Int2Double+0
	MOVF       Main_theta_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_y_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      16
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+8, 0
	MOVWF      FSR1L
	MOVF       FLOC__Main+9, 0
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
;angle_particle.c,64 :: 		particle[i].ang_vel_x = ang_vel_x;
	MOVF       FLOC__Main+10, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+11, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      8
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       Main_ang_vel_x_L0+0, 0
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_x_L0+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_x_L0+2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_x_L0+3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_particle.c,65 :: 		particle[i].ang_vel_y = ang_vel_y;
	MOVF       FLOC__Main+10, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+11, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      12
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR1H
	MOVF       Main_ang_vel_y_L0+0, 0
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_y_L0+1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_y_L0+2, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       Main_ang_vel_y_L0+3, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_particle.c,60 :: 		for(i = 0; i < 15; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,66 :: 		}
	GOTO       L_Main8
L_Main9:
;angle_particle.c,69 :: 		for(i = 0; i < 15; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main11:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main46
	MOVLW      15
	SUBWF      Main_i_L0+0, 0
L__Main46:
	BTFSC      STATUS+0, 0
	GOTO       L_Main12
;angle_particle.c,70 :: 		particle[i].theta_x = particle[i].theta_x + particle[i].ang_vel_x * dt;
	MOVLW      _particle+0
	MOVWF      FLOC__Main+8
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+9
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+8, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+9, 0
	ADDWFC     R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+3
	MOVLW      8
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      FSR1L
	MOVF       FLOC__Main+5, 0
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
;angle_particle.c,71 :: 		particle[i].theta_y = particle[i].theta_y + particle[i].ang_vel_y * dt;
	MOVF       FLOC__Main+8, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+9, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+0, 0
	MOVWF      R2
	MOVF       R1, 0
	ADDWFC     FLOC__Main+1, 0
	MOVWF      R3
	MOVLW      4
	ADDWF      R2, 0
	MOVWF      FLOC__Main+4
	MOVLW      0
	ADDWFC     R3, 0
	MOVWF      FLOC__Main+5
	MOVF       FLOC__Main+8, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+9, 0
	ADDWFC     R1, 1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__Main+3
	MOVLW      12
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
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
	MOVF       FLOC__Main+4, 0
	MOVWF      FSR1L
	MOVF       FLOC__Main+5, 0
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
;angle_particle.c,72 :: 		particle[i].ang_vel_x = particle[i].ang_vel_x;
	MOVF       FLOC__Main+8, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+9, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+0, 0
	MOVWF      R2
	MOVF       R1, 0
	ADDWFC     FLOC__Main+1, 0
	MOVWF      R3
	MOVLW      8
	ADDWF      R2, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R3, 0
	MOVWF      FSR1H
	MOVF       FLOC__Main+8, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+9, 0
	ADDWFC     R1, 1
	MOVLW      8
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_particle.c,73 :: 		particle[i].ang_vel_y = particle[i].ang_vel_y;
	MOVF       FLOC__Main+8, 0
	MOVWF      FLOC__Main+0
	MOVF       FLOC__Main+9, 0
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+0, 0
	MOVWF      R2
	MOVF       R1, 0
	ADDWFC     FLOC__Main+1, 0
	MOVWF      R3
	MOVLW      12
	ADDWF      R2, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     R3, 0
	MOVWF      FSR1H
	MOVF       FLOC__Main+8, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+9, 0
	ADDWFC     R1, 1
	MOVLW      12
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;angle_particle.c,69 :: 		for(i = 0; i < 15; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,74 :: 		}
	GOTO       L_Main11
L_Main12:
;angle_particle.c,77 :: 		for(i = 0; i < 15; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main14:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main47
	MOVLW      15
	SUBWF      Main_i_L0+0, 0
L__Main47:
	BTFSC      STATUS+0, 0
	GOTO       L_Main15
;angle_particle.c,78 :: 		d = sqrt(pow(particle[i].theta_x - theta_x, 2.0) + pow(particle[i].theta_y - theta_y, 2.0));
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     FLOC__Main+1, 0
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
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_x_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_pow_x+0
	MOVF       R1, 0
	MOVWF      FARG_pow_x+1
	MOVF       R2, 0
	MOVWF      FARG_pow_x+2
	MOVF       R3, 0
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
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
	MOVF       Main_theta_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_y_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_pow_x+0
	MOVF       R1, 0
	MOVWF      FARG_pow_x+1
	MOVF       R2, 0
	MOVWF      FARG_pow_x+2
	MOVF       R3, 0
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
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
	MOVWF      FARG_sqrt_x+0
	MOVF       R1, 0
	MOVWF      FARG_sqrt_x+1
	MOVF       R2, 0
	MOVWF      FARG_sqrt_x+2
	MOVF       R3, 0
	MOVWF      FARG_sqrt_x+3
	CALL       _sqrt+0
	MOVF       R0, 0
	MOVWF      Main_d_L0+0
	MOVF       R1, 0
	MOVWF      Main_d_L0+1
	MOVF       R2, 0
	MOVWF      Main_d_L0+2
	MOVF       R3, 0
	MOVWF      Main_d_L0+3
;angle_particle.c,79 :: 		particle[i].weight = (1.0 / sqrt(2.0 * PI)) * exp(-1.0 * pow(d, 2.0) / (2.0 * pow(sigma, 2.0)));
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       FLOC__Main+0, 0
	ADDWF      R0, 1
	MOVF       FLOC__Main+1, 0
	ADDWFC     R1, 1
	MOVLW      16
	ADDWF      R0, 0
	MOVWF      FLOC__Main+8
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__Main+9
	MOVLW      219
	MOVWF      FARG_sqrt_x+0
	MOVLW      15
	MOVWF      FARG_sqrt_x+1
	MOVLW      73
	MOVWF      FARG_sqrt_x+2
	MOVLW      129
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
	MOVLW      0
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVLW      0
	MOVWF      R2
	MOVLW      127
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	MOVWF      FLOC__Main+5
	MOVF       R2, 0
	MOVWF      FLOC__Main+6
	MOVF       R3, 0
	MOVWF      FLOC__Main+7
	MOVF       Main_d_L0+0, 0
	MOVWF      FARG_pow_x+0
	MOVF       Main_d_L0+1, 0
	MOVWF      FARG_pow_x+1
	MOVF       Main_d_L0+2, 0
	MOVWF      FARG_pow_x+2
	MOVF       Main_d_L0+3, 0
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      128
	MOVWF      R6
	MOVLW      127
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
	MOVLW      0
	MOVWF      FARG_pow_x+0
	MOVLW      0
	MOVWF      FARG_pow_x+1
	MOVLW      32
	MOVWF      FARG_pow_x+2
	MOVLW      130
	MOVWF      FARG_pow_x+3
	MOVLW      0
	MOVWF      FARG_pow_y+0
	MOVLW      0
	MOVWF      FARG_pow_y+1
	MOVLW      0
	MOVWF      FARG_pow_y+2
	MOVLW      128
	MOVWF      FARG_pow_y+3
	CALL       _pow+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
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
	MOVF       FLOC__Main+0, 0
	MOVWF      R0
	MOVF       FLOC__Main+1, 0
	MOVWF      R1
	MOVF       FLOC__Main+2, 0
	MOVWF      R2
	MOVF       FLOC__Main+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FARG_exp_x+0
	MOVF       R1, 0
	MOVWF      FARG_exp_x+1
	MOVF       R2, 0
	MOVWF      FARG_exp_x+2
	MOVF       R3, 0
	MOVWF      FARG_exp_x+3
	CALL       _exp+0
	MOVF       FLOC__Main+4, 0
	MOVWF      R4
	MOVF       FLOC__Main+5, 0
	MOVWF      R5
	MOVF       FLOC__Main+6, 0
	MOVWF      R6
	MOVF       FLOC__Main+7, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__Main+8, 0
	MOVWF      FSR1L
	MOVF       FLOC__Main+9, 0
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
;angle_particle.c,77 :: 		for(i = 0; i < 15; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,80 :: 		}
	GOTO       L_Main14
L_Main15:
;angle_particle.c,83 :: 		theta_x = 0.0;
	CLRF       Main_theta_x_L0+0
	CLRF       Main_theta_x_L0+1
	CLRF       Main_theta_x_L0+2
	CLRF       Main_theta_x_L0+3
;angle_particle.c,84 :: 		theta_y = 0.0;
	CLRF       Main_theta_y_L0+0
	CLRF       Main_theta_y_L0+1
	CLRF       Main_theta_y_L0+2
	CLRF       Main_theta_y_L0+3
;angle_particle.c,85 :: 		for(i = 0; i < 15; i ++){
	CLRF       Main_i_L0+0
	CLRF       Main_i_L0+1
L_Main17:
	MOVLW      128
	XORWF      Main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main48
	MOVLW      15
	SUBWF      Main_i_L0+0, 0
L__Main48:
	BTFSC      STATUS+0, 0
	GOTO       L_Main18
;angle_particle.c,86 :: 		theta_x += particle[i].theta_x * particle[i].weight;
	MOVLW      _particle+0
	MOVWF      FLOC__Main+0
	MOVLW      hi_addr(_particle+0)
	MOVWF      FLOC__Main+1
	MOVLW      20
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Main_i_L0+0, 0
	MOVWF      R4
	MOVF       Main_i_L0+1, 0
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	ADDWF      FLOC__Main+0, 0
	MOVWF      FLOC__Main+4
	MOVF       R1, 0
	ADDWFC     FLOC__Main+1, 0
	MOVWF      FLOC__Main+5
	MOVF       FLOC__Main+4, 0
	MOVWF      FSR0L
	MOVF       FLOC__Main+5, 0
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
	MOVLW      16
	ADDWF      FLOC__Main+4, 0
	MOVWF      FLOC__Main+0
	MOVLW      0
	ADDWFC     FLOC__Main+5, 0
	MOVWF      FLOC__Main+1
	MOVF       FLOC__Main+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__Main+1, 0
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
	CALL       _Mul_32x32_FP+0
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_x_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_theta_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_x_L0+3
;angle_particle.c,87 :: 		theta_y += particle[i].theta_y * particle[i].weight;
	MOVLW      4
	ADDWF      FLOC__Main+4, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FLOC__Main+5, 0
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
	MOVF       FLOC__Main+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__Main+1, 0
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
	CALL       _Mul_32x32_FP+0
	MOVF       Main_theta_y_L0+0, 0
	MOVWF      R4
	MOVF       Main_theta_y_L0+1, 0
	MOVWF      R5
	MOVF       Main_theta_y_L0+2, 0
	MOVWF      R6
	MOVF       Main_theta_y_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_theta_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_y_L0+3
;angle_particle.c,85 :: 		for(i = 0; i < 15; i ++){
	INCF       Main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Main_i_L0+1, 1
;angle_particle.c,88 :: 		}
	GOTO       L_Main17
L_Main18:
;angle_particle.c,89 :: 		theta_x /= 15.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      112
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      R0
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      R1
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      R2
	MOVF       Main_theta_x_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_theta_x_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_x_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_x_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_x_L0+3
;angle_particle.c,90 :: 		theta_y /= 15.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      112
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       Main_theta_y_L0+0, 0
	MOVWF      R0
	MOVF       Main_theta_y_L0+1, 0
	MOVWF      R1
	MOVF       Main_theta_y_L0+2, 0
	MOVWF      R2
	MOVF       Main_theta_y_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      Main_theta_y_L0+0
	MOVF       R1, 0
	MOVWF      Main_theta_y_L0+1
	MOVF       R2, 0
	MOVWF      Main_theta_y_L0+2
	MOVF       R3, 0
	MOVWF      Main_theta_y_L0+3
;angle_particle.c,92 :: 		Debug(theta_x, theta_y);
	MOVF       Main_theta_x_L0+0, 0
	MOVWF      FARG_Debug+0
	MOVF       Main_theta_x_L0+1, 0
	MOVWF      FARG_Debug+1
	MOVF       Main_theta_x_L0+2, 0
	MOVWF      FARG_Debug+2
	MOVF       Main_theta_x_L0+3, 0
	MOVWF      FARG_Debug+3
	MOVF       R0, 0
	MOVWF      FARG_Debug+0
	MOVF       R1, 0
	MOVWF      FARG_Debug+1
	MOVF       R2, 0
	MOVWF      FARG_Debug+2
	MOVF       R3, 0
	MOVWF      FARG_Debug+3
	CALL       _Debug+0
;angle_particle.c,93 :: 		}
	GOTO       L_Main6
;angle_particle.c,94 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_SetUp:

;angle_particle.c,96 :: 		void SetUp()
;angle_particle.c,98 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_particle.c,100 :: 		OPTION_REG = 0x07;  //タイマー0設定
	MOVLW      7
	MOVWF      OPTION_REG+0
;angle_particle.c,102 :: 		ANSELA = 0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_particle.c,103 :: 		ANSELB = 0x00;
	CLRF       ANSELB+0
;angle_particle.c,104 :: 		ANSELD = 0x00;
	CLRF       ANSELD+0
;angle_particle.c,105 :: 		ANSELE = 0x00;
	CLRF       ANSELE+0
;angle_particle.c,107 :: 		TRISA  = 0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_particle.c,108 :: 		TRISB  = 0x20;
	MOVLW      32
	MOVWF      TRISB+0
;angle_particle.c,109 :: 		TRISC  = 0x00;
	CLRF       TRISC+0
;angle_particle.c,110 :: 		TRISD  = 0x00;
	CLRF       TRISD+0
;angle_particle.c,111 :: 		TRISE  = 0x00;
	CLRF       TRISE+0
;angle_particle.c,113 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;angle_particle.c,114 :: 		PORTB  = 0x00;
	CLRF       PORTB+0
;angle_particle.c,115 :: 		PORTC  = 0x00;
	CLRF       PORTC+0
;angle_particle.c,116 :: 		PORTD  = 0x00;
	CLRF       PORTD+0
;angle_particle.c,117 :: 		PORTE  = 0x00;
	CLRF       PORTE+0
;angle_particle.c,119 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_particle.c,121 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_particle.c,123 :: 		Soft_UART_Init(&PORTB, 4, 6, 9600, 0);
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
;angle_particle.c,125 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_SetUp20:
	DECFSZ     R13, 1
	GOTO       L_SetUp20
	DECFSZ     R12, 1
	GOTO       L_SetUp20
	NOP
;angle_particle.c,126 :: 		}
L_end_SetUp:
	RETURN
; end of _SetUp

_Debug:

;angle_particle.c,128 :: 		void Debug(double roll, double pitch)
;angle_particle.c,132 :: 		Soft_UART_Write('X');
	MOVLW      88
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,133 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,134 :: 		Soft_UART_Write((roll >= 0.0) ? '+' : '-');
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
;angle_particle.c,135 :: 		tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
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
;angle_particle.c,136 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_particle.c,137 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_particle.c,138 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,139 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_particle.c,140 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,142 :: 		Soft_UART_Write('Y');
	MOVLW      89
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,143 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,144 :: 		Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
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
;angle_particle.c,145 :: 		tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
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
;angle_particle.c,146 :: 		Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
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
;angle_particle.c,147 :: 		Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
;angle_particle.c,148 :: 		Soft_UART_Write('.');
	MOVLW      46
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,149 :: 		Soft_UART_Write(Dec2Ascii(tmp % 10));
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
;angle_particle.c,150 :: 		Soft_UART_Write('\n');
	MOVLW      10
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;angle_particle.c,151 :: 		}
L_end_Debug:
	RETURN
; end of _Debug

_Dec2Ascii:

;angle_particle.c,153 :: 		char Dec2Ascii(char dec)
;angle_particle.c,155 :: 		switch(dec){
	GOTO       L_Dec2Ascii29
;angle_particle.c,156 :: 		case 0:  return '0';
L_Dec2Ascii31:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,157 :: 		case 1:  return '1';
L_Dec2Ascii32:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,158 :: 		case 2:  return '2';
L_Dec2Ascii33:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,159 :: 		case 3:  return '3';
L_Dec2Ascii34:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,160 :: 		case 4:  return '4';
L_Dec2Ascii35:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,161 :: 		case 5:  return '5';
L_Dec2Ascii36:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,162 :: 		case 6:  return '6';
L_Dec2Ascii37:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,163 :: 		case 7:  return '7';
L_Dec2Ascii38:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,164 :: 		case 8:  return '8';
L_Dec2Ascii39:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,165 :: 		case 9:  return '9';
L_Dec2Ascii40:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,166 :: 		default: return '*';
L_Dec2Ascii41:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_Dec2Ascii
;angle_particle.c,167 :: 		}
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
;angle_particle.c,168 :: 		}
L_end_Dec2Ascii:
	RETURN
; end of _Dec2Ascii
