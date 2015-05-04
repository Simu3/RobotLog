
_main:

;jyro_angle.c,44 :: 		void main()
;jyro_angle.c,49 :: 		set_up(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_set_up+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_set_up+1
	CALL       _set_up+0
;jyro_angle.c,50 :: 		read_bias(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_read_bias+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_read_bias+1
	CALL       _read_bias+0
;jyro_angle.c,52 :: 		while(1){
L_main0:
;jyro_angle.c,53 :: 		for(j=0; j<10; j++){                                                        //二重積分を行って
	CLRF       main_j_L0+0
L_main2:
	MOVLW      128
	XORWF      main_j_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;jyro_angle.c,54 :: 		data_ary[old_v].x=data_ary[new_v].x;                                      //それぞれの積分で
	MOVF       main_data_ary_L0+40, 0
	MOVWF      main_data_ary_L0+32
	MOVF       main_data_ary_L0+41, 0
	MOVWF      main_data_ary_L0+33
	MOVF       main_data_ary_L0+42, 0
	MOVWF      main_data_ary_L0+34
	MOVF       main_data_ary_L0+43, 0
	MOVWF      main_data_ary_L0+35
;jyro_angle.c,55 :: 		data_ary[old_v].y=data_ary[new_v].y;                                      //10回分の平均をとっている
	MOVF       main_data_ary_L0+44, 0
	MOVWF      main_data_ary_L0+36
	MOVF       main_data_ary_L0+45, 0
	MOVWF      main_data_ary_L0+37
	MOVF       main_data_ary_L0+46, 0
	MOVWF      main_data_ary_L0+38
	MOVF       main_data_ary_L0+47, 0
	MOVWF      main_data_ary_L0+39
;jyro_angle.c,57 :: 		for(i=0; i<10; i++){                                                      //測定の間隔はタイマーレジスタにより
	CLRF       main_i_L0+0
L_main5:
	MOVLW      128
	XORWF      main_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;jyro_angle.c,58 :: 		INTCON.TMR0IF=0;                                                        //約0.1[ms]となっているため
	BCF        INTCON+0, 2
;jyro_angle.c,59 :: 		TMR0=0;                                                                 //最終的な角度の値が算出されるのは
	CLRF       TMR0+0
;jyro_angle.c,60 :: 		flag=0;                                                                 //10[ms]毎となる
	BCF        main_flag_L0+0, BitPos(main_flag_L0+0)
;jyro_angle.c,61 :: 		data_ary[old_a].x=data_ary[new_a].x;                                    //
	MOVF       main_data_ary_L0+24, 0
	MOVWF      main_data_ary_L0+16
	MOVF       main_data_ary_L0+25, 0
	MOVWF      main_data_ary_L0+17
	MOVF       main_data_ary_L0+26, 0
	MOVWF      main_data_ary_L0+18
	MOVF       main_data_ary_L0+27, 0
	MOVWF      main_data_ary_L0+19
;jyro_angle.c,62 :: 		data_ary[old_a].y=data_ary[new_a].y;                                    //
	MOVF       main_data_ary_L0+28, 0
	MOVWF      main_data_ary_L0+20
	MOVF       main_data_ary_L0+29, 0
	MOVWF      main_data_ary_L0+21
	MOVF       main_data_ary_L0+30, 0
	MOVWF      main_data_ary_L0+22
	MOVF       main_data_ary_L0+31, 0
	MOVWF      main_data_ary_L0+23
;jyro_angle.c,63 :: 		do{                                                                     //
L_main8:
;jyro_angle.c,64 :: 		if(INTCON.TMR0IF==1){                                                 //
	BTFSS      INTCON+0, 2
	GOTO       L_main11
;jyro_angle.c,65 :: 		read(data_ary);                                                     //
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_read+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_read+1
	CALL       _read+0
;jyro_angle.c,66 :: 		md2aa(data_ary);                                                    //
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_md2aa+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_md2aa+1
	CALL       _md2aa+0
;jyro_angle.c,67 :: 		flag=1;                                                             //
	BSF        main_flag_L0+0, BitPos(main_flag_L0+0)
;jyro_angle.c,68 :: 		}                                                                     //
L_main11:
;jyro_angle.c,69 :: 		}while(flag==0);                                                        //
	BTFSS      main_flag_L0+0, BitPos(main_flag_L0+0)
	GOTO       L_main8
;jyro_angle.c,70 :: 		aa2av(data_ary);                                                        //
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_aa2av+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_aa2av+1
	CALL       _aa2av+0
;jyro_angle.c,57 :: 		for(i=0; i<10; i++){                                                      //測定の間隔はタイマーレジスタにより
	INCF       main_i_L0+0, 1
;jyro_angle.c,71 :: 		}                                                                         //
	GOTO       L_main5
L_main6:
;jyro_angle.c,76 :: 		av2a(data_ary);                                                           //
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_av2a+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_av2a+1
	CALL       _av2a+0
;jyro_angle.c,53 :: 		for(j=0; j<10; j++){                                                        //二重積分を行って
	INCF       main_j_L0+0, 1
;jyro_angle.c,77 :: 		}                                                                           //
	GOTO       L_main2
L_main3:
;jyro_angle.c,82 :: 		pout(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_pout+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_pout+1
	CALL       _pout+0
;jyro_angle.c,83 :: 		}
	GOTO       L_main0
;jyro_angle.c,84 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_set_up:

;jyro_angle.c,86 :: 		void set_up(_data data_ary[])
;jyro_angle.c,90 :: 		OSCCON=0x70;                                                                  //oscillator set up : frequency of inside oscillator ← 8[MHz]
	MOVLW      112
	MOVWF      OSCCON+0
;jyro_angle.c,91 :: 		OPTION_REG=0x08;                                                              //Timer0 set up
	MOVLW      8
	MOVWF      OPTION_REG+0
;jyro_angle.c,93 :: 		ANSELA=0x03;                                                                  //A/D set up : analog(0,1), digital(2,3,4,5,6,7)
	MOVLW      3
	MOVWF      ANSELA+0
;jyro_angle.c,94 :: 		ANSELB=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
	CLRF       ANSELB+0
;jyro_angle.c,95 :: 		ANSELD=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
	CLRF       ANSELD+0
;jyro_angle.c,96 :: 		ANSELE=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2)
	CLRF       ANSELE+0
;jyro_angle.c,97 :: 		TRISA=0x03;                                                                   //I/O set up : input(0,1), output(2,3,4,5,6,7)
	MOVLW      3
	MOVWF      TRISA+0
;jyro_angle.c,98 :: 		TRISB=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISB+0
;jyro_angle.c,99 :: 		TRISC=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISC+0
;jyro_angle.c,100 :: 		TRISD=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISD+0
;jyro_angle.c,101 :: 		TRISE=0x00;                                                                   //I/O set up : input(none), output(0,1,2)
	CLRF       TRISE+0
;jyro_angle.c,103 :: 		PORTA=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTA+0
;jyro_angle.c,104 :: 		PORTB=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTB+0
;jyro_angle.c,105 :: 		PORTC=0x00;                                                                   //initialize : PORTC ← 0
	CLRF       PORTC+0
;jyro_angle.c,106 :: 		PORTD=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTD+0
;jyro_angle.c,107 :: 		PORTE=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTE+0
;jyro_angle.c,109 :: 		ADC_Init();                                                                   //initialize : A/D convert library
	CALL       _ADC_Init+0
;jyro_angle.c,111 :: 		UART1_Init(9600);                                                             //initialize : baudrate ← 9600
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;jyro_angle.c,113 :: 		for(i=bias; i<angle; i++){                                                    //initialize : data structure
	CLRF       set_up_i_L0+0
L_set_up12:
	MOVLW      128
	BTFSC      set_up_i_L0+0, 7
	MOVLW      127
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_up23
	MOVLW      6
	SUBWF      set_up_i_L0+0, 0
L__set_up23:
	BTFSC      STATUS+0, 0
	GOTO       L_set_up13
;jyro_angle.c,114 :: 		data_ary[i].x=0.0;                                                          //    ｜
	MOVLW      3
	MOVWF      R2
	MOVF       set_up_i_L0+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	MOVF       R2, 0
L__set_up24:
	BTFSC      STATUS+0, 2
	GOTO       L__set_up25
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__set_up24
L__set_up25:
	MOVF       R0, 0
	ADDWF      FARG_set_up_data_ary+0, 0
	MOVWF      FSR1L
	MOVF       R1, 0
	ADDWFC     FARG_set_up_data_ary+1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;jyro_angle.c,115 :: 		data_ary[i].y=0.0;                                                          //    ↓
	MOVLW      3
	MOVWF      R2
	MOVF       set_up_i_L0+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	MOVF       R2, 0
L__set_up26:
	BTFSC      STATUS+0, 2
	GOTO       L__set_up27
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__set_up26
L__set_up27:
	MOVF       FARG_set_up_data_ary+0, 0
	ADDWF      R0, 1
	MOVF       FARG_set_up_data_ary+1, 0
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
;jyro_angle.c,113 :: 		for(i=bias; i<angle; i++){                                                    //initialize : data structure
	INCF       set_up_i_L0+0, 1
;jyro_angle.c,116 :: 		}                                                                             //   end
	GOTO       L_set_up12
L_set_up13:
;jyro_angle.c,117 :: 		}
L_end_set_up:
	RETURN
; end of _set_up

_read:

;jyro_angle.c,119 :: 		void read(_data data_ary[])
;jyro_angle.c,121 :: 		data_ary[md].x=ADC_read(AN_X);
	MOVLW      8
	ADDWF      FARG_read_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_read_data_ary+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__read+0
	MOVF       R1, 0
	MOVWF      FLOC__read+1
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FLOC__read+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read+1, 0
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
;jyro_angle.c,122 :: 		data_ary[md].y=ADC_read(AN_Y);
	MOVLW      8
	ADDWF      FARG_read_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_read_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FLOC__read+0
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__read+1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FLOC__read+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read+1, 0
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
;jyro_angle.c,123 :: 		}
L_end_read:
	RETURN
; end of _read

_read_bias:

;jyro_angle.c,125 :: 		void read_bias(_data data_ary[])
;jyro_angle.c,129 :: 		for(i=0; i<1000; i++){                                                        //average : measurement data
	CLRF       read_bias_i_L0+0
	CLRF       read_bias_i_L0+1
L_read_bias15:
	MOVLW      128
	XORWF      read_bias_i_L0+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      3
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__read_bias30
	MOVLW      232
	SUBWF      read_bias_i_L0+0, 0
L__read_bias30:
	BTFSC      STATUS+0, 0
	GOTO       L_read_bias16
;jyro_angle.c,130 :: 		data_ary[bias].x+=ADC_read(AN_X);                                           //   ｜
	MOVF       FARG_read_bias_data_ary+0, 0
	MOVWF      FLOC__read_bias+0
	MOVF       FARG_read_bias_data_ary+1, 0
	MOVWF      FLOC__read_bias+1
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__read_bias+1, 0
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
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read_bias+1, 0
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
;jyro_angle.c,131 :: 		data_ary[bias].y+=ADC_read(AN_Y);                                           //   ｜
	MOVLW      4
	ADDWF      FARG_read_bias_data_ary+0, 0
	MOVWF      FLOC__read_bias+0
	MOVLW      0
	ADDWFC     FARG_read_bias_data_ary+1, 0
	MOVWF      FLOC__read_bias+1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__read_bias+1, 0
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
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read_bias+1, 0
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
;jyro_angle.c,132 :: 		delay_ms(1);                                                                //   ↓
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_read_bias18:
	DECFSZ     R13, 1
	GOTO       L_read_bias18
	DECFSZ     R12, 1
	GOTO       L_read_bias18
	NOP
	NOP
;jyro_angle.c,129 :: 		for(i=0; i<1000; i++){                                                        //average : measurement data
	INCF       read_bias_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       read_bias_i_L0+1, 1
;jyro_angle.c,133 :: 		}                                                                             //  end
	GOTO       L_read_bias15
L_read_bias16:
;jyro_angle.c,135 :: 		data_ary[bias].x=data_ary[bias].x/1000.0*D2A/SEN;                             //convert : measurement data → angular acceleration(0°)
	MOVF       FARG_read_bias_data_ary+0, 0
	MOVWF      FLOC__read_bias+0
	MOVF       FARG_read_bias_data_ary+1, 0
	MOVWF      FLOC__read_bias+1
	MOVF       FARG_read_bias_data_ary+0, 0
	MOVWF      FSR0L
	MOVF       FARG_read_bias_data_ary+1, 0
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
	MOVLW      122
	MOVWF      R6
	MOVLW      136
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVLW      10
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      31
	MOVWF      R4
	MOVLW      133
	MOVWF      R5
	MOVLW      43
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read_bias+1, 0
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
;jyro_angle.c,136 :: 		data_ary[bias].y=data_ary[bias].y/1000.0*D2A/SEN;
	MOVLW      4
	ADDWF      FARG_read_bias_data_ary+0, 0
	MOVWF      FLOC__read_bias+0
	MOVLW      0
	ADDWFC     FARG_read_bias_data_ary+1, 0
	MOVWF      FLOC__read_bias+1
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__read_bias+1, 0
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
	MOVLW      122
	MOVWF      R6
	MOVLW      136
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVLW      10
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      31
	MOVWF      R4
	MOVLW      133
	MOVWF      R5
	MOVLW      43
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__read_bias+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__read_bias+1, 0
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
;jyro_angle.c,137 :: 		}
L_end_read_bias:
	RETURN
; end of _read_bias

_md2aa:

;jyro_angle.c,139 :: 		void md2aa(_data data_ary[])
;jyro_angle.c,141 :: 		data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)*D2A/SEN;
	MOVLW      24
	ADDWF      FARG_md2aa_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_md2aa_data_ary+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__md2aa+0
	MOVF       R1, 0
	MOVWF      FLOC__md2aa+1
	MOVLW      8
	ADDWF      FARG_md2aa_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_md2aa_data_ary+1, 0
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
	MOVF       FARG_md2aa_data_ary+0, 0
	MOVWF      FSR0L
	MOVF       FARG_md2aa_data_ary+1, 0
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
	CALL       _Sub_32x32_FP+0
	MOVLW      10
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      31
	MOVWF      R4
	MOVLW      133
	MOVWF      R5
	MOVLW      43
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__md2aa+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__md2aa+1, 0
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
;jyro_angle.c,142 :: 		data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)*D2A/SEN;
	MOVLW      24
	ADDWF      FARG_md2aa_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_md2aa_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FLOC__md2aa+0
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__md2aa+1
	MOVLW      8
	ADDWF      FARG_md2aa_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_md2aa_data_ary+1, 0
	MOVWF      R1
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
	MOVLW      4
	ADDWF      FARG_md2aa_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_md2aa_data_ary+1, 0
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
	CALL       _Sub_32x32_FP+0
	MOVLW      10
	MOVWF      R4
	MOVLW      40
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      31
	MOVWF      R4
	MOVLW      133
	MOVWF      R5
	MOVLW      43
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__md2aa+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__md2aa+1, 0
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
;jyro_angle.c,143 :: 		}
L_end_md2aa:
	RETURN
