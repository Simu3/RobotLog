
_main:

;jyro_angle_v2.c,28 :: 		void main()
;jyro_angle_v2.c,33 :: 		set_up();
	CALL       _set_up+0
;jyro_angle_v2.c,34 :: 		init_struct(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_init_struct+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_init_struct+1
	CALL       _init_struct+0
;jyro_angle_v2.c,35 :: 		read_bias(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_read_bias+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_read_bias+1
	CALL       _read_bias+0
;jyro_angle_v2.c,37 :: 		data_ary[bias].x=0.0;
	CLRF       main_data_ary_L0+0
	CLRF       main_data_ary_L0+1
	CLRF       main_data_ary_L0+2
	CLRF       main_data_ary_L0+3
;jyro_angle_v2.c,38 :: 		data_ary[bias].y=0.0;
	CLRF       main_data_ary_L0+4
	CLRF       main_data_ary_L0+5
	CLRF       main_data_ary_L0+6
	CLRF       main_data_ary_L0+7
;jyro_angle_v2.c,39 :: 		data_ary[angle].x=0.0;
	CLRF       main_data_ary_L0+48
	CLRF       main_data_ary_L0+49
	CLRF       main_data_ary_L0+50
	CLRF       main_data_ary_L0+51
;jyro_angle_v2.c,40 :: 		data_ary[angle].y=0.0;
	CLRF       main_data_ary_L0+52
	CLRF       main_data_ary_L0+53
	CLRF       main_data_ary_L0+54
	CLRF       main_data_ary_L0+55
;jyro_angle_v2.c,42 :: 		while(1){
L_main0:
;jyro_angle_v2.c,43 :: 		for(j=0; j<10; j++){                                                        //二重積分を行って
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
;jyro_angle_v2.c,44 :: 		data_ary[old_v].x=data_ary[new_v].x;                                      //それぞれの積分で
	MOVF       main_data_ary_L0+40, 0
	MOVWF      main_data_ary_L0+32
	MOVF       main_data_ary_L0+41, 0
	MOVWF      main_data_ary_L0+33
	MOVF       main_data_ary_L0+42, 0
	MOVWF      main_data_ary_L0+34
	MOVF       main_data_ary_L0+43, 0
	MOVWF      main_data_ary_L0+35
;jyro_angle_v2.c,45 :: 		data_ary[old_v].y=data_ary[new_v].y;                                      //10回分の平均をとっている
	MOVF       main_data_ary_L0+44, 0
	MOVWF      main_data_ary_L0+36
	MOVF       main_data_ary_L0+45, 0
	MOVWF      main_data_ary_L0+37
	MOVF       main_data_ary_L0+46, 0
	MOVWF      main_data_ary_L0+38
	MOVF       main_data_ary_L0+47, 0
	MOVWF      main_data_ary_L0+39
;jyro_angle_v2.c,47 :: 		for(i=0; i<10; i++){                                                      //測定の間隔がタイマーレジスタにより
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
;jyro_angle_v2.c,48 :: 		data_ary[old_a].x=data_ary[new_a].x;                                    //約0.1[ms]となっているため
	MOVF       main_data_ary_L0+24, 0
	MOVWF      main_data_ary_L0+16
	MOVF       main_data_ary_L0+25, 0
	MOVWF      main_data_ary_L0+17
	MOVF       main_data_ary_L0+26, 0
	MOVWF      main_data_ary_L0+18
	MOVF       main_data_ary_L0+27, 0
	MOVWF      main_data_ary_L0+19
;jyro_angle_v2.c,49 :: 		data_ary[old_a].y=data_ary[new_a].y;                                    //10[ms]毎となる
	MOVF       main_data_ary_L0+28, 0
	MOVWF      main_data_ary_L0+20
	MOVF       main_data_ary_L0+29, 0
	MOVWF      main_data_ary_L0+21
	MOVF       main_data_ary_L0+30, 0
	MOVWF      main_data_ary_L0+22
	MOVF       main_data_ary_L0+31, 0
	MOVWF      main_data_ary_L0+23
;jyro_angle_v2.c,50 :: 		flag=0;
	BCF        main_flag_L0+0, BitPos(main_flag_L0+0)
;jyro_angle_v2.c,51 :: 		INTCON.TMR0IF=0;
	BCF        INTCON+0, 2
;jyro_angle_v2.c,52 :: 		TMR0=0;
	CLRF       TMR0+0
;jyro_angle_v2.c,54 :: 		while(flag==0){
L_main8:
	BTFSC      main_flag_L0+0, BitPos(main_flag_L0+0)
	GOTO       L_main9
;jyro_angle_v2.c,55 :: 		if(INTCON.TMR0IF==1){
	BTFSS      INTCON+0, 2
	GOTO       L_main10
;jyro_angle_v2.c,56 :: 		read(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_read+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_read+1
	CALL       _read+0
;jyro_angle_v2.c,57 :: 		flag=1;
	BSF        main_flag_L0+0, BitPos(main_flag_L0+0)
;jyro_angle_v2.c,58 :: 		}
L_main10:
;jyro_angle_v2.c,59 :: 		}
	GOTO       L_main8
L_main9:
;jyro_angle_v2.c,62 :: 		md2aa(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_md2aa+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_md2aa+1
	CALL       _md2aa+0
;jyro_angle_v2.c,64 :: 		aa2av(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_aa2av+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_aa2av+1
	CALL       _aa2av+0
;jyro_angle_v2.c,47 :: 		for(i=0; i<10; i++){                                                      //測定の間隔がタイマーレジスタにより
	INCF       main_i_L0+0, 1
;jyro_angle_v2.c,66 :: 		}
	GOTO       L_main5
L_main6:
;jyro_angle_v2.c,73 :: 		av2a(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_av2a+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_av2a+1
	CALL       _av2a+0
;jyro_angle_v2.c,43 :: 		for(j=0; j<10; j++){                                                        //二重積分を行って
	INCF       main_j_L0+0, 1
;jyro_angle_v2.c,75 :: 		}
	GOTO       L_main2
L_main3:
;jyro_angle_v2.c,82 :: 		debug(data_ary, angle);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_debug+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_debug+1
	MOVLW      6
	MOVWF      FARG_debug+0
	CALL       _debug+0
;jyro_angle_v2.c,84 :: 		init_struct(data_ary);
	MOVLW      main_data_ary_L0+0
	MOVWF      FARG_init_struct+0
	MOVLW      hi_addr(main_data_ary_L0+0)
	MOVWF      FARG_init_struct+1
	CALL       _init_struct+0
;jyro_angle_v2.c,85 :: 		}
	GOTO       L_main0
;jyro_angle_v2.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_set_up:

;jyro_angle_v2.c,89 :: 		void set_up()
;jyro_angle_v2.c,91 :: 		OSCCON=0x70;                                                                  //oscillator set up : frequency of inside oscillator ← 8[MHz]
	MOVLW      112
	MOVWF      OSCCON+0
;jyro_angle_v2.c,92 :: 		OPTION_REG=0x08;                                                              //Timer0 set up
	MOVLW      8
	MOVWF      OPTION_REG+0
;jyro_angle_v2.c,94 :: 		ANSELA=0x03;                                                                  //A/D set up : analog(0,1), digital(2,3,4,5,6,7)
	MOVLW      3
	MOVWF      ANSELA+0
;jyro_angle_v2.c,95 :: 		ANSELB=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
	CLRF       ANSELB+0
;jyro_angle_v2.c,96 :: 		ANSELD=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
	CLRF       ANSELD+0
;jyro_angle_v2.c,97 :: 		ANSELE=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2)
	CLRF       ANSELE+0
;jyro_angle_v2.c,98 :: 		TRISA=0x03;                                                                   //I/O set up : input(0,1), output(2,3,4,5,6,7)
	MOVLW      3
	MOVWF      TRISA+0
;jyro_angle_v2.c,99 :: 		TRISB=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISB+0
;jyro_angle_v2.c,100 :: 		TRISC=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISC+0
;jyro_angle_v2.c,101 :: 		TRISD=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
	CLRF       TRISD+0
;jyro_angle_v2.c,102 :: 		TRISE=0x00;                                                                   //I/O set up : input(none), output(0,1,2)
	CLRF       TRISE+0
;jyro_angle_v2.c,104 :: 		PORTA=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTA+0
;jyro_angle_v2.c,105 :: 		PORTB=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTB+0
;jyro_angle_v2.c,106 :: 		PORTC=0x00;                                                                   //initialize : PORTC ← 0
	CLRF       PORTC+0
;jyro_angle_v2.c,107 :: 		PORTD=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTD+0
;jyro_angle_v2.c,108 :: 		PORTE=0x00;                                                                   //initialize : PORTA ← 0
	CLRF       PORTE+0
;jyro_angle_v2.c,110 :: 		ADC_Init();                                                                   //initialize : A/D convert library
	CALL       _ADC_Init+0
;jyro_angle_v2.c,112 :: 		UART1_Init(9600);                                                             //initialize : baudrate ← 9600
	BSF        BAUDCON+0, 3
	MOVLW      207
	MOVWF      SPBRG+0
	CLRF       SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;jyro_angle_v2.c,114 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11
	MOVLW      187
	MOVWF      R12
	MOVLW      223
	MOVWF      R13
L_set_up11:
	DECFSZ     R13, 1
	GOTO       L_set_up11
	DECFSZ     R12, 1
	GOTO       L_set_up11
	DECFSZ     R11, 1
	GOTO       L_set_up11
	NOP
	NOP
;jyro_angle_v2.c,115 :: 		}
L_end_set_up:
	RETURN
; end of _set_up

_init_struct:

;jyro_angle_v2.c,117 :: 		void init_struct(_data data_ary[])
;jyro_angle_v2.c,121 :: 		for(i=md; i<new_v; i++){                                                      //initialize : data structure
	MOVLW      1
	MOVWF      R3+0
L_init_struct12:
	MOVLW      5
	SUBWF      R3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_init_struct13
;jyro_angle_v2.c,122 :: 		data_ary[i].x=0.0;                                                          //    ｜
	MOVLW      3
	MOVWF      R2
	MOVF       R3+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__init_struct48:
	BTFSC      STATUS+0, 2
	GOTO       L__init_struct49
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__init_struct48
L__init_struct49:
	MOVF       R0, 0
	ADDWF      FARG_init_struct_data_ary+0, 0
	MOVWF      FSR1L
	MOVF       R1, 0
	ADDWFC     FARG_init_struct_data_ary+1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
;jyro_angle_v2.c,123 :: 		data_ary[i].y=0.0;                                                          //    ↓
	MOVLW      3
	MOVWF      R2
	MOVF       R3+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__init_struct50:
	BTFSC      STATUS+0, 2
	GOTO       L__init_struct51
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__init_struct50
L__init_struct51:
	MOVF       FARG_init_struct_data_ary+0, 0
	ADDWF      R0, 1
	MOVF       FARG_init_struct_data_ary+1, 0
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
;jyro_angle_v2.c,121 :: 		for(i=md; i<new_v; i++){                                                      //initialize : data structure
	INCF       R3+0, 1
;jyro_angle_v2.c,124 :: 		}                                                                             //   end
	GOTO       L_init_struct12
L_init_struct13:
;jyro_angle_v2.c,125 :: 		}
L_end_init_struct:
	RETURN
; end of _init_struct

_read:

;jyro_angle_v2.c,127 :: 		void read(_data data_ary[])
;jyro_angle_v2.c,129 :: 		data_ary[md].x=ADC_read(AN_X);
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
;jyro_angle_v2.c,130 :: 		data_ary[md].y=ADC_read(AN_Y);
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
;jyro_angle_v2.c,131 :: 		}
L_end_read:
	RETURN
; end of _read

_read_bias:

;jyro_angle_v2.c,133 :: 		void read_bias(_data data_ary[])
;jyro_angle_v2.c,137 :: 		for(i=0; i<1000; i++){                                                        //average : measurement data
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
	GOTO       L__read_bias54
	MOVLW      232
	SUBWF      read_bias_i_L0+0, 0
L__read_bias54:
	BTFSC      STATUS+0, 0
	GOTO       L_read_bias16
;jyro_angle_v2.c,138 :: 		data_ary[bias].x+=ADC_read(AN_X);                                           //   ｜
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
;jyro_angle_v2.c,139 :: 		data_ary[bias].y+=ADC_read(AN_Y);                                           //   ｜
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
;jyro_angle_v2.c,140 :: 		delay_ms(1);                                                                //   ↓
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
;jyro_angle_v2.c,137 :: 		for(i=0; i<1000; i++){                                                        //average : measurement data
	INCF       read_bias_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       read_bias_i_L0+1, 1
;jyro_angle_v2.c,141 :: 		}                                                                             //  end
	GOTO       L_read_bias15
L_read_bias16:
;jyro_angle_v2.c,143 :: 		data_ary[bias].x=data_ary[bias].x/1000.0;                                     //convert : measurement data → angular acceleration(0°)
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
;jyro_angle_v2.c,144 :: 		data_ary[bias].y=data_ary[bias].y/1000.0;
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
;jyro_angle_v2.c,147 :: 		}
L_end_read_bias:
	RETURN
; end of _read_bias

_md2aa:

;jyro_angle_v2.c,149 :: 		void md2aa(_data data_ary[])
;jyro_angle_v2.c,151 :: 		data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)*D2A*SEN;
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
	MOVLW      245
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      21
	MOVWF      R6
	MOVLW      134
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
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
;jyro_angle_v2.c,152 :: 		data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)*D2A*SEN;
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
	MOVLW      245
	MOVWF      R4
	MOVLW      64
	MOVWF      R5
	MOVLW      21
	MOVWF      R6
	MOVLW      134
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
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
;jyro_angle_v2.c,153 :: 		}
L_end_md2aa:
	RETURN
; end of _md2aa

_aa2av:

;jyro_angle_v2.c,155 :: 		void aa2av(_data data_ary[])
;jyro_angle_v2.c,157 :: 		data_ary[new_v].x+=(data_ary[old_a].x+data_ary[new_a].x)*MC/2.0;
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
;jyro_angle_v2.c,158 :: 		data_ary[new_v].y+=(data_ary[old_a].y+data_ary[new_a].y)*MC/2.0;
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
;jyro_angle_v2.c,159 :: 		}
L_end_aa2av:
	RETURN
; end of _aa2av

_av2a:

;jyro_angle_v2.c,161 :: 		void av2a(_data data_ary[])
;jyro_angle_v2.c,163 :: 		data_ary[angle].x+=(data_ary[old_v].x+data_ary[new_v].x)*MC/2.0;
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
;jyro_angle_v2.c,164 :: 		data_ary[angle].y+=(data_ary[old_v].y+data_ary[new_v].y)*MC/2.0;
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
;jyro_angle_v2.c,165 :: 		}
L_end_av2a:
	RETURN
