
_Interrupt:
	CLRF       PCLATH+0
	CLRF       STATUS+0

;I2C_slave.c,11 :: 		void Interrupt()
;I2C_slave.c,16 :: 		if(INTCON.SSP1IF == 1){
	BTFSS      INTCON+0, 3
	GOTO       L_Interrupt0
;I2C_slave.c,18 :: 		if(SSP1STAT.R_NOT_W == 0){
	BTFSC      SSP1STAT+0, 2
	GOTO       L_Interrupt1
;I2C_slave.c,20 :: 		if(SSP1STAT.D_NOT_A == 0){
	BTFSC      SSP1STAT+0, 5
	GOTO       L_Interrupt2
;I2C_slave.c,21 :: 		rdtp = (char *)rcv_data;
	MOVLW      _rcv_data+0
	MOVWF      _rdtp+0
	MOVLW      hi_addr(_rcv_data+0)
	MOVWF      _rdtp+1
;I2C_slave.c,23 :: 		rcv_flg = 0;
	CLRF       _rcv_flg+0
	CLRF       _rcv_flg+1
;I2C_slave.c,24 :: 		}
	GOTO       L_Interrupt3
L_Interrupt2:
;I2C_slave.c,27 :: 		*rdtp = SSP1BUF;
	MOVF       _rdtp+0, 0
	MOVWF      FSR1L
	MOVF       _rdtp+1, 0
	MOVWF      FSR1H
	MOVF       SSP1BUF+0, 0
	MOVWF      INDF1+0
;I2C_slave.c,28 :: 		rdtp ++;
	INCF       _rdtp+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rdtp+1, 1
;I2C_slave.c,29 :: 		rcv_flg ++;
	INCF       _rcv_flg+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rcv_flg+1, 1
;I2C_slave.c,30 :: 		}
L_Interrupt3:
;I2C_slave.c,32 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,33 :: 		SSP1CON1.CKP = 1;
	BSF        SSP1CON1+0, 4
;I2C_slave.c,34 :: 		}
	GOTO       L_Interrupt4
L_Interrupt1:
;I2C_slave.c,38 :: 		if(SSP1STAT.BF == 1){
	BTFSS      SSP1STAT+0, 0
	GOTO       L_Interrupt5
;I2C_slave.c,39 :: 		sdtp = (char *)snd_data;
	MOVLW      _snd_data+0
	MOVWF      _sdtp+0
	MOVLW      hi_addr(_snd_data+0)
	MOVWF      _sdtp+1
;I2C_slave.c,42 :: 		while(SSP1CON1.CKP | SSP1STAT.BF);
L_Interrupt6:
	BTFSC      SSP1CON1+0, 4
	GOTO       L__Interrupt25
	BTFSC      SSP1STAT+0, 0
	GOTO       L__Interrupt25
	BCF        3, 0
	GOTO       L__Interrupt26
L__Interrupt25:
	BSF        3, 0
L__Interrupt26:
	BTFSS      3, 0
	GOTO       L_Interrupt7
	GOTO       L_Interrupt6
L_Interrupt7:
;I2C_slave.c,44 :: 		SSP1BUF = *sdtp;
	MOVF       _sdtp+0, 0
	MOVWF      FSR0L
	MOVF       _sdtp+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      SSP1BUF+0
;I2C_slave.c,45 :: 		sdtp ++;
	INCF       _sdtp+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sdtp+1, 1
;I2C_slave.c,47 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,48 :: 		SSP1CON1.CKP = 1;
	BSF        SSP1CON1+0, 4
;I2C_slave.c,49 :: 		}
	GOTO       L_Interrupt8
L_Interrupt5:
;I2C_slave.c,51 :: 		if(SSP1CON2.ACKSTAT == 0){
	BTFSC      SSP1CON2+0, 6
	GOTO       L_Interrupt9
;I2C_slave.c,52 :: 		while(SSP1CON1.CKP | SSP1STAT.BF);
L_Interrupt10:
	BTFSC      SSP1CON1+0, 4
	GOTO       L__Interrupt27
	BTFSC      SSP1STAT+0, 0
	GOTO       L__Interrupt27
	BCF        3, 0
	GOTO       L__Interrupt28
L__Interrupt27:
	BSF        3, 0
L__Interrupt28:
	BTFSS      3, 0
	GOTO       L_Interrupt11
	GOTO       L_Interrupt10
L_Interrupt11:
;I2C_slave.c,54 :: 		SSP1BUF = *sdtp;
	MOVF       _sdtp+0, 0
	MOVWF      FSR0L
	MOVF       _sdtp+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      SSP1BUF+0
;I2C_slave.c,55 :: 		sdtp ++;
	INCF       _sdtp+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sdtp+1, 1
;I2C_slave.c,57 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,58 :: 		SSP1CON1.CKP = 1;
	BSF        SSP1CON1+0, 4
;I2C_slave.c,59 :: 		}
	GOTO       L_Interrupt12
L_Interrupt9:
;I2C_slave.c,61 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,62 :: 		}
L_Interrupt12:
;I2C_slave.c,63 :: 		}
L_Interrupt8:
;I2C_slave.c,64 :: 		}
L_Interrupt4:
;I2C_slave.c,65 :: 		}
L_Interrupt0:
;I2C_slave.c,69 :: 		if(INTCON.BCL1IF == 1){
	BTFSS      INTCON+0, 3
	GOTO       L_Interrupt13
;I2C_slave.c,70 :: 		INTCON.BCL1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,71 :: 		}
L_Interrupt13:
;I2C_slave.c,72 :: 		}
L_end_Interrupt:
L__Interrupt24:
	RETFIE     %s
; end of _Interrupt

_Main:

;I2C_slave.c,74 :: 		void Main()
;I2C_slave.c,78 :: 		Setup();
	CALL       _Setup+0
;I2C_slave.c,80 :: 		I2C_Slave_Init(8);
	MOVLW      8
	MOVWF      FARG_I2C_Slave_Init+0
	CALL       _I2C_Slave_Init+0
;I2C_slave.c,82 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_Main14:
	DECFSZ     R13, 1
	GOTO       L_Main14
	DECFSZ     R12, 1
	GOTO       L_Main14
	DECFSZ     R11, 1
	GOTO       L_Main14
	NOP
	NOP
;I2C_slave.c,84 :: 		while(1){
L_Main15:
;I2C_slave.c,85 :: 		ans = I2C_Receive_Check();
	CALL       _I2C_Receive_Check+0
;I2C_slave.c,87 :: 		if(ans != 0){
	MOVLW      0
	XORWF      R1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Main30
	MOVLW      0
	XORWF      R0, 0
L__Main30:
	BTFSC      STATUS+0, 2
	GOTO       L_Main17
;I2C_slave.c,89 :: 		PORTA.B5 = 1;
	BSF        PORTA+0, 5
;I2C_slave.c,90 :: 		}
L_Main17:
;I2C_slave.c,91 :: 		}
	GOTO       L_Main15
;I2C_slave.c,92 :: 		}
L_end_Main:
	GOTO       $+0
; end of _Main

_Setup:

;I2C_slave.c,94 :: 		void Setup()
;I2C_slave.c,96 :: 		OSCCON = 0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;I2C_slave.c,98 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;I2C_slave.c,100 :: 		TRISA  = 0x06;
	MOVLW      6
	MOVWF      TRISA+0
;I2C_slave.c,102 :: 		PORTA  = 0x00;
	CLRF       PORTA+0
;I2C_slave.c,103 :: 		}
L_end_Setup:
	RETURN
; end of _Setup

_I2C_Slave_Init:

;I2C_slave.c,105 :: 		void I2C_Slave_Init(char address)
;I2C_slave.c,107 :: 		SSP1STAT      = 0x80;
	MOVLW      128
	MOVWF      SSP1STAT+0
;I2C_slave.c,108 :: 		SSP1CON1      = 0x26;
	MOVLW      38
	MOVWF      SSP1CON1+0
;I2C_slave.c,109 :: 		SSP1CON2.SEN  = 1;
	BSF        SSP1CON2+0, 0
;I2C_slave.c,110 :: 		SSP1ADD       = address << 1;
	MOVF       FARG_I2C_Slave_Init_address+0, 0
	MOVWF      R0
	LSLF       R0, 1
	MOVF       R0, 0
	MOVWF      SSP1ADD+0
;I2C_slave.c,111 :: 		SSP1MSK       = 0xFE;
	MOVLW      254
	MOVWF      SSP1MSK+0
;I2C_slave.c,112 :: 		INTCON.SSP1IE = 1;
	BSF        INTCON+0, 3
;I2C_slave.c,113 :: 		INTCON.BCL1IE = 1;
	BSF        INTCON+0, 3
;I2C_slave.c,114 :: 		INTCON.PEIE   = 1;
	BSF        INTCON+0, 6
;I2C_slave.c,115 :: 		INTCON.GIE    = 1;
	BSF        INTCON+0, 7
;I2C_slave.c,116 :: 		INTCON.SSP1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,117 :: 		INTCON.BCL1IF = 0;
	BCF        INTCON+0, 3
;I2C_slave.c,119 :: 		rcv_flg = 0;
	CLRF       _rcv_flg+0
	CLRF       _rcv_flg+1
;I2C_slave.c,120 :: 		}
L_end_I2C_Slave_Init:
	RETURN
; end of _I2C_Slave_Init

_I2C_Receive_Check:

;I2C_slave.c,122 :: 		int I2C_Receive_Check()
;I2C_slave.c,124 :: 		int ans = 0;
	CLRF       I2C_Receive_Check_ans_L0+0
	CLRF       I2C_Receive_Check_ans_L0+1
;I2C_slave.c,126 :: 		if(rcv_flg != 0){
	MOVLW      0
	XORWF      _rcv_flg+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__I2C_Receive_Check34
	MOVLW      0
	XORWF      _rcv_flg+0, 0
L__I2C_Receive_Check34:
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_Receive_Check18
;I2C_slave.c,127 :: 		if(SSP1STAT.S == 0 && SSP1STAT.P == 1){
	BTFSC      SSP1STAT+0, 3
	GOTO       L_I2C_Receive_Check21
	BTFSS      SSP1STAT+0, 4
	GOTO       L_I2C_Receive_Check21
L__I2C_Receive_Check22:
;I2C_slave.c,128 :: 		ans = rcv_flg;
	MOVF       _rcv_flg+0, 0
	MOVWF      I2C_Receive_Check_ans_L0+0
	MOVF       _rcv_flg+1, 0
	MOVWF      I2C_Receive_Check_ans_L0+1
;I2C_slave.c,129 :: 		rcv_flg = 0;
	CLRF       _rcv_flg+0
	CLRF       _rcv_flg+1
;I2C_slave.c,130 :: 		}
L_I2C_Receive_Check21:
;I2C_slave.c,131 :: 		}
L_I2C_Receive_Check18:
;I2C_slave.c,133 :: 		return ans;
	MOVF       I2C_Receive_Check_ans_L0+0, 0
	MOVWF      R0
	MOVF       I2C_Receive_Check_ans_L0+1, 0
	MOVWF      R1
;I2C_slave.c,134 :: 		}
L_end_I2C_Receive_Check:
	RETURN
; end of _I2C_Receive_Check
