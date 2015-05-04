#line 1 "C:/Users/i121326/Documents/workspace/robot/learning_board/I2C/master/I2C_master.c"
void Setup();
void I2C_Master_Init();

void Main()
{
 Setup();

 I2C_Master_Init();

 I2C1_Init(100000);

 while(1){
 I2C1_Start();
 I2C1_Wr(8 << 1);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(100);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Stop();

 Delay_ms(500);

 I2C1_Start();
 I2C1_Wr(8 << 1);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Stop();

 Delay_ms(500);
 }
}

void Setup()
{
 OSCCON = 0x70;

 ANSELA = 0x00;

 TRISA = 0x06;

 PORTA = 0x00;
}

void I2C_Master_Init()
{
 SSP1STAT = 0x80;
 SSP1CON1 = 0x28;
 SSP1ADD = 0x13;
 INTCON.SSP1IE = 1;
 INTCON.BCL1IE = 1;
 INTCON.PEIE = 1;
 INTCON.GIE = 1;
 INTCON.SSP1IF = 0;
 INTCON.BCL1IF = 0;
}