; end of _av2a

_output:

;jyro_angle_v2.c,167 :: 		void output(_data data_ary[])
;jyro_angle_v2.c,169 :: 		if(data_ary[angle].x<0){
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_output19
;jyro_angle_v2.c,170 :: 		if(data_ary[angle].y<0)
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_output20
;jyro_angle_v2.c,171 :: 		print((unsigned char)(-data_ary[angle].x*10.0), (unsigned char)(-data_ary[angle].y*10.0));
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVLW      0
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R2
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
	GOTO       L_output21
L_output20:
;jyro_angle_v2.c,173 :: 		print((unsigned char)(-data_ary[angle].x*10.0), (unsigned char)(data_ary[angle].y*10.0));
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      130
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
L_output21:
;jyro_angle_v2.c,174 :: 		}
	GOTO       L_output22
L_output19:
;jyro_angle_v2.c,176 :: 		if(data_ary[angle].y<0)
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_output23
;jyro_angle_v2.c,177 :: 		print((unsigned char)(data_ary[angle].x*10.0), (unsigned char)(-data_ary[angle].y*10.0));
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
	MOVWF      R1
	MOVLW      4
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVLW      0
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R2
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
	GOTO       L_output24
L_output23:
;jyro_angle_v2.c,179 :: 		print((unsigned char)(data_ary[angle].x*10.0), (unsigned char)(data_ary[angle].y*10.0));
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      48
	ADDWF      FARG_output_data_ary+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     FARG_output_data_ary+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