; end of _md2aa

_aa2av:

;jyro_angle.c,145 :: 		void aa2av(_data data_ary[])
;jyro_angle.c,147 :: 		data_ary[new_v].x+=(data_ary[old_a].x+data_ary[new_a].x)*MC/2.0;
	MOVLW      40
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__aa2av+0
	MOVF       R1, 0
	MOVWF      FLOC__aa2av+1
	MOVLW      16
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
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
	MOVLW      24
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
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
	CALL       _Add_32x32_FP+0
	MOVLW      189
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      6
	MOVWF      R6
	MOVLW      114
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__aa2av+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__aa2av+1, 0
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
	MOVF       FLOC__aa2av+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__aa2av+1, 0
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
;jyro_angle.c,148 :: 		data_ary[new_v].y+=(data_ary[old_a].y+data_ary[new_a].y)*MC/2.0;
	MOVLW      40
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FLOC__aa2av+0
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__aa2av+1
	MOVLW      16
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
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
	MOVLW      24
	ADDWF      FARG_aa2av_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_aa2av_data_ary+1, 0
	MOVWF      R1
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
	CALL       _Add_32x32_FP+0
	MOVLW      189
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      6
	MOVWF      R6
	MOVLW      114
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__aa2av+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__aa2av+1, 0
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
	MOVF       FLOC__aa2av+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__aa2av+1, 0
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
;jyro_angle.c,149 :: 		}
L_end_aa2av:
	RETURN
