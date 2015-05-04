
_main:

;angle_v1.c,224 :: 		void main()
;angle_v1.c,230 :: 		ax=ay=az=jx=jy=0.0;
	CLRF       main_jy_L0+0
	CLRF       main_jy_L0+1
	CLRF       main_jy_L0+2
	CLRF       main_jy_L0+3
	CLRF       main_jx_L0+0
	CLRF       main_jx_L0+1
	CLRF       main_jx_L0+2
	CLRF       main_jx_L0+3
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
;angle_v1.c,231 :: 		x=y=0;
	CLRF       main_y_L0+0
	CLRF       main_y_L0+1
	CLRF       main_x_L0+0
	CLRF       main_x_L0+1
;angle_v1.c,233 :: 		setup();
	CALL       _setup+0
;angle_v1.c,235 :: 		while(1){
L_main0:
;angle_v1.c,242 :: 		ax=ay=az=jx=jy=0.0;
	CLRF       main_jy_L0+0
	CLRF       main_jy_L0+1
	CLRF       main_jy_L0+2
	CLRF       main_jy_L0+3
	CLRF       main_jx_L0+0
	CLRF       main_jx_L0+1
	CLRF       main_jx_L0+2
	CLRF       main_jx_L0+3
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
;angle_v1.c,244 :: 		for(i=0; i<10; i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
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
	GOTO       L_main3
;angle_v1.c,245 :: 		ax+=ADC_read(AX);
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
;angle_v1.c,246 :: 		ay+=ADC_read(AY);
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
;angle_v1.c,247 :: 		az+=ADC_read(AZ);
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
;angle_v1.c,248 :: 		jx+=ADC_read(JX);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jx_L0+0, 0
	MOVWF      R4
	MOVF       main_jx_L0+1, 0
	MOVWF      R5
	MOVF       main_jx_L0+2, 0
	MOVWF      R6
	MOVF       main_jx_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jx_L0+0
	MOVF       R1, 0
	MOVWF      main_jx_L0+1
	MOVF       R2, 0
	MOVWF      main_jx_L0+2
	MOVF       R3, 0
	MOVWF      main_jx_L0+3
;angle_v1.c,249 :: 		jy+=ADC_read(JY);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jy_L0+0, 0
	MOVWF      R4
	MOVF       main_jy_L0+1, 0
	MOVWF      R5
	MOVF       main_jy_L0+2, 0
	MOVWF      R6
	MOVF       main_jy_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jy_L0+0
	MOVF       R1, 0
	MOVWF      main_jy_L0+1
	MOVF       R2, 0
	MOVWF      main_jy_L0+2
	MOVF       R3, 0
	MOVWF      main_jy_L0+3
;angle_v1.c,244 :: 		for(i=0; i<10; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v1.c,250 :: 		}
	GOTO       L_main2
L_main3:
;angle_v1.c,252 :: 		ax=ax/10-AXBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      127
	MOVWF      R6
	MOVLW      135
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
;angle_v1.c,253 :: 		ay=ay/10-AYBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
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
	MOVLW      0
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      1
	MOVWF      R6
	MOVLW      136
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
;angle_v1.c,254 :: 		az=az/10-AZBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
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
;angle_v1.c,255 :: 		jx=jx/10-JXBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_jx_L0+0, 0
	MOVWF      R0
	MOVF       main_jx_L0+1, 0
	MOVWF      R1
	MOVF       main_jx_L0+2, 0
	MOVWF      R2
	MOVF       main_jx_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      128
	MOVWF      R5
	MOVLW      13
	MOVWF      R6
	MOVLW      135
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jx_L0+0
	MOVF       R1, 0
	MOVWF      main_jx_L0+1
	MOVF       R2, 0
	MOVWF      main_jx_L0+2
	MOVF       R3, 0
	MOVWF      main_jx_L0+3
;angle_v1.c,256 :: 		jy=jy/10-JYBIAS;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	MOVF       main_jy_L0+0, 0
	MOVWF      R0
	MOVF       main_jy_L0+1, 0
	MOVWF      R1
	MOVF       main_jy_L0+2, 0
	MOVWF      R2
	MOVF       main_jy_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      83
	MOVWF      R6
	MOVLW      135
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jy_L0+0
	MOVF       R1, 0
	MOVWF      main_jy_L0+1
	MOVF       R2, 0
	MOVWF      main_jy_L0+2
	MOVF       R3, 0
	MOVWF      main_jy_L0+3
;angle_v1.c,258 :: 		x=(ax>=0) ? angle_3(ax, ay, az) : -angle_3(ax, ay, az);
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
	GOTO       L_main5
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
	GOTO       L_main6
L_main5:
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
	SUBLW      0
	MOVWF      R0
	MOVF       R1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
L_main6:
	MOVF       FLOC__main+0, 0
	MOVWF      main_x_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_x_L0+1
;angle_v1.c,259 :: 		y=(ay>=0) ? angle_3(ay, ax, az) : -angle_3(ay, ax, az);
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
	GOTO       L_main7
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
	GOTO       L_main8
L_main7:
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
	SUBLW      0
	MOVWF      R0
	MOVF       R1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R1
	SUBWF      R1, 1
	MOVF       R0, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	MOVWF      FLOC__main+1
L_main8:
	MOVF       FLOC__main+0, 0
	MOVWF      main_y_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_y_L0+1
;angle_v1.c,261 :: 		if(x>=200)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      200
	SUBWF      main_x_L0+0, 0
L__main65:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;angle_v1.c,262 :: 		x=200;
	MOVLW      200
	MOVWF      main_x_L0+0
	CLRF       main_x_L0+1
	GOTO       L_main10
L_main9:
;angle_v1.c,263 :: 		else if(x<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       main_x_L0+0, 0
	SUBLW      56
L__main66:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;angle_v1.c,264 :: 		x=-200;
	MOVLW      56
	MOVWF      main_x_L0+0
	MOVLW      255
	MOVWF      main_x_L0+1
L_main11:
L_main10:
;angle_v1.c,266 :: 		if(y>=200)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      200
	SUBWF      main_y_L0+0, 0
L__main67:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;angle_v1.c,267 :: 		y=200;
	MOVLW      200
	MOVWF      main_y_L0+0
	CLRF       main_y_L0+1
	GOTO       L_main13
L_main12:
;angle_v1.c,268 :: 		else if(y<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       main_y_L0+0, 0
	SUBLW      56
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;angle_v1.c,269 :: 		y=-200;
	MOVLW      56
	MOVWF      main_y_L0+0
	MOVLW      255
	MOVWF      main_y_L0+1
L_main14:
L_main13:
;angle_v1.c,271 :: 		debug(x, y, az, jx, jy);
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_debug+1
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_y_L0+1, 0
	MOVWF      FARG_debug+1
	MOVF       main_az_L0+0, 0
	MOVWF      R0
	MOVF       main_az_L0+1, 0
	MOVWF      R1
	MOVF       main_az_L0+2, 0
	MOVWF      R2
	MOVF       main_az_L0+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_debug+0
	MOVF       R1, 0
	MOVWF      FARG_debug+1
	MOVF       main_jx_L0+0, 0
	MOVWF      R0
	MOVF       main_jx_L0+1, 0
	MOVWF      R1
	MOVF       main_jx_L0+2, 0
	MOVWF      R2
	MOVF       main_jx_L0+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_debug+0
	MOVF       R1, 0
	MOVWF      FARG_debug+1
	MOVF       main_jy_L0+0, 0
	MOVWF      R0
	MOVF       main_jy_L0+1, 0
	MOVWF      R1
	MOVF       main_jy_L0+2, 0
	MOVWF      R2
	MOVF       main_jy_L0+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_debug+0
	MOVF       R1, 0
	MOVWF      FARG_debug+1
	CALL       _debug+0
;angle_v1.c,272 :: 		}
	GOTO       L_main0
;angle_v1.c,273 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;angle_v1.c,275 :: 		void setup()
;angle_v1.c,277 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v1.c,279 :: 		ANSELA=0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v1.c,280 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;angle_v1.c,281 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;angle_v1.c,282 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;angle_v1.c,283 :: 		TRISA=0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v1.c,284 :: 		TRISB=0x00;
	CLRF       TRISB+0
;angle_v1.c,285 :: 		TRISC=0x00;
	CLRF       TRISC+0
;angle_v1.c,286 :: 		TRISD=0x00;
	CLRF       TRISD+0
;angle_v1.c,287 :: 		TRISE=0x00;
	CLRF       TRISE+0
;angle_v1.c,289 :: 		PORTA=0x00;
	CLRF       PORTA+0
;angle_v1.c,290 :: 		PORTB=0x00;
	CLRF       PORTB+0
;angle_v1.c,291 :: 		PORTC=0x00;
	CLRF       PORTC+0
;angle_v1.c,292 :: 		PORTD=0x00;
	CLRF       PORTD+0
;angle_v1.c,293 :: 		PORTE=0x00;
	CLRF       PORTE+0
;angle_v1.c,295 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v1.c,297 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v1.c,299 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_setup15:
	DECFSZ     R13, 1
	GOTO       L_setup15
	DECFSZ     R12, 1
	GOTO       L_setup15
	DECFSZ     R11, 1
	GOTO       L_setup15
	NOP
	NOP
;angle_v1.c,300 :: 		}
L_end_setup:
	RETURN
; end of _setup

_debug:

;angle_v1.c,302 :: 		void debug(int ax, int ay, int az, int jx, int jy)
;angle_v1.c,304 :: 		UART_write((ax>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_ax+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug71
	MOVLW      0
	SUBWF      FARG_debug_ax+0, 0
L__debug71:
	BTFSS      STATUS+0, 0
	GOTO       L_debug16
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug17
L_debug16:
	MOVLW      45
	MOVWF      R0
L_debug17:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,305 :: 		ax=abs(ax);
	MOVF       FARG_debug_ax+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_ax+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_ax+0
	MOVF       R1, 0
	MOVWF      FARG_debug_ax+1
;angle_v1.c,306 :: 		UART_write(dec2ascii((ax%1000-ax%100)/100));
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
	MOVF       FARG_debug_ax+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ax+1, 0
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
;angle_v1.c,307 :: 		UART_write(dec2ascii((ax%100-ax%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_ax+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ax+1, 0
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
	MOVF       FARG_debug_ax+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ax+1, 0
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
;angle_v1.c,308 :: 		UART_write(dec2ascii(ax%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_ax+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ax+1, 0
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
;angle_v1.c,309 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,311 :: 		UART_write((ay>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_ay+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug72
	MOVLW      0
	SUBWF      FARG_debug_ay+0, 0
L__debug72:
	BTFSS      STATUS+0, 0
	GOTO       L_debug18
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug19
L_debug18:
	MOVLW      45
	MOVWF      R0
L_debug19:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,312 :: 		ay=abs(ay);
	MOVF       FARG_debug_ay+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_ay+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_ay+0
	MOVF       R1, 0
	MOVWF      FARG_debug_ay+1
;angle_v1.c,313 :: 		UART_write(dec2ascii((ay%1000-ay%100)/100));
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
	MOVF       FARG_debug_ay+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ay+1, 0
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
;angle_v1.c,314 :: 		UART_write(dec2ascii((ay%100-ay%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_ay+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ay+1, 0
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
	MOVF       FARG_debug_ay+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ay+1, 0
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
;angle_v1.c,315 :: 		UART_write(dec2ascii(ay%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_ay+0, 0
	MOVWF      R0
	MOVF       FARG_debug_ay+1, 0
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
;angle_v1.c,316 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,318 :: 		UART_write((az>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_az+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug73
	MOVLW      0
	SUBWF      FARG_debug_az+0, 0
L__debug73:
	BTFSS      STATUS+0, 0
	GOTO       L_debug20
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug21
L_debug20:
	MOVLW      45
	MOVWF      R0
L_debug21:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,319 :: 		az=abs(az);
	MOVF       FARG_debug_az+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_az+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_az+0
	MOVF       R1, 0
	MOVWF      FARG_debug_az+1
;angle_v1.c,320 :: 		UART_write(dec2ascii((az%1000-az%100)/100));
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
	MOVF       FARG_debug_az+0, 0
	MOVWF      R0
	MOVF       FARG_debug_az+1, 0
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
;angle_v1.c,321 :: 		UART_write(dec2ascii((az%100-az%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_az+0, 0
	MOVWF      R0
	MOVF       FARG_debug_az+1, 0
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
	MOVF       FARG_debug_az+0, 0
	MOVWF      R0
	MOVF       FARG_debug_az+1, 0
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
;angle_v1.c,322 :: 		UART_write(dec2ascii(az%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_az+0, 0
	MOVWF      R0
	MOVF       FARG_debug_az+1, 0
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
;angle_v1.c,323 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,325 :: 		UART_write((jx>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_jx+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug74
	MOVLW      0
	SUBWF      FARG_debug_jx+0, 0
L__debug74:
	BTFSS      STATUS+0, 0
	GOTO       L_debug22
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug23
L_debug22:
	MOVLW      45
	MOVWF      R0
L_debug23:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,326 :: 		jx=abs(jx);
	MOVF       FARG_debug_jx+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_jx+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_jx+0
	MOVF       R1, 0
	MOVWF      FARG_debug_jx+1
;angle_v1.c,327 :: 		UART_write(dec2ascii((jx%1000-jx%100)/100));
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
	MOVF       FARG_debug_jx+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jx+1, 0
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
;angle_v1.c,328 :: 		UART_write(dec2ascii((jx%100-jx%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_jx+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jx+1, 0
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
	MOVF       FARG_debug_jx+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jx+1, 0
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
;angle_v1.c,329 :: 		UART_write(dec2ascii(jx%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_jx+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jx+1, 0
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
;angle_v1.c,330 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,332 :: 		UART_write((jy>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_jy+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug75
	MOVLW      0
	SUBWF      FARG_debug_jy+0, 0
L__debug75:
	BTFSS      STATUS+0, 0
	GOTO       L_debug24
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug25
L_debug24:
	MOVLW      45
	MOVWF      R0
L_debug25:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,333 :: 		jy=abs(jy);
	MOVF       FARG_debug_jy+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_jy+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_jy+0
	MOVF       R1, 0
	MOVWF      FARG_debug_jy+1
;angle_v1.c,334 :: 		UART_write(dec2ascii((jy%1000-jy%100)/100));
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
	MOVF       FARG_debug_jy+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jy+1, 0
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
;angle_v1.c,335 :: 		UART_write(dec2ascii((jy%100-jy%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_jy+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jy+1, 0
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
	MOVF       FARG_debug_jy+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jy+1, 0
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
;angle_v1.c,336 :: 		UART_write(dec2ascii(jy%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_jy+0, 0
	MOVWF      R0
	MOVF       FARG_debug_jy+1, 0
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
;angle_v1.c,337 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v1.c,338 :: 		}
L_end_debug:
	RETURN
; end of _debug

_dec2ascii:

;angle_v1.c,340 :: 		char dec2ascii(char dec)
;angle_v1.c,342 :: 		switch(dec){
	GOTO       L_dec2ascii26
;angle_v1.c,343 :: 		case 0: return '0';
L_dec2ascii28:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,344 :: 		case 1: return '1';
L_dec2ascii29:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,345 :: 		case 2: return '2';
L_dec2ascii30:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,346 :: 		case 3: return '3';
L_dec2ascii31:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,347 :: 		case 4: return '4';
L_dec2ascii32:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,348 :: 		case 5: return '5';
L_dec2ascii33:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,349 :: 		case 6: return '6';
L_dec2ascii34:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,350 :: 		case 7: return '7';
L_dec2ascii35:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,351 :: 		case 8: return '8';
L_dec2ascii36:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,352 :: 		case 9: return '9';
L_dec2ascii37:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,353 :: 		default: return '*';
L_dec2ascii38:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v1.c,354 :: 		}
L_dec2ascii26:
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii28
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii29
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii30
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii31
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii32
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii33
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii34
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii35
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii36
	MOVF       FARG_dec2ascii_dec+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii37
	GOTO       L_dec2ascii38
;angle_v1.c,355 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii

_angle_2:

;angle_v1.c,357 :: 		int angle_2(double a, double b)
;angle_v1.c,361 :: 		a=(a>=0) ? a : -a;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R1
	MOVF       FARG_angle_2_a+2, 0
	MOVWF      R2
	MOVF       FARG_angle_2_a+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_239
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R4
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R5
	MOVF       FARG_angle_2_a+2, 0
	MOVWF      R6
	MOVF       FARG_angle_2_a+3, 0
	MOVWF      R7
	GOTO       L_angle_240
L_angle_239:
	MOVLW      0
	XORWF      FARG_angle_2_a+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_angle_2_a+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_angle_2_a+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_angle_2_a+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_angle_240:
	MOVF       R4, 0
	MOVWF      FARG_angle_2_a+0
	MOVF       R5, 0
	MOVWF      FARG_angle_2_a+1
	MOVF       R6, 0
	MOVWF      FARG_angle_2_a+2
	MOVF       R7, 0
	MOVWF      FARG_angle_2_a+3
;angle_v1.c,362 :: 		b=(b>=0) ? b : -b;
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       FARG_angle_2_b+0, 0
	MOVWF      R0
	MOVF       FARG_angle_2_b+1, 0
	MOVWF      R1
	MOVF       FARG_angle_2_b+2, 0
	MOVWF      R2
	MOVF       FARG_angle_2_b+3, 0
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_241
	MOVF       FARG_angle_2_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_2_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_2_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_2_b+3, 0
	MOVWF      R7
	GOTO       L_angle_242
L_angle_241:
	MOVLW      0
	XORWF      FARG_angle_2_b+0, 0
	MOVWF      R0
	MOVLW      0
	XORWF      FARG_angle_2_b+1, 0
	MOVWF      R1
	MOVLW      128
	XORWF      FARG_angle_2_b+2, 0
	MOVWF      R2
	MOVLW      0
	XORWF      FARG_angle_2_b+3, 0
	MOVWF      R3
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
L_angle_242:
	MOVF       R4, 0
	MOVWF      FARG_angle_2_b+0
	MOVF       R5, 0
	MOVWF      FARG_angle_2_b+1
	MOVF       R6, 0
	MOVWF      FARG_angle_2_b+2
	MOVF       R7, 0
	MOVWF      FARG_angle_2_b+3
;angle_v1.c,364 :: 		for(i=0; i<=200; i++){
	CLRF       angle_2_i_L0+0
	CLRF       angle_2_i_L0+1
L_angle_243:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_2_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_278
	MOVF       angle_2_i_L0+0, 0
	SUBLW      200
L__angle_278:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_244
;angle_v1.c,365 :: 		if(-0.002<=(t[i]-a/b) && (t[i]-a/b)<=0.002)
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
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
	MOVWF      FLOC__angle_2+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+3
	MOVF       FARG_angle_2_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_2_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_2_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_2_b+3, 0
	MOVWF      R7
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R1
	MOVF       FARG_angle_2_a+2, 0
	MOVWF      R2
	MOVF       FARG_angle_2_a+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__angle_2+0, 0
	MOVWF      R0
	MOVF       FLOC__angle_2+1, 0
	MOVWF      R1
	MOVF       FLOC__angle_2+2, 0
	MOVWF      R2
	MOVF       FLOC__angle_2+3, 0
	MOVWF      R3
	CALL       _Sub_32x32_FP+0
	MOVLW      111
	MOVWF      R4
	MOVLW      18
	MOVWF      R5
	MOVLW      131
	MOVWF      R6
	MOVLW      118
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_248
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
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
	MOVWF      FLOC__angle_2+0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+2
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      FLOC__angle_2+3
	MOVF       FARG_angle_2_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_2_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_2_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_2_b+3, 0
	MOVWF      R7
	MOVF       FARG_angle_2_a+0, 0
	MOVWF      R0
	MOVF       FARG_angle_2_a+1, 0
	MOVWF      R1
	MOVF       FARG_angle_2_a+2, 0
	MOVWF      R2
	MOVF       FARG_angle_2_a+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      R4
	MOVF       R1, 0
	MOVWF      R5
	MOVF       R2, 0
	MOVWF      R6
	MOVF       R3, 0
	MOVWF      R7
	MOVF       FLOC__angle_2+0, 0
	MOVWF      R0
	MOVF       FLOC__angle_2+1, 0
	MOVWF      R1
	MOVF       FLOC__angle_2+2, 0
	MOVWF      R2
	MOVF       FLOC__angle_2+3, 0
	MOVWF      R3
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
	MOVLW      118
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_248
L__angle_261:
;angle_v1.c,366 :: 		return i;
	MOVF       angle_2_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_2_i_L0+1, 0
	MOVWF      R1
	GOTO       L_end_angle_2
L_angle_248:
;angle_v1.c,364 :: 		for(i=0; i<=200; i++){
	INCF       angle_2_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_2_i_L0+1, 1
;angle_v1.c,367 :: 		}
	GOTO       L_angle_243
L_angle_244:
;angle_v1.c,369 :: 		return 999;
	MOVLW      231
	MOVWF      R0
	MOVLW      3
	MOVWF      R1
;angle_v1.c,370 :: 		}
L_end_angle_2:
	RETURN
; end of _angle_2

_angle_3:

;angle_v1.c,372 :: 		int angle_3(double a, double b, double c)
;angle_v1.c,377 :: 		a=(a>=0) ? a : -a;
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
	GOTO       L_angle_349
	MOVF       FARG_angle_3_a+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_a+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_a+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_a+3, 0
	MOVWF      R7
	GOTO       L_angle_350
L_angle_349:
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
L_angle_350:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_a+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_a+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_a+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_a+3
;angle_v1.c,378 :: 		b=(b>=0) ? b : -b;
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
	GOTO       L_angle_351
	MOVF       FARG_angle_3_b+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_b+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_b+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_b+3, 0
	MOVWF      R7
	GOTO       L_angle_352
L_angle_351:
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
L_angle_352:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_b+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_b+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_b+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_b+3
;angle_v1.c,379 :: 		c=(c>=0) ? c : -c;
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
	GOTO       L_angle_353
	MOVF       FARG_angle_3_c+0, 0
	MOVWF      R4
	MOVF       FARG_angle_3_c+1, 0
	MOVWF      R5
	MOVF       FARG_angle_3_c+2, 0
	MOVWF      R6
	MOVF       FARG_angle_3_c+3, 0
	MOVWF      R7
	GOTO       L_angle_354
L_angle_353:
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
L_angle_354:
	MOVF       R4, 0
	MOVWF      FARG_angle_3_c+0
	MOVF       R5, 0
	MOVWF      FARG_angle_3_c+1
	MOVF       R6, 0
	MOVWF      FARG_angle_3_c+2
	MOVF       R7, 0
	MOVWF      FARG_angle_3_c+3
;angle_v1.c,381 :: 		tmp=a/sqrt(b*b+c*c);
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
;angle_v1.c,383 :: 		for(i=0; i<=200; i++){
	CLRF       angle_3_i_L0+0
	CLRF       angle_3_i_L0+1
L_angle_355:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_3_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_380
	MOVF       angle_3_i_L0+0, 0
	SUBLW      200
L__angle_380:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_356
;angle_v1.c,384 :: 		if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
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
	MOVLW      118
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_360
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
	MOVLW      118
	MOVWF      R3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_angle_360
L__angle_362:
;angle_v1.c,385 :: 		return i;
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	GOTO       L_end_angle_3
L_angle_360:
;angle_v1.c,383 :: 		for(i=0; i<=200; i++){
	INCF       angle_3_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_3_i_L0+1, 1
;angle_v1.c,386 :: 		}
	GOTO       L_angle_355
L_angle_356:
;angle_v1.c,388 :: 		return -999;
	MOVLW      25
	MOVWF      R0
	MOVLW      252
	MOVWF      R1
;angle_v1.c,389 :: 		}
L_end_angle_3:
	RETURN
; end of _angle_3