L_output24:
;jyro_angle_v2.c,180 :: 		}
L_output22:
;jyro_angle_v2.c,200 :: 		}
L_end_output:
	RETURN
; end of _output

_debug:

;jyro_angle_v2.c,202 :: 		void debug(_data data_ary[], char number)
;jyro_angle_v2.c,204 :: 		if(data_ary[number].x<0){
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug60:
	BTFSC      STATUS+0, 2
	GOTO       L__debug61
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug60
L__debug61:
	MOVF       R0, 0
	ADDWF      FARG_debug_data_ary+0, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     FARG_debug_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug25
;jyro_angle_v2.c,205 :: 		if(data_ary[number].y<0)
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug62:
	BTFSC      STATUS+0, 2
	GOTO       L__debug63
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug62
L__debug63:
	MOVF       FARG_debug_data_ary+0, 0
	ADDWF      R0, 1
	MOVF       FARG_debug_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug26
;jyro_angle_v2.c,206 :: 		print((unsigned char)(-data_ary[number].x), (unsigned char)(-data_ary[number].y));
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug64:
	BTFSC      STATUS+0, 2
	GOTO       L__debug65
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug64
L__debug65:
	MOVF       R0, 0
	ADDWF      FARG_debug_data_ary+0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	ADDWFC     FARG_debug_data_ary+1, 0
	MOVWF      FLOC__debug+1
	MOVF       FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__debug+1, 0
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
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      4
	ADDWF      FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FLOC__debug+1, 0
	MOVWF      FSR0H
	MOVLW      0
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R2
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R3
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
	GOTO       L_debug27
L_debug26:
;jyro_angle_v2.c,208 :: 		print((unsigned char)(-data_ary[number].x), (unsigned char)(data_ary[number].y));
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug66:
	BTFSC      STATUS+0, 2
	GOTO       L__debug67
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug66
L__debug67:
	MOVF       R0, 0
	ADDWF      FARG_debug_data_ary+0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	ADDWFC     FARG_debug_data_ary+1, 0
	MOVWF      FLOC__debug+1
	MOVF       FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__debug+1, 0
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
	XORWF      R0, 1
	MOVLW      0
	XORWF      R1, 1
	MOVLW      128
	XORWF      R2, 1
	MOVLW      0
	XORWF      R3, 1
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      4
	ADDWF      FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FLOC__debug+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
L_debug27:
;jyro_angle_v2.c,209 :: 		}
	GOTO       L_debug28