; end of _aa2av

_av2a:

;jyro_angle.c,151 :: 		void av2a(_data data_ary[])
;jyro_angle.c,153 :: 		data_ary[angle].x+=(data_ary[old_v].x+data_ary[new_v].x)*MC/2.0;
	MOVLW      48
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__av2a+0
	MOVF       R1, 0
	MOVWF      FLOC__av2a+1
	MOVLW      32
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
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
	MOVLW      40
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
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
	CALL       _Add_32x32_FP+0
	MOVLW      189
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      6
	MOVWF      R6
	MOVLW      114
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__av2a+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__av2a+1, 0
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
	MOVF       FLOC__av2a+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__av2a+1, 0
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
;jyro_angle.c,154 :: 		data_ary[angle].y+=(data_ary[old_v].y+data_ary[new_v].y)*MC/2.0;
	MOVLW      48
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FLOC__av2a+0
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FLOC__av2a+1
	MOVLW      32
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
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
	MOVLW      40
	ADDWF      FARG_av2a_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_av2a_data_ary+1, 0
	MOVWF      R1
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
	CALL       _Add_32x32_FP+0
	MOVLW      189
	MOVWF      R4
	MOVLW      55
	MOVWF      R5
	MOVLW      6
	MOVWF      R6
	MOVLW      114
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      128
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__av2a+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__av2a+1, 0
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
	MOVF       FLOC__av2a+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__av2a+1, 0
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
;jyro_angle.c,155 :: 		}
L_end_av2a:
	RETURN
