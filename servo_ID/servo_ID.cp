#line 1 "C:/Users/i121326/Documents/workspace/robot/servo_ID/servo_ID.c"


void SetUp();
void SetID(unsigned char);
void SetPosition(unsigned char, int);
char ParityCheck(unsigned char);

void main()
{
 SetUp();

 SetID( 1 );

 Delay_ms(1000);

 while(1){
 SetPosition( 1 , 6000);
 Delay_ms(1000);

 SetPosition( 1 , 6150);
 Delay_ms(1000);

 SetPosition( 1 , 6000);
 Delay_ms(1000);

 SetPosition( 1 , 5850);
 Delay_ms(1000);
 }
}

void SetUp()
{
 OSCCON = 0x70;

 ANSELA = 0x00;
 TRISA = 0x01;
 PORTA = 0x00;

 UART1_Init(115200);

 TXSTA.TX9 = 1;
}

void SetID(unsigned char id)
{
 unsigned char cmd, sc;

 cmd = 0xE0 | id;
 sc = 0x01;

 TXSTA.TX9D = ParityCheck(cmd);
 UART1_write(cmd);
 TXSTA.TX9D = ParityCheck(sc);
 UART1_Write(sc);
 UART1_Write(sc);
 UART1_Write(sc);

 Delay_us(100);
}

void SetPosition(unsigned char id, int position)
{
 unsigned char cmd, pos_h, pos_l;

 cmd = 0x80 | id;
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