L_debug25:
;jyro_angle_v2.c,211 :: 		if(data_ary[number].y<0)
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug68:
	BTFSC      STATUS+0, 2
	GOTO       L__debug69
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug68
L__debug69:
	MOVF       FARG_debug_data_ary+0, 0
	ADDWF      R0, 1
	MOVF       FARG_debug_data_ary+1, 0
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
	CLRF       R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_debug29
;jyro_angle_v2.c,212 :: 		print((unsigned char)(data_ary[number].x), (unsigned char)(-data_ary[number].y));
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug70:
	BTFSC      STATUS+0, 2
	GOTO       L__debug71
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug70
L__debug71:
	MOVF       R0, 0
	ADDWF      FARG_debug_data_ary+0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	ADDWFC     FARG_debug_data_ary+1, 0
	MOVWF      FLOC__debug+1
	MOVF       FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__debug+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      4
	ADDWF      FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FLOC__debug+1, 0
	MOVWF      FSR0H
	MOVLW      0
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R1
	MOVLW      128
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R2
	MOVLW      0
	ADDFSR     0, 1
	XORWF      INDF0+0, 0
	MOVWF      R3
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
	GOTO       L_debug30
L_debug29:
;jyro_angle_v2.c,214 :: 		print((unsigned char)(data_ary[number].x), (unsigned char)(data_ary[number].y));
	MOVLW      3
	MOVWF      R2
	MOVF       FARG_debug_number+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__debug72:
	BTFSC      STATUS+0, 2
	GOTO       L__debug73
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__debug72
L__debug73:
	MOVF       R0, 0
	ADDWF      FARG_debug_data_ary+0, 0
	MOVWF      FLOC__debug+0
	MOVF       R1, 0
	ADDWFC     FARG_debug_data_ary+1, 0
	MOVWF      FLOC__debug+1
	MOVF       FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVF       FLOC__debug+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	MOVLW      4
	ADDWF      FLOC__debug+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FLOC__debug+1, 0
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
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      FARG_print+0
	CLRF       FARG_print+1
	CALL       _print+0