; end of _av2a

_pout:

;jyro_angle.c,157 :: 		void pout(_data data_ary[])
;jyro_angle.c,159 :: 		char tmp[10]={0,0,0,0,0,0,0,0,0,0};
	CLRF       pout_tmp_L0+0
	CLRF       pout_tmp_L0+1
	CLRF       pout_tmp_L0+2
	CLRF       pout_tmp_L0+3
	CLRF       pout_tmp_L0+4
	CLRF       pout_tmp_L0+5
	CLRF       pout_tmp_L0+6
	CLRF       pout_tmp_L0+7
	CLRF       pout_tmp_L0+8
	CLRF       pout_tmp_L0+9
;jyro_angle.c,161 :: 		dec2bit((int)(data_ary[angle].x*10.0+0.5), tmp);                              //convert : double → int (floating point 1)*10
	MOVLW      48
	ADDWF      FARG_pout_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_pout_data_ary+1, 0
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
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_dec2bit+0
	MOVF       R1, 0
	MOVWF      FARG_dec2bit+1
	MOVLW      pout_tmp_L0+0
	MOVWF      FARG_dec2bit+0
	MOVLW      hi_addr(pout_tmp_L0+0)
	MOVWF      FARG_dec2bit+1
	CALL       _dec2bit+0
;jyro_angle.c,162 :: 		XSIGN=tmp[sign];
	BTFSC      pout_tmp_L0+0, 0
	GOTO       L__pout35
	BCF        PORTE+0, 1
	GOTO       L__pout36
