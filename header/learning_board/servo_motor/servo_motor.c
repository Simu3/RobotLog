void setup();
void set_id(unsigned char);  //ID : 0 to 31 #•K‚¸1‘Î1‚Å’ÊM‚ğs‚¤‚±‚Æ#
void set_parameter(unsigned char, unsigned char, unsigned char);
void set_position(unsigned char, int);  //position : 3500 to 11500 (center : 7500)
char parity_check(unsigned char);

const enum {STRETCH = 1, SPEED, CURRENT_LIMIT, TEMP_LIMIT};

void main()
{
  setup();
  
  set_id(0);
  
 while(1){
    set_parameter(SPEED, 0, 100);
    delay_ms(100);
    
    set_position(0, 7500);
    delay_ms(1000);
  }
}

void setup()
{
  OSCCON = 0x70;
  
  ANSELA = 0x00;
  TRISA  = 0x01;
  PORTA  = 0x00;
  
  UART1_Init(115200);
  
  TXSTA.TX9 = 1;
}

void set_id(unsigned char id)
{
  unsigned char cmd, sc;
  
  cmd = 0xE0 | id;
  sc  = 0x01;

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

  cmd   = 0x80 | id;
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