L_debug30:
;jyro_angle_v2.c,215 :: 		}
L_debug28:
;jyro_angle_v2.c,217 :: 		}
L_end_debug:
	RETURN
; end of _debug

_print:

;jyro_angle_v2.c,222 :: 		void print(int x_data,int y_data)
;jyro_angle_v2.c,228 :: 		printa(x_data);
	MOVF       FARG_print_x_data+0, 0
	MOVWF      FARG_printa+0
	MOVF       FARG_print_x_data+1, 0
	MOVWF      FARG_printa+1
	CALL       _printa+0
;jyro_angle_v2.c,231 :: 		printa(y_data);
	MOVF       FARG_print_y_data+0, 0
	MOVWF      FARG_printa+0
	MOVF       FARG_print_y_data+1, 0
	MOVWF      FARG_printa+1
	CALL       _printa+0
;jyro_angle_v2.c,233 :: 		UART1_Write('\n');   //改行
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_angle_v2.c,234 :: 		}
L_end_print:
	RETURN
; end of _print

_printa:

;jyro_angle_v2.c,236 :: 		void printa(int j_data)
;jyro_angle_v2.c,240 :: 		UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));                         //百の位
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__printa+0
	MOVF       R1, 0
	MOVWF      FLOC__printa+1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__printa+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__printa+1, 0
	MOVWF      R1
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_angle_v2.c,241 :: 		UART1_Write(dec2ascii((j_data%100-j_data%10)/10));                            //十の位
	MOVLW      100
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__printa+0
	MOVF       R1, 0
	MOVWF      FLOC__printa+1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	SUBWF      FLOC__printa+0, 0
	MOVWF      R0
	MOVF       R1, 0
	SUBWFB     FLOC__printa+1, 0
	MOVWF      R1
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	CALL       _Div_16x16_S+0
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_angle_v2.c,242 :: 		UART1_Write(dec2ascii(j_data%10));                                            //一の位
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       FARG_printa_j_data+0, 0
	MOVWF      R0
	MOVF       FARG_printa_j_data+1, 0
	MOVWF      R1
	CALL       _Div_16x16_S+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FARG_dec2ascii+0
	MOVF       R1, 0
	MOVWF      FARG_dec2ascii+1
	CALL       _dec2ascii+0
	MOVF       R0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_angle_v2.c,243 :: 		UART1_Write('\t');
	MOVLW      9
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;jyro_angle_v2.c,244 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_printa31:
	DECFSZ     R13, 1
	GOTO       L_printa31
	DECFSZ     R12, 1
	GOTO       L_printa31
	NOP
	NOP