L__pout35:
	BSF        PORTE+0, 1
L__pout36:
;jyro_angle.c,163 :: 		X8=tmp[bit8];
	BTFSC      pout_tmp_L0+1, 0
	GOTO       L__pout37
	BCF        PORTE+0, 2
	GOTO       L__pout38
L__pout37:
	BSF        PORTE+0, 2
L__pout38:
;jyro_angle.c,164 :: 		X7=tmp[bit7];
	BTFSC      pout_tmp_L0+2, 0
	GOTO       L__pout39
	BCF        PORTA+0, 7
	GOTO       L__pout40
L__pout39:
	BSF        PORTA+0, 7
L__pout40:
;jyro_angle.c,165 :: 		X6=tmp[bit6];
	BTFSC      pout_tmp_L0+3, 0
	GOTO       L__pout41
	BCF        PORTA+0, 6
	GOTO       L__pout42
L__pout41:
	BSF        PORTA+0, 6
L__pout42:
;jyro_angle.c,166 :: 		X5=tmp[bit5];
	BTFSC      pout_tmp_L0+4, 0
	GOTO       L__pout43
	BCF        PORTC+0, 0
	GOTO       L__pout44
L__pout43:
	BSF        PORTC+0, 0
L__pout44:
;jyro_angle.c,167 :: 		X4=tmp[bit4];
	BTFSC      pout_tmp_L0+5, 0
	GOTO       L__pout45
	BCF        PORTC+0, 1
	GOTO       L__pout46
L__pout45:
	BSF        PORTC+0, 1
L__pout46:
;jyro_angle.c,168 :: 		X3=tmp[bit3];
	BTFSC      pout_tmp_L0+6, 0
	GOTO       L__pout47
	BCF        PORTC+0, 2
	GOTO       L__pout48
L__pout47:
	BSF        PORTC+0, 2
