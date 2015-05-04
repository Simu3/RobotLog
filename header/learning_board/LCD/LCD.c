#define UP    4
#define DOWN  5
#define RESET 6

// LCD module connections
sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;
// End LCD module connections

void Setup();
char Dec2Ascii(char);

void Main()
{
  int count = 0;

  Setup();

  Lcd_Init();

  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  
  while(1){
    if(Button(&PORTC, UP, 80, 1))
      count ++;
    else if(Button(&PORTC, DOWN, 80, 1))
      count --;
    else if(Button(&PORTC, RESET, 80, 1))
      count = 0;

    if(count > 9)
      count = 9;
    else if(count < -9)
      count = -9;
    
    if(count >= 0){
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
      Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
      Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
      Lcd_Chr(1, 1, '+');
      Lcd_Chr(1, 2, Dec2Ascii(count));
    }
    else{
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
      Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
      Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
      Lcd_Chr(1, 1, '-');
      Lcd_Chr(1, 2, Dec2Ascii(abs(count)));
    }
  }
}

void Setup()
{
  OSCCON = 0x70;

  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  
  TRISA  = 0x00;
  TRISB  = 0x00;
  TRISC  = 0x70;
  TRISD  = 0x00;
  TRISE  = 0x00;

  PORTA  = 0x00;
  PORTB  = 0x00;
  PORTC  = 0x00;
  PORTD  = 0x00;
  PORTE  = 0x00;
  
  delay_ms(10);
}

char Dec2Ascii(char dec)
{
  switch(dec){
    case 0:  return '0';
    case 1:  return '1';
    case 2:  return '2';
    case 3:  return '3';
    case 4:  return '4';
    case 5:  return '5';
    case 6:  return '6';
    case 7:  return '7';
    case 8:  return '8';
    case 9:  return '9';
    default: return '*';
  }
}