;jyro_angle_v2.c,245 :: 		}
L_end_printa:
	RETURN
; end of _printa

_dec2ascii:

;jyro_angle_v2.c,247 :: 		short dec2ascii(int dec)
;jyro_angle_v2.c,249 :: 		switch(dec){
	GOTO       L_dec2ascii32
;jyro_angle_v2.c,250 :: 		case 0: return 48;
L_dec2ascii34:
	MOVLW      48
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,251 :: 		case 1: return 49;
L_dec2ascii35:
	MOVLW      49
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,252 :: 		case 2: return 50;
L_dec2ascii36:
	MOVLW      50
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,253 :: 		case 3: return 51;
L_dec2ascii37:
	MOVLW      51
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,254 :: 		case 4: return 52;
L_dec2ascii38:
	MOVLW      52
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,255 :: 		case 5: return 53;
L_dec2ascii39:
	MOVLW      53
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,256 :: 		case 6: return 54;
L_dec2ascii40:
	MOVLW      54
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,257 :: 		case 7: return 55;
L_dec2ascii41:
	MOVLW      55
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,258 :: 		case 8: return 56;
L_dec2ascii42:
	MOVLW      56
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,259 :: 		case 9: return 57;
L_dec2ascii43:
	MOVLW      57
	MOVWF      R0
	GOTO       L_end_dec2ascii
;jyro_angle_v2.c,260 :: 		}
L_dec2ascii32:
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii77
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii77:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii34
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii78
	MOVLW      1
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii78:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii35
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii79
	MOVLW      2
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii79:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii36
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii80
	MOVLW      3
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii80:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii37
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii81
	MOVLW      4
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii81:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii38
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii82
	MOVLW      5
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii82:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii39
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii83
	MOVLW      6
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii83:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii40
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii84
	MOVLW      7
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii84:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii41
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii85
	MOVLW      8
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii85:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii42
	MOVLW      0
	XORWF      FARG_dec2ascii_dec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__dec2ascii86
	MOVLW      9
	XORWF      FARG_dec2ascii_dec+0, 0
L__dec2ascii86:
	BTFSC      STATUS+0, 2
	GOTO       L_dec2ascii43
;jyro_angle_v2.c,261 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_dec2ascii44:
	DECFSZ     R13, 1
	GOTO       L_dec2ascii44
	DECFSZ     R12, 1
	GOTO       L_dec2ascii44
	NOP
	NOP
;jyro_angle_v2.c,262 :: 		}
L_end_dec2ascii:
	RETURN
; end of _dec2ascii
