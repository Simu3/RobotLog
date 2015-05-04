#include <math.h>

#define SEN 1492.537313
#define D2V 0.004887585
#define AN_X 0
#define AN_Y 1

void setup();
double integral(double, double, double);
double round_off3(double);
double read_bias();
void output(double);
char dec2ascii(char);

void main()
{  
  int i;
  double bias, o_avel, n_avel, angle, tmp;
  bias=o_avel=n_avel=angle=tmp=0.0;
  
  setup();
  
  bias=read_bias();

  while(1){
    tmp=0.0;
    o_avel=n_avel;
    for(i=0; i<10; i++){
      delay_ms(10);
      tmp+=ADC_read(AN_X)*D2V;
    }
    n_avel=((tmp/10.0)-bias)*SEN;
    angle+=integral(o_avel, n_avel, 0.2808);
    output(angle);
  }
}

void setup()
{
  OSCCON=0x70;

  ANSELA=0x03;
  ANSELB=0x00;
  ANSELD=0x00;
  ANSELE=0x00;
  TRISA=0x03;
  TRISB=0x00;
  TRISC=0x00;
  TRISD=0x00;
  TRISE=0x00;

  PORTA=0x00;
  PORTB=0x00;
  PORTC=0x00;
  PORTD=0x00;
  PORTE=0x00;

  ADC_Init();

  UART1_Init(9600);

  delay_ms(5000);
}

double integral(double a, double b, double n)
{
  return (a+b)*n/2.0;
}

double round_off3(double number)
{
  return (double)((int)((number+0.005)*100.0))/100.0;
}

double read_bias()
{
  int i;
  double bias=0.0;
  
  for(i=0; i<100; i++){
    bias+=ADC_read(AN_X)*D2V;
    delay_ms(10);
  }
  
  //output(bias);
  
  return bias/100.0;
}

void output(double x)
{
  double m=0.0;
  int n=0, k=0;

  UART_write((x>=0) ? '+' : '-');
  
  if(x<0)
    x=-x;
  
  x=modf(x, &m);
  n=(int)m;
  k=(int)(x*1000.0);
  
  UART_write(dec2ascii((n%1000-n%100)/100));
  UART_write(dec2ascii((n%100-n%10)/10));
  UART_write(dec2ascii(n%10));
  UART_write('.')
  UART_write(dec2ascii((k%1000-k%100)/100));
  UART_write(dec2ascii((k%100-k%10)/10));
  UART_write(dec2ascii(k%10));
  UART_write('\n');
}

char dec2ascii(char dec)
{
  switch(dec){
    case 0: return '0';
    case 1: return '1';
    case 2: return '2';
    case 3: return '3';
    case 4: return '4';
    case 5: return '5';
    case 6: return '6';
    case 7: return '7';
    case 8: return '8';
    case 9: return '9';
    default: return '*';
  }
}