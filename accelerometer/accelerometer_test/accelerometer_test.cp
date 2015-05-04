#line 1 "C:/Users/i121326/Documents/workspace/robot/accelerometer/accelerometer_test/accelerometer_test.c"







void setup();
void output(int, int, int);
char dec2ascii(char);
int angle_3(int, int, int);
int angle_2(int, int);

const double t[]={
 0.000,
 0.002,
 0.003,
 0.005,
 0.007,
 0.009,
 0.010,
 0.012,
 0.014,
 0.016,
 0.017,
 0.019,
 0.021,
 0.023,
 0.024,
 0.026,
 0.028,
 0.030,
 0.031,
 0.033,
 0.035,
 0.037,
 0.038,
 0.040,
 0.042,
 0.044,
 0.045,
 0.047,
 0.049,
 0.051,
 0.052,
 0.054,
 0.056,
 0.058,
 0.059,
 0.061,
 0.063,
 0.065,
 0.066,
 0.068,
 0.070,
 0.072,
 0.073,
 0.075,
 0.077,
 0.079,
 0.080,
 0.082,
 0.084,
 0.086,
 0.087,
 0.089,
 0.091,
 0.093,
 0.095,
 0.096,
 0.098,
 0.100,
 0.102,
 0.103,
 0.105,
 0.107,
 0.109,
 0.110,
 0.112,
 0.114,
 0.116,
 0.117,
 0.119,
 0.121,
 0.123,
 0.125,
 0.126,
 0.128,
 0.130,
 0.132,
 0.133,
 0.135,
 0.137,
 0.139,
 0.141,
 0.142,
 0.144,
 0.146,
 0.148,
 0.149,
 0.151,
 0.153,
 0.155,
 0.157,
 0.158,
 0.160,
 0.162,
 0.164,
 0.166,
 0.167,
 0.169,
 0.171,
 0.173,
 0.175,
 0.176,
 0.178,
 0.180,
 0.182,
 0.184,
 0.185,
 0.187,
 0.189,
 0.191,
 0.193,
 0.194,
 0.196,
 0.198,
 0.200,
 0.202,
 0.203,
 0.205,
 0.207,
 0.209,
 0.211,
 0.213,
 0.214,
 0.216,
 0.218,
 0.220,
 0.222,
 0.224,
 0.225,
 0.227,
 0.229,
 0.231,
 0.233,
 0.235,
 0.236,
 0.238,
 0.240,
 0.242,
 0.244,
 0.246,
 0.247,
 0.249,
 0.251,
 0.253,
 0.255,
 0.257,
 0.259,
 0.260,
 0.262,
 0.264,
 0.266,
 0.268,
 0.270,
 0.272,
 0.274,
 0.275,
 0.277,
 0.279,
 0.281,
 0.283,
 0.285,
 0.287,
 0.289,
 0.291,
 0.292,
 0.294,
 0.296,
 0.298,
 0.300,
 0.302,
 0.304,
 0.306,
 0.308,
 0.310,
 0.311,
 0.313,
 0.315,
 0.317,
 0.319,
 0.321,
 0.323,
 0.325,
 0.327,
 0.329,
 0.331,
 0.333,
 0.335,
 0.337,
 0.338,
 0.340,
 0.342,
 0.344,
 0.346,
 0.348,
 0.350,
 0.352,
 0.354,
 0.356,
 0.358,
 0.360,
 0.362,
 0.364,
 };

void main()
{
 int i;
 int x, y, z;

 setup();

 while(1){
 x=y=z=0;

 for(i=0; i<10; i++){
 x+=ADC_read( 0 );
 y+=ADC_read( 1 );
 z+=ADC_read( 2 );
 }

 x=x/10- 518 ;
 y=y/10- 509 ;
 z=z/10- 562 ;






 x=(x>=0) ? angle_2(x, z) : -angle_2(x, z);
 y=(y>=0) ? angle_2(y, z) : -angle_2(y, z);

 if(x>=200)
 x=200;
 else if(x<=-200)
 x=-200;

 if(y>=200)
 y=200;
 else if(y<=-200)
 y=-200;

 output(x, y, 0);
 }
}

void setup()
{
 OSCCON=0x70;

 ANSELA=0x07;
 ANSELB=0x00;
 ANSELD=0x00;
 ANSELE=0x00;
 TRISA=0x07;
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

 delay_ms(1000);
}

void output(int x, int y, int z)
{
 UART_write((x>=0) ? '+' : '-');
 x=abs(x);
 UART_write(dec2ascii((x%1000-x%100)/100));
 UART_write(dec2ascii((x%100-x%10)/10));
 UART_write(dec2ascii(x%10));
 UART_write(' ');

 UART_write((y>=0) ? '+' : '-');
 y=abs(y);
 UART_write(dec2ascii((y%1000-y%100)/100));
 UART_write(dec2ascii((y%100-y%10)/10));
 UART_write(dec2ascii(y%10));
 UART_write(' ');

 UART_write((z>=0) ? '+' : '-');
 z=abs(z);
 UART_write(dec2ascii((z%1000-z%100)/100));
 UART_write(dec2ascii((z%100-z%10)/10));
 UART_write(dec2ascii(z%10));
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

int angle_3(int a, int b, int c)
{
 int i;
 double tmp;

 a=(a>=0) ? a : -a;
 b=(b>=0) ? b : -b;
 c=(c>=0) ? c : -c;

 tmp=(double)a/sqrt((double)(b*b+c*c));

 for(i=0; i<=200; i++){
 if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
 return i;
 }

 return -999;
}

int angle_2(int a, int b)
{
 int i;
 double tmp;

 a=(a>=0) ? a : -a;
 b=(b>=0) ? b : -b;

 tmp=(double)a/b;

 for(i=0; i<=200; i++){
 if(-0.002<=(t[i]-tmp) && (t[i]-tmp)<=0.002)
 return i;
 }

 return -999;
}
