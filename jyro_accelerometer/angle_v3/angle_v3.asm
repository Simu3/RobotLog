
_main:

;angle_v3.c,219 :: 		void main()
;angle_v3.c,227 :: 		ax_bias=ay_bias=jx_bias=jy_bias=ax=ay=az=jx=jy=x=y=0.0;
	CLRF       main_y_L0+0
	CLRF       main_y_L0+1
	CLRF       main_y_L0+2
	CLRF       main_y_L0+3
	CLRF       main_x_L0+0
	CLRF       main_x_L0+1
	CLRF       main_x_L0+2
	CLRF       main_x_L0+3
	CLRF       main_az_L0+0
	CLRF       main_az_L0+1
	CLRF       main_az_L0+2
	CLRF       main_az_L0+3
	CLRF       main_ay_L0+0
	CLRF       main_ay_L0+1
	CLRF       main_ay_L0+2
	CLRF       main_ay_L0+3
	CLRF       main_ax_L0+0
	CLRF       main_ax_L0+1
	CLRF       main_ax_L0+2
	CLRF       main_ax_L0+3
	CLRF       main_ay_bias_L0+0
	CLRF       main_ay_bias_L0+1
	CLRF       main_ay_bias_L0+2
	CLRF       main_ay_bias_L0+3
	CLRF       main_ax_bias_L0+0
	CLRF       main_ax_bias_L0+1
	CLRF       main_ax_bias_L0+2
	CLRF       main_ax_bias_L0+3
;angle_v3.c,229 :: 		setup();
	CALL       _setup+0
