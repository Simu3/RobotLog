
_main:

;angle_v2.c,219 :: 		void main()
;angle_v2.c,227 :: 		ax_bias=ay_bias=jx_bias=jy_bias=ax=ay=az=jx=jy=0.0;
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
	CLRF       main_jy_bias_L0+0
	CLRF       main_jy_bias_L0+1
	CLRF       main_jy_bias_L0+2
	CLRF       main_jy_bias_L0+3
	CLRF       main_jx_bias_L0+0
	CLRF       main_jx_bias_L0+1
	CLRF       main_jx_bias_L0+2
	CLRF       main_jx_bias_L0+3
	CLRF       main_ay_bias_L0+0
	CLRF       main_ay_bias_L0+1
	CLRF       main_ay_bias_L0+2
	CLRF       main_ay_bias_L0+3
	CLRF       main_ax_bias_L0+0
	CLRF       main_ax_bias_L0+1
	CLRF       main_ax_bias_L0+2
	CLRF       main_ax_bias_L0+3
;angle_v2.c,228 :: 		x=y=0;
	CLRF       main_y_L0+0
	CLRF       main_y_L0+1
	CLRF       main_x_L0+0
	CLRF       main_x_L0+1
;angle_v2.c,230 :: 		setup();
	CALL       _setup+0