L__pout48:
;jyro_angle.c,169 :: 		X2=tmp[bit2];
	BTFSC      pout_tmp_L0+7, 0
	GOTO       L__pout49
	BCF        PORTC+0, 3
	GOTO       L__pout50
L__pout49:
	BSF        PORTC+0, 3
L__pout50:
;jyro_angle.c,170 :: 		X1=tmp[bit1];
	BTFSC      pout_tmp_L0+8, 0
	GOTO       L__pout51
	BCF        PORTD+0, 0
	GOTO       L__pout52
L__pout51:
	BSF        PORTD+0, 0
L__pout52:
;jyro_angle.c,171 :: 		X0=tmp[bit0];
	BTFSC      pout_tmp_L0+9, 0
	GOTO       L__pout53
	BCF        PORTD+0, 1
	GOTO       L__pout54
L__pout53:
	BSF        PORTD+0, 1
L__pout54:
;jyro_angle.c,173 :: 		dec2bit((int)(data_ary[angle].y*10.0+0.5), tmp);
	MOVLW      48
	ADDWF      FARG_pout_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_pout_data_ary+1, 0
	MOVWF      R1
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
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Add_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_dec2bit+0
	MOVF       R1, 0
	MOVWF      FARG_dec2bit+1
	MOVLW      pout_tmp_L0+0
	MOVWF      FARG_dec2bit+0
	MOVLW      hi_addr(pout_tmp_L0+0)
	MOVWF      FARG_dec2bit+1
	CALL       _dec2bit+0
;jyro_angle.c,174 :: 		YSIGN=tmp[sign];
	BTFSC      pout_tmp_L0+0, 0
	GOTO       L__pout55
	BCF        PORTD+0, 7
	GOTO       L__pout56
L__pout55:
	BSF        PORTD+0, 7
L__pout56:
;jyro_angle.c,175 :: 		Y8=tmp[bit8];
	BTFSC      pout_tmp_L0+1, 0
	GOTO       L__pout57
	BCF        PORTD+0, 6
	GOTO       L__pout58
L__pout57:
	BSF        PORTD+0, 6
L__pout58:
;jyro_angle.c,176 :: 		Y7=tmp[bit7];
	BTFSC      pout_tmp_L0+2, 0
	GOTO       L__pout59
	BCF        PORTD+0, 5
	GOTO       L__pout60
L__pout59:
	BSF        PORTD+0, 5
L__pout60:
;jyro_angle.c,177 :: 		Y6=tmp[bit6];
	BTFSC      pout_tmp_L0+3, 0
	GOTO       L__pout61
	BCF        PORTD+0, 4
	GOTO       L__pout62
L__pout61:
	BSF        PORTD+0, 4
L__pout62:
;jyro_angle.c,178 :: 		Y5=tmp[bit5];
	BTFSC      pout_tmp_L0+4, 0
	GOTO       L__pout63
	BCF        PORTC+0, 7
	GOTO       L__pout64
L__pout63:
	BSF        PORTC+0, 7
L__pout64:
;jyro_angle.c,179 :: 		Y4=tmp[bit4];
	BTFSC      pout_tmp_L0+5, 0
	GOTO       L__pout65
	BCF        PORTC+0, 6
	GOTO       L__pout66
L__pout65:
	BSF        PORTC+0, 6
L__pout66:
;jyro_angle.c,180 :: 		Y3=tmp[bit3];
	BTFSC      pout_tmp_L0+6, 0
	GOTO       L__pout67
	BCF        PORTC+0, 5
	GOTO       L__pout68
L__pout67:
	BSF        PORTC+0, 5
L__pout68:
;jyro_angle.c,181 :: 		Y2=tmp[bit2];
	BTFSC      pout_tmp_L0+7, 0
	GOTO       L__pout69
	BCF        PORTC+0, 4
	GOTO       L__pout70
L__pout69:
	BSF        PORTC+0, 4
L__pout70:
;jyro_angle.c,182 :: 		Y1=tmp[bit1];
	BTFSC      pout_tmp_L0+8, 0
	GOTO       L__pout71
	BCF        PORTD+0, 3
	GOTO       L__pout72
L__pout71:
	BSF        PORTD+0, 3
L__pout72:
;jyro_angle.c,183 :: 		Y0=tmp[bit0];
	BTFSC      pout_tmp_L0+9, 0
	GOTO       L__pout73
	BCF        PORTD+0, 2
	GOTO       L__pout74
L__pout73:
	BSF        PORTD+0, 2
