#define SEN 1492.537313
#define D2V 0.004887585
#define TMP 7.294902983
#define ANPIN 1

void setup();
double integral(double, double);
double read_bias();
void output(double);
char dec2ascii(char);

void main()
{
  double bias, o_data, n_data, angle, tmp;
  char i;
  
  bias=o_data=n_data=angle=tmp=0.0;
  
  setup();
  
  bias=read_bias();
  
  while(1){
    TMR0=0;
    
    o_data=n_data;
    n_data=0.0;
    
    for(i=0; i<25; i++){
      n_data+=ADC_read(ANPIN);
      delay_ms(1);
    }
    
    n_data/=25.0;
    
    n_data-=bias;

    if(-0.5<=n_data && n_data<=0.5){
      o_data=0.0;
      n_data=0.0;
      if(-5.0<=angle && angle<=5.0)
        angle=0.0;
    }
    
    n_data*=TMP;

    angle+=integral(o_data, n_data);
    
    if(angle>=90)
      angle=90;
    else if(angle<=-90)
      angle=-90;
    
    output(angle);
  }
}

void setup()
{
  OSCCON=0x70;
  
  OPTION_REG=0x07;

  ANSELA=0x02;
  
  TRISA=0x02;

  PORTA=0x00;

  ADC_Init();

  UART1_Init(9600);

  delay_ms(3000);
}

double read_bias()
{
  char i;
  double bias=0.0;

  for(i=0; i<25; i++){
    bias+=ADC_read(ANPIN);
    delay_ms(1);
  }

  return bias/25.0;
}

double integral(double a, double b)
{
  //output(TMR0);

  return (a+b)*(0.000128*TMR0)/2.0;
}

void output(double x)
{
  int m;

  UART_write((x>=0) ? '+' : '-');

  if(x<0)
    x=-x;

  m=(int)(x*10.0);

  //UART_write(dec2ascii((m%10000-m%1000)/1000));
  UART_write(dec2ascii((m%1000-m%100)/100));
  UART_write(dec2ascii((m%100-m%10)/10));
  UART_write(dec2ascii(m%10));
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