;angle_v3.c,231 :: 		for(i=0; i<100; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main0:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;angle_v3.c,232 :: 		ax_bias+=ADC_read(AX);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_ax_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_ax_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_ax_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_ax_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ax_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_ax_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_ax_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_ax_bias_L0+3
;angle_v3.c,233 :: 		ay_bias+=ADC_read(AY);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_ay_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_ay_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_ay_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_ay_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ay_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_ay_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_ay_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_ay_bias_L0+3
;angle_v3.c,234 :: 		jx_bias+=ADC_read(JX);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;angle_v3.c,235 :: 		jy_bias+=ADC_read(JY);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;angle_v3.c,231 :: 		for(i=0; i<100; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v3.c,236 :: 		}
	GOTO       L_main0
L_main1:
;angle_v3.c,238 :: 		ax_bias=ax_bias/100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_ax_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_ax_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_ax_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_ax_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ax_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_ax_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_ax_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_ax_bias_L0+3
;angle_v3.c,239 :: 		ay_bias=ay_bias/100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_ay_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_ay_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_ay_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_ay_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ay_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_ay_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_ay_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_ay_bias_L0+3
;angle_v3.c,243 :: 		while(1){
L_main3:
;angle_v3.c,244 :: 		ax=ay=az=jx=jy=0.0;
	CLRF       main_az_L0+0
	CLRF       main_az_L0+1
	CLRF       main_az_L0+2
	CLRF       main_az_L0+3
	CLRF       main_ay_L0+0
	CLRF       main_ay_L0+1
	CLRF       main_ay_L0+2
	CLRF       main_ay_L0+3
	CLRF       main_ax_L0+0
	CLRF       main_ax_L0+1
	CLRF       main_ax_L0+2
	CLRF       main_ax_L0+3
;angle_v3.c,246 :: 		for(i=0; i<100; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main5:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;angle_v3.c,247 :: 		ax+=ADC_read(AX);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_ax_L0+0, 0
	MOVWF      R4
	MOVF       main_ax_L0+1, 0
	MOVWF      R5
	MOVF       main_ax_L0+2, 0
	MOVWF      R6
	MOVF       main_ax_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ax_L0+0
	MOVF       R1, 0
	MOVWF      main_ax_L0+1
	MOVF       R2, 0
	MOVWF      main_ax_L0+2
	MOVF       R3, 0
	MOVWF      main_ax_L0+3
;angle_v3.c,248 :: 		ay+=ADC_read(AY);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_ay_L0+0, 0
	MOVWF      R4
	MOVF       main_ay_L0+1, 0
	MOVWF      R5
	MOVF       main_ay_L0+2, 0
	MOVWF      R6
	MOVF       main_ay_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ay_L0+0
	MOVF       R1, 0
	MOVWF      main_ay_L0+1
	MOVF       R2, 0
	MOVWF      main_ay_L0+2
	MOVF       R3, 0
	MOVWF      main_ay_L0+3
;angle_v3.c,249 :: 		az+=ADC_read(AZ);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_az_L0+0, 0
	MOVWF      R4
	MOVF       main_az_L0+1, 0
	MOVWF      R5
	MOVF       main_az_L0+2, 0
	MOVWF      R6
	MOVF       main_az_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_az_L0+0
	MOVF       R1, 0
	MOVWF      main_az_L0+1
	MOVF       R2, 0
	MOVWF      main_az_L0+2
	MOVF       R3, 0
	MOVWF      main_az_L0+3
;angle_v3.c,250 :: 		jx+=ADC_read(JX);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;angle_v3.c,251 :: 		jy+=ADC_read(JY);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;angle_v3.c,246 :: 		for(i=0; i<100; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v3.c,252 :: 		}
	GOTO       L_main5
L_main6:
;angle_v3.c,254 :: 		ax=ax/100.0-ax_bias;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_ax_L0+0, 0
	MOVWF      R0
	MOVF       main_ax_L0+1, 0
	MOVWF      R1
	MOVF       main_ax_L0+2, 0
	MOVWF      R2
	MOVF       main_ax_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       main_ax_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_ax_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_ax_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_ax_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ax_L0+0
	MOVF       R1, 0
	MOVWF      main_ax_L0+1
	MOVF       R2, 0
	MOVWF      main_ax_L0+2
	MOVF       R3, 0
	MOVWF      main_ax_L0+3
;angle_v3.c,255 :: 		ay=ay/100.0-ay_bias;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_ay_L0+0, 0
	MOVWF      R0
	MOVF       main_ay_L0+1, 0
	MOVWF      R1
	MOVF       main_ay_L0+2, 0
	MOVWF      R2
	MOVF       main_ay_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       main_ay_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_ay_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_ay_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_ay_bias_L0+3, 0
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_ay_L0+0
	MOVF       R1, 0
	MOVWF      main_ay_L0+1
	MOVF       R2, 0
	MOVWF      main_ay_L0+2
	MOVF       R3, 0
	MOVWF      main_ay_L0+3
;angle_v3.c,256 :: 		az=az/100.0-AZBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_az_L0+0, 0
	MOVWF      R0
	MOVF       main_az_L0+1, 0
	MOVWF      R1
	MOVF       main_az_L0+2, 0
	MOVWF      R2
	MOVF       main_az_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      16
	MOVWF      R6
	MOVLW      136
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_az_L0+0
	MOVF       R1, 0
	MOVWF      main_az_L0+1
	MOVF       R2, 0
	MOVWF      main_az_L0+2
	MOVF       R3, 0
	MOVWF      main_az_L0+3
;angle_v3.c,260 :: 		x=(ax>=0.0) ? angle_3(ax, ay, az) : -angle_3(ax, ay, az);
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       main_ax_L0+0, 0
	MOVWF      R0
	MOVF       main_ax_L0+1, 0
	MOVWF      R1
	MOVF       main_ax_L0+2, 0
	MOVWF      R2
	MOVF       main_ax_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       main_ax_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ax_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ax_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ax_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_ay_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ay_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ay_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ay_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_az_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_az_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_az_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_az_L0+3, 0
	MOVWF      FARG_angle_3+3
	CALL       _angle_3+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
	GOTO       L_main9
L_main8:
	MOVF       main_ax_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ax_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ax_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ax_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_ay_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ay_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ay_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ay_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_az_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_az_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_az_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_az_L0+3, 0
	MOVWF      FARG_angle_3+3
	CALL       _angle_3+0
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
L_main9:
	MOVF       FLOC__main+0, 0
	MOVWF      main_x_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_x_L0+1
	MOVF       FLOC__main+2, 0
	MOVWF      main_x_L0+2
	MOVF       FLOC__main+3, 0
	MOVWF      main_x_L0+3
;angle_v3.c,261 :: 		y=(ay>=0.0) ? angle_3(ay, ax, az) : -angle_3(ay, ax, az);
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       main_ay_L0+0, 0
	MOVWF      R0
	MOVF       main_ay_L0+1, 0
	MOVWF      R1
	MOVF       main_ay_L0+2, 0
	MOVWF      R2
	MOVF       main_ay_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       main_ay_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ay_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ay_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ay_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_ax_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ax_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ax_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ax_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_az_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_az_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_az_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_az_L0+3, 0
	MOVWF      FARG_angle_3+3
	CALL       _angle_3+0
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
	MOVF       R2, 0
	MOVWF      FLOC__main+2
	MOVF       R3, 0
	MOVWF      FLOC__main+3
	GOTO       L_main11
L_main10:
	MOVF       main_ay_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ay_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ay_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ay_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_ax_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_ax_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_ax_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_ax_L0+3, 0
	MOVWF      FARG_angle_3+3
	MOVF       main_az_L0+0, 0
	MOVWF      FARG_angle_3+0
	MOVF       main_az_L0+1, 0
	MOVWF      FARG_angle_3+1
	MOVF       main_az_L0+2, 0
	MOVWF      FARG_angle_3+2
	MOVF       main_az_L0+3, 0
	MOVWF      FARG_angle_3+3
	CALL       _angle_3+0
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
L_main11:
	MOVF       FLOC__main+0, 0
	MOVWF      main_y_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_y_L0+1
	MOVF       FLOC__main+2, 0
	MOVWF      main_y_L0+2
	MOVF       FLOC__main+3, 0
	MOVWF      main_y_L0+3
;angle_v3.c,266 :: 		if(x>=20.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       main_x_L0+0, 0
	MOVWF      R0
	MOVF       main_x_L0+1, 0
	MOVWF      R1
	MOVF       main_x_L0+2, 0
	MOVWF      R2
	MOVF       main_x_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;angle_v3.c,267 :: 		x=20.0;
	MOVLW      0
	MOVWF      main_x_L0+0
	MOVLW      0
	MOVWF      main_x_L0+1
	MOVLW      32
	MOVWF      main_x_L0+2
	MOVLW      131
	MOVWF      main_x_L0+3
	GOTO       L_main13
L_main12:
;angle_v3.c,268 :: 		else if(x<=-20.0)
	MOVF       main_x_L0+0, 0
	MOVWF      R4
	MOVF       main_x_L0+1, 0
	MOVWF      R5
	MOVF       main_x_L0+2, 0
	MOVWF      R6
	MOVF       main_x_L0+3, 0
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
;angle_v3.c,269 :: 		x=-20.0;
	MOVLW      0
	MOVWF      main_x_L0+0
	MOVLW      0
	MOVWF      main_x_L0+1
	MOVLW      160
	MOVWF      main_x_L0+2
	MOVLW      131
	MOVWF      main_x_L0+3
L_main14:
L_main13:
;angle_v3.c,271 :: 		if(y>=20.0)
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      131
	MOVWF      R7
	MOVF       main_y_L0+0, 0
	MOVWF      R0
	MOVF       main_y_L0+1, 0
	MOVWF      R1
	MOVF       main_y_L0+2, 0
	MOVWF      R2
	MOVF       main_y_L0+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;angle_v3.c,272 :: 		y=20.0;
	MOVLW      0
	MOVWF      main_y_L0+0
	MOVLW      0
	MOVWF      main_y_L0+1
	MOVLW      32
	MOVWF      main_y_L0+2
	MOVLW      131
	MOVWF      main_y_L0+3
	GOTO       L_main16
L_main15:
;angle_v3.c,273 :: 		else if(y<=-20.0)
	MOVF       main_y_L0+0, 0
	MOVWF      R4
	MOVF       main_y_L0+1, 0
	MOVWF      R5
	MOVF       main_y_L0+2, 0
	MOVWF      R6
	MOVF       main_y_L0+3, 0
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
	GOTO       L_main17
;angle_v3.c,274 :: 		y=-20.0;
	MOVLW      0
	MOVWF      main_y_L0+0
	MOVLW      0
	MOVWF      main_y_L0+1
	MOVLW      160
	MOVWF      main_y_L0+2
	MOVLW      131
	MOVWF      main_y_L0+3
L_main17:
L_main16:
;angle_v3.c,276 :: 		debug(x, y);
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_debug+1
	MOVF       main_x_L0+2, 0
	MOVWF      FARG_debug+2
	MOVF       main_x_L0+3, 0
	MOVWF      FARG_debug+3
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_y_L0+1, 0
	MOVWF      FARG_debug+1
	MOVF       main_y_L0+2, 0
	MOVWF      FARG_debug+2
	MOVF       main_y_L0+3, 0
	MOVWF      FARG_debug+3
	CALL       _debug+0
;angle_v3.c,277 :: 		}
	GOTO       L_main3
;angle_v3.c,278 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;angle_v3.c,280 :: 		void setup()
;angle_v3.c,282 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v3.c,284 :: 		ANSELA=0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v3.c,285 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;angle_v3.c,286 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;angle_v3.c,287 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;angle_v3.c,288 :: 		TRISA=0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v3.c,289 :: 		TRISB=0x00;
	CLRF       TRISB+0
;angle_v3.c,290 :: 		TRISC=0x00;
	CLRF       TRISC+0
;angle_v3.c,291 :: 		TRISD=0x00;
	CLRF       TRISD+0
;angle_v3.c,292 :: 		TRISE=0x00;
	CLRF       TRISE+0
;angle_v3.c,294 :: 		PORTA=0x00;
	CLRF       PORTA+0
;angle_v3.c,295 :: 		PORTB=0x00;
	CLRF       PORTB+0
;angle_v3.c,296 :: 		PORTC=0x00;
	CLRF       PORTC+0
;angle_v3.c,297 :: 		PORTD=0x00;
	CLRF       PORTD+0
;angle_v3.c,298 :: 		PORTE=0x00;
	CLRF       PORTE+0
;angle_v3.c,300 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v3.c,302 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v3.c,304 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_setup18:
	DECFSZ     R13, 1
	GOTO       L_setup18
	DECFSZ     R12, 1
	GOTO       L_setup18
	DECFSZ     R11, 1
	GOTO       L_setup18
	NOP
	NOP
;angle_v3.c,305 :: 		}
L_end_setup:
	RETURN
; end of _setup

_debug:

;angle_v3.c,307 :: 		void debug(double x, double y)
;angle_v3.c,312 :: 		UART_write((x>=0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
	MOVWF      R1
	MOVF       FARG_debug_x+2, 0
	MOVWF      R2
	MOVF       FARG_debug_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug19
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug20
L_debug19:
	MOVLW      45
	MOVWF      R0
L_debug20:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,313 :: 		ttmpx=(x>=0.0) ? x*10.0 : -x*10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
	MOVWF      R1
	MOVF       FARG_debug_x+2, 0
	MOVWF      R2
	MOVF       FARG_debug_x+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug21
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
	MOVWF      R1
	MOVF       FARG_debug_x+2, 0
	MOVWF      R2
	MOVF       FARG_debug_x+3, 0
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVF       R2, 0
	MOVWF      FLOC__debug+2
	MOVF       R3, 0
	MOVWF      FLOC__debug+3
	GOTO       L_debug22
L_debug21:
	MOVLW      0
	XORWF      FARG_debug_x+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_debug_x+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_debug_x+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_debug_x+3, 0
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVF       R2, 0
	MOVWF      FLOC__debug+2
	MOVF       R3, 0
	MOVWF      FLOC__debug+3
L_debug22:
;angle_v3.c,314 :: 		tmpx=ttmpx;
	MOVF       FLOC__debug+0, 0
	MOVWF      R0
	MOVF       FLOC__debug+1, 0
	MOVWF      R1
	MOVF       FLOC__debug+2, 0
	MOVWF      R2
	MOVF       FLOC__debug+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      debug_tmpx_L0+0
	MOVF       R1, 0
	MOVWF      debug_tmpx_L0+1
;angle_v3.c,315 :: 		UART_write(dec2ascii((tmpx%1000-tmpx%100)/100));
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpx_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpx_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__debug+1, 0
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
;angle_v3.c,316 :: 		UART_write(dec2ascii((tmpx%100-tmpx%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpx_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpx_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpx_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpx_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__debug+1, 0
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
;angle_v3.c,317 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,318 :: 		UART_write(dec2ascii(tmpx%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpx_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpx_L0+1, 0
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
;angle_v3.c,319 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,321 :: 		UART_write((y>=0.0) ? '+' : '-');
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
	MOVWF      R1
	MOVF       FARG_debug_y+2, 0
	MOVWF      R2
	MOVF       FARG_debug_y+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug23
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug24
L_debug23:
	MOVLW      45
	MOVWF      R0
L_debug24:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,322 :: 		ttmpy=(y>=0.0) ? y*10.0 : -y*10.0;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
	MOVWF      R1
	MOVF       FARG_debug_y+2, 0
	MOVWF      R2
	MOVF       FARG_debug_y+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug25
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
	MOVWF      R1
	MOVF       FARG_debug_y+2, 0
	MOVWF      R2
	MOVF       FARG_debug_y+3, 0
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVF       R2, 0
	MOVWF      FLOC__debug+2
	MOVF       R3, 0
	MOVWF      FLOC__debug+3
	GOTO       L_debug26
L_debug25:
	MOVLW      0
	XORWF      FARG_debug_y+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_debug_y+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_debug_y+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_debug_y+3, 0
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVF       R2, 0
	MOVWF      FLOC__debug+2
	MOVF       R3, 0
	MOVWF      FLOC__debug+3
L_debug26:
;angle_v3.c,323 :: 		tmpy=ttmpy;
	MOVF       FLOC__debug+0, 0
	MOVWF      R0
	MOVF       FLOC__debug+1, 0
	MOVWF      R1
	MOVF       FLOC__debug+2, 0
	MOVWF      R2
	MOVF       FLOC__debug+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      debug_tmpy_L0+0
	MOVF       R1, 0
	MOVWF      debug_tmpy_L0+1
;angle_v3.c,324 :: 		UART_write(dec2ascii((tmpy%1000-tmpy%100)/100));
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
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpy_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpy_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__debug+1, 0
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
;angle_v3.c,325 :: 		UART_write(dec2ascii((tmpy%100-tmpy%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpy_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpy_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	MOVWF      FLOC__debug+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpy_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpy_L0+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__debug+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__debug+1, 0
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
;angle_v3.c,326 :: 		UART_write('.');
	MOVLW      46
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,327 :: 		UART_write(dec2ascii(tmpy%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       debug_tmpy_L0+0, 0
	MOVWF      R0
	MOVF       debug_tmpy_L0+1, 0
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
;angle_v3.c,328 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v3.c,329 :: 		}
L_end_debug:
	RETURN
; end of _debug

_dec2ascii:

;angle_v3.c,331 :: 		char dec2ascii(char dec)
;angle_v3.c,333 :: 		switch(dec){
	GOTO       L_dec2ascii27
;angle_v3.c,334 :: 		case 0: return '0';
L_dec2ascii29:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,335 :: 		case 1: return '1';
L_dec2ascii30:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,336 :: 		case 2: return '2';
L_dec2ascii31:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,337 :: 		case 3: return '3';
L_dec2ascii32:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,338 :: 		case 4: return '4';
L_dec2ascii33:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,339 :: 		case 5: return '5';
L_dec2ascii34:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,340 :: 		case 6: return '6';
L_dec2ascii35:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,341 :: 		case 7: return '7';
L_dec2ascii36:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,342 :: 		case 8: return '8';
L_dec2ascii37:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,343 :: 		case 9: return '9';
L_dec2ascii38:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,344 :: 		default: return '*';
L_dec2ascii39:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v3.c,345 :: 		}
L_dec2ascii27:
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii29
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii30
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii31
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii32
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii33
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii34
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii35
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii36
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii37
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii38
	GOTO       L_dec2ascii39
;angle_v3.c,346 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii

_angle_3:

;angle_v3.c,348 :: 		double angle_3(double a, double b, double c)
;angle_v3.c,353 :: 		a=(a>=0) ? a : -a;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_a+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_a+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_340
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_a+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_a+3, 0
	MOVWF      R7
	GOTO       L_angle_341
L_angle_340:
	MOVLW      0
	XORWF      FARG_angle_3_a+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_angle_3_a+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_angle_3_a+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_angle_3_a+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_angle_341:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_a+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_a+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_a+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_a+3
;angle_v3.c,354 :: 		b=(b>=0) ? b : -b;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_b+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_b+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_342
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_b+3, 0
	MOVWF      R7
	GOTO       L_angle_343
L_angle_342:
	MOVLW      0
	XORWF      FARG_angle_3_b+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_angle_3_b+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_angle_3_b+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_angle_3_b+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_angle_343:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_b+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_b+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_b+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_b+3
;angle_v3.c,355 :: 		c=(c>=0) ? c : -c;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_c+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_c+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_344
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_c+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_c+3, 0
	MOVWF      R7
	GOTO       L_angle_345
L_angle_344:
	MOVLW      0
	XORWF      FARG_angle_3_c+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_angle_3_c+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_angle_3_c+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_angle_3_c+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_angle_345:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_c+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_c+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_c+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_c+3
;angle_v3.c,357 :: 		tmp=a/sqrt(b*b+c*c);
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_b+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_b+3, 0
	MOVWF      R3
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_b+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      FLOC__angle_3+0
	MOVF       R1, 0
	MOVWF      FLOC__angle_3+1
	MOVF       R2, 0
	MOVWF      FLOC__angle_3+2
	MOVF       R3, 0
	MOVWF      FLOC__angle_3+3
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_c+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_c+3, 0
	MOVWF      R3
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_c+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_c+3, 0
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       FLOC__angle_3+0, 0
	MOVWF      R4
	MOVF       FLOC__angle_3+1, 0
	MOVWF      R5
	MOVF       FLOC__angle_3+2, 0
	MOVWF      R6
	MOVF       FLOC__angle_3+3, 0
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
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R1
	MOVF       FARG_angle_3_a+2, 0
	MOVWF      R2
	MOVF       FARG_angle_3_a+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      angle_3_tmp_L0+0
	MOVF       R1, 0
	MOVWF      angle_3_tmp_L0+1
	MOVF       R2, 0
	MOVWF      angle_3_tmp_L0+2
	MOVF       R3, 0
	MOVWF      angle_3_tmp_L0+3
;angle_v3.c,359 :: 		for(i=0; i<=200; i=i++){
	CLRF       angle_3_i_L0+0
	CLRF       angle_3_i_L0+1
L_angle_346:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_3_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_360
	MOVF       angle_3_i_L0+0, 0
	SUBLW      200
L__angle_360:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_347
;angle_v3.c,360 :: 		if(-0.001<=(t[i]-tmp) && (t[i]-tmp)<=0.001)
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
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
	MOVF       angle_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_3_tmp_L0+3, 0
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
	GOTO       L_angle_351
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _t+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_t+0)
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
	MOVF       angle_3_tmp_L0+0, 0
	MOVWF      R4
	MOVF       angle_3_tmp_L0+1, 0
	MOVWF      R5
	MOVF       angle_3_tmp_L0+2, 0
	MOVWF      R6
	MOVF       angle_3_tmp_L0+3, 0
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
	GOTO       L_angle_351
L__angle_352:
;angle_v3.c,361 :: 		return (double)i/10.0;
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
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
	GOTO       L_end_angle_3
L_angle_351:
;angle_v3.c,359 :: 		for(i=0; i<=200; i=i++){
	INCF       angle_3_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_3_i_L0+1, 1
;angle_v3.c,362 :: 		}
	GOTO       L_angle_346
L_angle_347:
;angle_v3.c,364 :: 		return 99.9;
	MOVLW      205
	MOVWF      R0
	MOVLW      204
	MOVWF      R1
	MOVLW      71
	MOVWF      R2
	MOVLW      133
	MOVWF      R3
;angle_v3.c,365 :: 		}
L_end_angle_3:
	RETURN
; end of _angle_3