;angle_v2.c,232 :: 		for(i=0; i<100; i++){
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
;angle_v2.c,233 :: 		ax_bias+=ADC_read(AX);
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
;angle_v2.c,234 :: 		ay_bias+=ADC_read(AY);
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
;angle_v2.c,235 :: 		jx_bias+=ADC_read(JX);
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jx_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jx_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jx_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jx_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jx_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jx_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jx_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jx_bias_L0+3
;angle_v2.c,236 :: 		jy_bias+=ADC_read(JY);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       main_jy_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jy_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jy_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jy_bias_L0+3, 0
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jy_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jy_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jy_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jy_bias_L0+3
;angle_v2.c,232 :: 		for(i=0; i<100; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v2.c,237 :: 		}
	GOTO       L_main0
L_main1:
;angle_v2.c,239 :: 		ax_bias=ax_bias/100.0;
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
;angle_v2.c,240 :: 		ay_bias=ay_bias/100.0;
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
;angle_v2.c,241 :: 		jx_bias=jx_bias/100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_jx_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_jx_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_jx_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_jx_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jx_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jx_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jx_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jx_bias_L0+3
;angle_v2.c,242 :: 		jy_bias=jy_bias/100.0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	MOVF       main_jy_bias_L0+0, 0
	MOVWF      R0
	MOVF       main_jy_bias_L0+1, 0
	MOVWF      R1
	MOVF       main_jy_bias_L0+2, 0
	MOVWF      R2
	MOVF       main_jy_bias_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jy_bias_L0+0
	MOVF       R1, 0
	MOVWF      main_jy_bias_L0+1
	MOVF       R2, 0
	MOVWF      main_jy_bias_L0+2
	MOVF       R3, 0
	MOVWF      main_jy_bias_L0+3
;angle_v2.c,244 :: 		while(1){
L_main3:
;angle_v2.c,245 :: 		ax=ay=az=jx=jy=0.0;
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
;angle_v2.c,247 :: 		for(i=0; i<100; i++){
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
;angle_v2.c,248 :: 		ax+=ADC_read(AX);
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
;angle_v2.c,249 :: 		ay+=ADC_read(AY);
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
;angle_v2.c,250 :: 		az+=ADC_read(AZ);
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
;angle_v2.c,251 :: 		jx+=ADC_read(JX);
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
;angle_v2.c,252 :: 		jy+=ADC_read(JY);
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
;angle_v2.c,247 :: 		for(i=0; i<100; i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;angle_v2.c,253 :: 		}
	GOTO       L_main5
L_main6:
;angle_v2.c,255 :: 		ax=ax/100.0-ax_bias;
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
;angle_v2.c,256 :: 		ay=ay/100.0-ay_bias;
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
;angle_v2.c,257 :: 		az=az/100.0-AZBIAS;
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
;angle_v2.c,258 :: 		jx=jx/100.0-jx_bias;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
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
	MOVF       main_jx_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jx_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jx_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jx_bias_L0+3, 0
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
;angle_v2.c,259 :: 		jy=jy/100.0-jy_bias;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
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
	MOVF       main_jy_bias_L0+0, 0
	MOVWF      R4
	MOVF       main_jy_bias_L0+1, 0
	MOVWF      R5
	MOVF       main_jy_bias_L0+2, 0
	MOVWF      R6
	MOVF       main_jy_bias_L0+3, 0
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
;angle_v2.c,261 :: 		x=(ax>=0.0) ? angle_3(ax, ay, az) : -angle_3(ax, ay, az);
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
L_main9:
	MOVF       FLOC__main+0, 0
	MOVWF      main_x_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_x_L0+1
;angle_v2.c,262 :: 		y=(ay>=0.0) ? angle_3(ay, ax, az) : -angle_3(ay, ax, az);
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
L_main11:
	MOVF       FLOC__main+0, 0
	MOVWF      main_y_L0+0
	MOVF       FLOC__main+1, 0
	MOVWF      main_y_L0+1
;angle_v2.c,264 :: 		jx=jx*D2V*SEN;
	MOVF       main_jx_L0+0, 0
	MOVWF      R0
	MOVF       main_jx_L0+1, 0
	MOVWF      R1
	MOVF       main_jx_L0+2, 0
	MOVWF      R2
	MOVF       main_jx_L0+3, 0
	MOVWF      R3
	MOVLW      9
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      245
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      21
	MOVWF      R6
	MOVLW      134
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jx_L0+0
	MOVF       R1, 0
	MOVWF      main_jx_L0+1
	MOVF       R2, 0
	MOVWF      main_jx_L0+2
	MOVF       R3, 0
	MOVWF      main_jx_L0+3
;angle_v2.c,265 :: 		jy=jy*D2V*SEN;
	MOVF       main_jy_L0+0, 0
	MOVWF      R0
	MOVF       main_jy_L0+1, 0
	MOVWF      R1
	MOVF       main_jy_L0+2, 0
	MOVWF      R2
	MOVF       main_jy_L0+3, 0
	MOVWF      R3
	MOVLW      9
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      245
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      21
	MOVWF      R6
	MOVLW      134
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      main_jy_L0+0
	MOVF       R1, 0
	MOVWF      main_jy_L0+1
	MOVF       R2, 0
	MOVWF      main_jy_L0+2
	MOVF       R3, 0
	MOVWF      main_jy_L0+3
;angle_v2.c,267 :: 		if(x>=200)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      200
	SUBWF      main_x_L0+0, 0
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
;angle_v2.c,268 :: 		x=200;
	MOVLW      200
	MOVWF      main_x_L0+0
	CLRF       main_x_L0+1
	GOTO       L_main13
L_main12:
;angle_v2.c,269 :: 		else if(x<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       main_x_L0+0, 0
	SUBLW      56
L__main57:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
;angle_v2.c,270 :: 		x=-200;
	MOVLW      56
	MOVWF      main_x_L0+0
	MOVLW      255
	MOVWF      main_x_L0+1
L_main14:
L_main13:
;angle_v2.c,272 :: 		if(y>=200)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      200
	SUBWF      main_y_L0+0, 0
L__main58:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
;angle_v2.c,273 :: 		y=200;
	MOVLW      200
	MOVWF      main_y_L0+0
	CLRF       main_y_L0+1
	GOTO       L_main16
L_main15:
;angle_v2.c,274 :: 		else if(y<=-200)
	MOVLW      128
	XORLW      255
	MOVWF      R0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVF       main_y_L0+0, 0
	SUBLW      56
L__main59:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;angle_v2.c,275 :: 		y=-200;
	MOVLW      56
	MOVWF      main_y_L0+0
	MOVLW      255
	MOVWF      main_y_L0+1
L_main17:
L_main16:
;angle_v2.c,277 :: 		debug(x, y, jx, jy);
	MOVF       main_x_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_x_L0+1, 0
	MOVWF      FARG_debug+1
	MOVF       main_y_L0+0, 0
	MOVWF      FARG_debug+0
	MOVF       main_y_L0+1, 0
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
;angle_v2.c,278 :: 		}
	GOTO       L_main3
;angle_v2.c,279 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;angle_v2.c,281 :: 		void setup()
;angle_v2.c,283 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;angle_v2.c,285 :: 		ANSELA=0x2F;
	MOVLW      47
	MOVWF      ANSELA+0
;angle_v2.c,286 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;angle_v2.c,287 :: 		ANSELD=0x00;
	CLRF       ANSELD+0
;angle_v2.c,288 :: 		ANSELE=0x00;
	CLRF       ANSELE+0
;angle_v2.c,289 :: 		TRISA=0x2F;
	MOVLW      47
	MOVWF      TRISA+0
;angle_v2.c,290 :: 		TRISB=0x00;
	CLRF       TRISB+0
;angle_v2.c,291 :: 		TRISC=0x00;
	CLRF       TRISC+0
;angle_v2.c,292 :: 		TRISD=0x00;
	CLRF       TRISD+0
;angle_v2.c,293 :: 		TRISE=0x00;
	CLRF       TRISE+0
;angle_v2.c,295 :: 		PORTA=0x00;
	CLRF       PORTA+0
;angle_v2.c,296 :: 		PORTB=0x00;
	CLRF       PORTB+0
;angle_v2.c,297 :: 		PORTC=0x00;
	CLRF       PORTC+0
;angle_v2.c,298 :: 		PORTD=0x00;
	CLRF       PORTD+0
;angle_v2.c,299 :: 		PORTE=0x00;
	CLRF       PORTE+0
;angle_v2.c,301 :: 		ADC_Init();
	CALL       _ADC_Init+0
;angle_v2.c,303 :: 		UART1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;angle_v2.c,305 :: 		delay_ms(1000);
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
;angle_v2.c,306 :: 		}
L_end_setup:
	RETURN
; end of _setup

_debug:

;angle_v2.c,308 :: 		void debug(int x, int y, int jx, int jy)
;angle_v2.c,310 :: 		UART_write((x>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_x+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug62
	MOVLW      0
	SUBWF      FARG_debug_x+0, 0
L__debug62:
	BTFSS      STATUS+0, 0
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
;angle_v2.c,311 :: 		x=abs(x);
	MOVF       FARG_debug_x+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_x+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_x+0
	MOVF       R1, 0
	MOVWF      FARG_debug_x+1
;angle_v2.c,312 :: 		UART_write(dec2ascii((x%1000-x%100)/100));
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
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
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
;angle_v2.c,313 :: 		UART_write(dec2ascii((x%100-x%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
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
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
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
;angle_v2.c,314 :: 		UART_write(dec2ascii(x%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_x+0, 0
	MOVWF      R0
	MOVF       FARG_debug_x+1, 0
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
;angle_v2.c,315 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,317 :: 		UART_write((y>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_y+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug63
	MOVLW      0
	SUBWF      FARG_debug_y+0, 0
L__debug63:
	BTFSS      STATUS+0, 0
	GOTO       L_debug21
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug22
L_debug21:
	MOVLW      45
	MOVWF      R0
L_debug22:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,318 :: 		y=abs(y);
	MOVF       FARG_debug_y+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_y+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_y+0
	MOVF       R1, 0
	MOVWF      FARG_debug_y+1
;angle_v2.c,319 :: 		UART_write(dec2ascii((y%1000-y%100)/100));
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
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
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
;angle_v2.c,320 :: 		UART_write(dec2ascii((y%100-y%10)/10));
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
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
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
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
;angle_v2.c,321 :: 		UART_write(dec2ascii(y%10));
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_debug_y+0, 0
	MOVWF      R0
	MOVF       FARG_debug_y+1, 0
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
;angle_v2.c,322 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,324 :: 		UART_write((jx>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_jx+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug64
	MOVLW      0
	SUBWF      FARG_debug_jx+0, 0
L__debug64:
	BTFSS      STATUS+0, 0
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
;angle_v2.c,325 :: 		jx=abs(jx);
	MOVF       FARG_debug_jx+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_jx+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_jx+0
	MOVF       R1, 0
	MOVWF      FARG_debug_jx+1
;angle_v2.c,326 :: 		UART_write(dec2ascii((jx%1000-jx%100)/100));
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
;angle_v2.c,327 :: 		UART_write(dec2ascii((jx%100-jx%10)/10));
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
;angle_v2.c,328 :: 		UART_write(dec2ascii(jx%10));
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
;angle_v2.c,329 :: 		UART_write(' ');
	MOVLW      32
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,331 :: 		UART_write((jy>=0) ? '+' : '-');
	MOVLW      128
	XORWF      FARG_debug_jy+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__debug65
	MOVLW      0
	SUBWF      FARG_debug_jy+0, 0
L__debug65:
	BTFSS      STATUS+0, 0
	GOTO       L_debug25
	MOVLW      43
	MOVWF      R0
	GOTO       L_debug26
L_debug25:
	MOVLW      45
	MOVWF      R0
L_debug26:
	MOVF       R0, 0
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,332 :: 		jy=abs(jy);
	MOVF       FARG_debug_jy+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       FARG_debug_jy+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVF       R0, 0
	MOVWF      FARG_debug_jy+0
	MOVF       R1, 0
	MOVWF      FARG_debug_jy+1
;angle_v2.c,333 :: 		UART_write(dec2ascii((jy%1000-jy%100)/100));
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
;angle_v2.c,334 :: 		UART_write(dec2ascii((jy%100-jy%10)/10));
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
;angle_v2.c,335 :: 		UART_write(dec2ascii(jy%10));
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
;angle_v2.c,336 :: 		UART_write('\n');
	MOVLW      10
	MOVWF      FARG_UART_Write__data+0
	CALL       _UART_Write+0
;angle_v2.c,337 :: 		}
L_end_debug:
	RETURN
; end of _debug

_dec2ascii:

;angle_v2.c,339 :: 		char dec2ascii(char dec)
;angle_v2.c,341 :: 		switch(dec){
	GOTO       L_dec2ascii27
;angle_v2.c,342 :: 		case 0: return '0';
L_dec2ascii29:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,343 :: 		case 1: return '1';
L_dec2ascii30:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,344 :: 		case 2: return '2';
L_dec2ascii31:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,345 :: 		case 3: return '3';
L_dec2ascii32:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,346 :: 		case 4: return '4';
L_dec2ascii33:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,347 :: 		case 5: return '5';
L_dec2ascii34:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,348 :: 		case 6: return '6';
L_dec2ascii35:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,349 :: 		case 7: return '7';
L_dec2ascii36:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,350 :: 		case 8: return '8';
L_dec2ascii37:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,351 :: 		case 9: return '9';
L_dec2ascii38:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,352 :: 		default: return '*';
L_dec2ascii39:
	MOVLW      42
	MOVWF      R0
	GOTO       L_end_dec2ascii
;angle_v2.c,353 :: 		}
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
;angle_v2.c,354 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii

_angle_3:

;angle_v2.c,356 :: 		int angle_3(double a, double b, double c)
;angle_v2.c,361 :: 		a=(a>=0) ? a : -a;
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
;angle_v2.c,362 :: 		b=(b>=0) ? b : -b;
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
;angle_v2.c,363 :: 		c=(c>=0) ? c : -c;
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
;angle_v2.c,365 :: 		tmp=a/sqrt(b*b+c*c);
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
;angle_v2.c,367 :: 		for(i=0; i<=200; i++){
	CLRF       angle_3_i_L0+0
	CLRF       angle_3_i_L0+1
L_angle_346:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORWF      angle_3_i_L0+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__angle_368
	MOVF       angle_3_i_L0+0, 0
	SUBLW      200
L__angle_368:
	BTFSS      STATUS+0, 0
	GOTO       L_angle_347
;angle_v2.c,368 :: 		if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
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
	MOVLW      118
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
;angle_v2.c,369 :: 		return i;
	MOVF       angle_3_i_L0+0, 0
	MOVWF      R0
	MOVF       angle_3_i_L0+1, 0
	MOVWF      R1
	GOTO       L_end_angle_3
L_angle_351:
;angle_v2.c,367 :: 		for(i=0; i<=200; i++){
	INCF       angle_3_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       angle_3_i_L0+1, 1
;angle_v2.c,370 :: 		}
	GOTO       L_angle_346
L_angle_347:
;angle_v2.c,372 :: 		return 999;
	MOVLW      231
	MOVWF      R0
	MOVLW      3
	MOVWF      R1
;angle_v2.c,373 :: 		}
L_end_angle_3:
	RETURN
; end of _angle_3
