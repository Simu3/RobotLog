#define ROLL_ID             1
#define PITCH_ID            0
#define ROLL_CENTER         10500         //+->+
#define PITCH_CENTER        4800

void SetUp();
void SetPosition(unsigned char, int);  //position : 3500 to 11500 (center : 7500)
char ParityCheck(unsigned char);

void Main()
{
  SetUp();

  while(1){
    SetPosition(ROLL_ID,  ROLL_CENTER);
    Delay_ms(1000);
    SetPosition(PITCH_ID, PITCH_CENTER);
    Delay_ms(1000);
  }
}

void SetUp()
{
  OSCCON = 0x70;

  TXSTA.TX9 = 1;

  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;

  TRISA  = 0x00;
  TRISB  = 0x00;
  TRISC  = 0x00;
  TRISD  = 0x00;
  TRISE  = 0x00;

  PORTA  = 0x00;
  PORTB  = 0x00;
  PORTC  = 0x00;
  PORTD  = 0x00;
  PORTE  = 0x00;

  UART1_Init(115200);

  Delay_ms(10);
}

void SetPosition(unsigned char id, int position)
{
  unsigned char cmd, pos_h, pos_l;

  cmd   = 0x80 | id;
  pos_h = (unsigned char)((position >> 7) & 0x7F);
  pos_l = (unsigned char)(position & 0x7F);

  TXSTA.TX9D = ParityCheck(cmd);
  UART1_Write(cmd);
  TXSTA.TX9D = ParityCheck(pos_h);
  UART1_Write(pos_h);
  TXSTA.TX9D = ParityCheck(pos_l);
  UART1_Write(pos_l);

  Delay_us(100);
}

char ParityCheck(unsigned char _data)
{
  return ((_data & 0b10000000) >> 7) ^
         ((_data & 0b01000000) >> 6) ^
         ((_data & 0b00100000) >> 5) ^
         ((_data & 0b00010000) >> 4) ^
         ((_data & 0b00001000) >> 3) ^
         ((_data & 0b00000100) >> 2) ^
         ((_data & 0b00000010) >> 1) ^
          (_data & 0b00000001);
}