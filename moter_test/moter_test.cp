#line 1 "C:/Users/i121326/Documents/workspace/robot/moter_test/moter_test.c"
void setup();
void run_moter(int, int, int);
void set_id(unsigned char);
void set_parameter(unsigned char, unsigned char, unsigned char);
void set_position(unsigned char, int);
char parity_check(unsigned char);

const enum {STRETCH = 1, SPEED, CURRENT_LIMIT, TEMP_LIMIT};

void main()
{
 setup();

 while(1){
 run_moter(128, 0, 100);
 run_moter(128, 4, 100);
 delay_ms(3000);

 set_position(0, 3500);
 delay_ms(1000);

 set_position(0, 7500);
 delay_ms(1000);

 set_position(0, 11500);
 delay_ms(1000);

 set_position(1, 3500);
 delay_ms(1000);

 set_position(1, 7500);
 delay_ms(1000);

 set_position(1, 11500);
 delay_ms(1000);

 run_moter(128, 1, 100);
 run_moter(128, 5, 100);
 delay_ms(3000);
 }
}

void setup()
{
 OSCCON = 0x70;

 ANSELA = 0x00;
 TRISA = 0x01;
 PORTA = 0x00;

 APFCON.TXCKSEL = 0;
 APFCON.RXDTSEL = 0;

 UART1_Init(115200);

 Soft_UART_Init(&PORTA, 3, 2, 9600, 0);

 delay_ms(10);
}

void run_moter(int address,int command,int Data)
{
 TXSTA.TX9 = 0;
 Soft_UART_Write(address);
 Soft_UART_Write(command);
 Soft_UART_Write(Data);
 Soft_UART_Write((address+command+Data) & 0x7f);
 delay_ms(1);
}

void set_id(unsigned char id)
{
 unsigned char cmd, sc;

 TXSTA.TX9 = 1;

 cmd = 0xE0 | id;
 sc = 0x01;

 TXSTA.TX9D = parity_check(cmd);
 UART1_write(cmd);
 TXSTA.TX9D = parity_check(sc);
 UART1_write(sc);
 UART1_write(sc);
 UART1_write(sc);

 delay_us(100);
}

void set_parameter(unsigned char sc, unsigned char id, unsigned char _data)
{
 unsigned char cmd;

 TXSTA.TX9 = 1;

 cmd = 0xC0 | id;

 TXSTA.TX9D = parity_check(cmd);
 UART1_write(cmd);
 TXSTA.TX9D = parity_check(sc);
 UART1_write(sc);
 TXSTA.TX9D = parity_check(_data);
 UART1_write(_data);

 delay_us(100);
}

void set_position(unsigned char id, int position)
{
 unsigned char cmd, pos_h, pos_l;

 TXSTA.TX9 = 1;

 cmd = 0x80 | id;
 pos_h = (unsigned char)((position >> 7) & 0x7F);
 pos_l = (unsigned char)(position & 0x7F);

 TXSTA.TX9D = parity_check(cmd);
 UART1_write(cmd);
 TXSTA.TX9D = parity_check(pos_h);
 UART1_write(pos_h);
 TXSTA.TX9D = parity_check(pos_l);
 UART1_write(pos_l);

 delay_us(100);
}

char parity_check(unsigned char _data)
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
