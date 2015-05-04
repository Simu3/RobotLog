unsigned char snd_data[8] = {0,0,0,0,0,0,0,0};
unsigned char rcv_data[8] = {0,0,0,0,0,0,0,0};
unsigned int  rcv_flg;
unsigned char *sdtp;
unsigned char *rdtp;

void Setup();
void I2C_Slave_Init(char);
int  I2C_Receive_Check();

void Interrupt()
{
  char x;
  
  /* SSP(I2C割り込み) */
  if(INTCON.SSP1IF == 1){
    //受信
    if(SSP1STAT.R_NOT_W == 0){
      //受信バイトはアドレス
      if(SSP1STAT.D_NOT_A == 0){
        rdtp = (char *)rcv_data;
        x = SSP1BUF;
        rcv_flg = 0;
      }
      //受信バイトはデータ
      else{
        *rdtp = SSP1BUF;
        rdtp ++;
        rcv_flg ++;
      }
      
      INTCON.SSP1IF = 0;
      SSP1CON1.CKP = 1;
    }

    //送信
    else{
      if(SSP1STAT.BF == 1){
        sdtp = (char *)snd_data;
        x = SSP1BUF;
        
        while(SSP1CON1.CKP | SSP1STAT.BF);
        
        SSP1BUF = *sdtp;
        sdtp ++;
        
        INTCON.SSP1IF = 0;
        SSP1CON1.CKP = 1;
      }
      else{
        if(SSP1CON2.ACKSTAT == 0){
          while(SSP1CON1.CKP | SSP1STAT.BF);
          
          SSP1BUF = *sdtp;
          sdtp ++;

          INTCON.SSP1IF = 0;
          SSP1CON1.CKP = 1;
        }
        else{
          INTCON.SSP1IF = 0;
        }
      }
    }
  }
  
  /* MSSP(I2C)バス衝突割り込み */
  //無処理
  if(INTCON.BCL1IF == 1){
    INTCON.BCL1IF = 0;
  }
}

void Main()
{
  int ans;
  
  Setup();
  
  I2C_Slave_Init(8);
  
  Delay_ms(500);
  
  while(1){
    ans = I2C_Receive_Check();
    
    if(ans != 0){
      /* 実行文 */
        PORTA.B5 = 1;
    }
  }
}

void Setup()
{
  OSCCON = 0x70;
  
  ANSELA = 0x00;
  
  TRISA  = 0x06;
  
  PORTA  = 0x00;
}

void I2C_Slave_Init(char address)
{
  SSP1STAT      = 0x80;
  SSP1CON1      = 0x26;
  SSP1CON2.SEN  = 1;
  SSP1ADD       = address << 1;
  SSP1MSK       = 0xFE;
  INTCON.SSP1IE = 1;
  INTCON.BCL1IE = 1;
  INTCON.PEIE   = 1;
  INTCON.GIE    = 1;
  INTCON.SSP1IF = 0;
  INTCON.BCL1IF = 0;
  
  rcv_flg = 0;
}

int I2C_Receive_Check()
{
  int ans = 0;
  
  if(rcv_flg != 0){
    if(SSP1STAT.S == 0 && SSP1STAT.P == 1){
      ans = rcv_flg;
      rcv_flg = 0;
    }
  }
  
  return ans;
}