L__pout74:
;jyro_angle.c,184 :: 		}
L_end_pout:
	RETURN
; end of _pout

_dec2bit:

;jyro_angle.c,186 :: 		void dec2bit(int dec, char pal[])
;jyro_angle.c,188 :: 		if(dec<0){                                                                    //set : sign of data and change data to absolute value
	MOVLW      128
	XORWF      FARG_dec2bit_dec+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2bit76
	MOVLW      0
	SUBWF      FARG_dec2bit_dec+0, 0
L__dec2bit76:
	BTFSC      STATUS+0, 0
	GOTO       L_dec2bit19
;jyro_angle.c,189 :: 		pal[sign]=1;                                                                // ｜
	MOVF       FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVF       FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      1
	MOVWF      INDF1+0
;jyro_angle.c,190 :: 		dec=-dec;                                                                   // ｜
	MOVF       FARG_dec2bit_dec+0, 0
	SUBLW      0
	MOVWF      FARG_dec2bit_dec+0
	MOVF       FARG_dec2bit_dec+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_dec2bit_dec+1
	SUBWF      FARG_dec2bit_dec+1, 1
;jyro_angle.c,191 :: 		}                                                                             // ｜
	GOTO       L_dec2bit20
L_dec2bit19:
;jyro_angle.c,193 :: 		pal[sign]=0;                                                                //end
	MOVF       FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVF       FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
L_dec2bit20:
;jyro_angle.c,195 :: 		pal[bit8]=(dec&0x100)>>8;                                                     //get : bit of number 8
	MOVLW      1
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      0
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	ANDLW      1
	MOVWF      R4
	MOVF       R4, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R4, 7
	MOVLW      255
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,196 :: 		pal[bit7]=(dec&0x80)>>7;                                                      //get : bit of number 7
	MOVLW      2
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      128
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVLW      7
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__dec2bit77:
	BTFSC      STATUS+0, 2
	GOTO       L__dec2bit78
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__dec2bit77
L__dec2bit78:
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,197 :: 		pal[bit6]=(dec&0x40)>>6;                                                      //get : bit of number 6
	MOVLW      3
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      64
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVLW      6
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__dec2bit79:
	BTFSC      STATUS+0, 2
	GOTO       L__dec2bit80
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__dec2bit79
L__dec2bit80:
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,198 :: 		pal[bit5]=(dec&0x20)>>5;                                                      //get : bit of number 5
	MOVLW      4
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      32
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVLW      5
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__dec2bit81:
	BTFSC      STATUS+0, 2
	GOTO       L__dec2bit82
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__dec2bit81
L__dec2bit82:
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,199 :: 		pal[bit4]=(dec&0x10)>>4;                                                      //get : bit of number 4
	MOVLW      5
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      16
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVLW      4
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__dec2bit83:
	BTFSC      STATUS+0, 2
	GOTO       L__dec2bit84
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__dec2bit83
L__dec2bit84:
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,200 :: 		pal[bit3]=(dec&0x08)>>3;                                                      //get : bit of number 3
	MOVLW      6
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      8
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVLW      3
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__dec2bit85:
	BTFSC      STATUS+0, 2
	GOTO       L__dec2bit86
	ASRF       R1, 1
	RRF        R0, 1
	ADDLW      255
	GOTO       L__dec2bit85
L__dec2bit86:
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,201 :: 		pal[bit2]=(dec&0x04)>>2;                                                      //get : bit of number 2
	MOVLW      7
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      4
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	ASRF       R1, 1
	RRF        R0, 1
	ASRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,202 :: 		pal[bit1]=(dec&0x02)>>1;                                                      //get : bit of number 1
	MOVLW      8
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      2
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R3
	MOVF       FARG_dec2bit_dec+1, 0
	MOVWF      R4
	MOVLW      0
	ANDWF      R4, 1
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	ASRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,203 :: 		pal[bit0]=dec&0x01;                                                           //get : bit of number 0
	MOVLW      9
	ADDWF      FARG_dec2bit_pal+0, 0
	MOVWF      FSR1L
	MOVLW      0
	ADDWFC     FARG_dec2bit_pal+1, 0
	MOVWF      FSR1H
	MOVLW      1
	ANDWF      FARG_dec2bit_dec+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      INDF1+0
;jyro_angle.c,204 :: 		}
L_end_dec2bit:
	RETURN
; end of _dec2bit
