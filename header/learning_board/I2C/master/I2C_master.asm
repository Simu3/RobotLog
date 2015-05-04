
_Main:

;I2C_master.c,4 :: 		void Main()
;I2C_master.c,6 :: 		Setup();
	CALL       _Setup+0
;I2C_master.c,8 :: 		I2C_Master_Init();
	CALL       _I2C_Master_Init+0
;I2C_master.c,10 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSP1ADD+0
	CALL       _I2C1_Init+0
;I2C_master.c,12 :: 		while(1){
L_Main0:
;I2C_master.c,13 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C_master.c,14 :: 		I2C1_Wr(8 << 1);
	MOVLW      16
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,15 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,16 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,17 :: 		I2C1_Wr(100);
	MOVLW      100
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,18 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,19 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,20 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,21 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,22 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,23 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C_master.c,25 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main2:
	DECFSZ     R13, 1
	GOTO       L_Main2
	DECFSZ     R12, 1
	GOTO       L_Main2
	DECFSZ     R11, 1
	GOTO       L_Main2
	NOP
	NOP
;I2C_master.c,27 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C_master.c,28 :: 		I2C1_Wr(8 << 1);
	MOVLW      16
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,29 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,30 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,31 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,32 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,33 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,34 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,35 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,36 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_master.c,37 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C_master.c,39 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main3:
	DECFSZ     R13, 1
	GOTO       L_Main3
	DECFSZ     R12, 1
	GOTO       L_Main3
	DECFSZ     R11, 1
	GOTO       L_Main3
	NOP
	NOP
;I2C_master.c,40 :: 		}
	GOTO       L_Main0
;I2C_master.c,41 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;I2C_master.c,43 :: 		void Setup()
;I2C_master.c,45 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;I2C_master.c,47 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;I2C_master.c,49 :: 		TRISA  = 0x06;
	MOVLW      6
	MOVWF      TRISA+0
;I2C_master.c,51 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;I2C_master.c,52 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_I2C_Master_Init:

;I2C_master.c,54 :: 		void I2C_Master_Init()
;I2C_master.c,56 :: 		SSP1STAT = 0x80;
	MOVLW      128
	MOVWF      SSP1STAT+0
;I2C_master.c,57 :: 		SSP1CON1 = 0x28;
	MOVLW      40
	MOVWF      SSP1CON1+0
;I2C_master.c,58 :: 		SSP1ADD  = 0x13;
	MOVLW      19
	MOVWF      SSP1ADD+0
;I2C_master.c,59 :: 		INTCON.SSP1IE = 1;
	BSF        INTCON+0, 3
;I2C_master.c,60 :: 		INTCON.BCL1IE = 1;
	BSF        INTCON+0, 3
;I2C_master.c,61 :: 		INTCON.PEIE   = 1;
	BSF        INTCON+0, 6
;I2C_master.c,62 :: 		INTCON.GIE    = 1;
	BSF        INTCON+0, 7
;I2C_master.c,63 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_master.c,64 :: 		INTCON.BCL1IF = 0;
	BCF        INTCON+0, 3
;I2C_master.c,65 :: 		}
L_end_I2C_Master_Init:
	RETURN
; end of _I2C_Master_Init
