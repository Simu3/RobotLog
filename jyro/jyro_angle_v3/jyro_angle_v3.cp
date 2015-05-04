#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro/jyro_angle_v3/jyro_angle_v3.c"
#line 1 "c:/mikroelektronika/mikroc pro for pic/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 8 "C:/Users/i121326/Documents/workspace/robot/jyro/jyro_angle_v3/jyro_angle_v3.c"
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
 tmp+=ADC_read( 0 )* 0.004887585 ;
 }
 n_avel=((tmp/10.0)-bias)* 1492.537313 ;
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
 bias+=ADC_read( 0 )* 0.004887585 ;
 delay_ms(10);
 }



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
 k=(int)(x*10000.0);

 UART_write(dec2ascii((n%1000-n%100)/100));
 UART_write(dec2ascii((n%100-n%10)/10));
 UART_write(dec2ascii(n%10));
 UART_write('.');
 UART_write(dec2ascii((k%10000-k%1000)/1000));
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
