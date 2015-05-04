#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v3/angle_v3.c"









void setup();
void debug(double, double);
char dec2ascii(char);
double angle_3(double, double, double);

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
 double ax_bias, ay_bias, jx_bias, jy_bias;
 double ax, ay, az;
 double jx, jy;
 double x, y;

 ax_bias=ay_bias=jx_bias=jy_bias=ax=ay=az=jx=jy=x=y=0.0;

 setup();

 for(i=0; i<100; i++){
 ax_bias+=ADC_read( 1 );
 ay_bias+=ADC_read( 0 );
 jx_bias+=ADC_read( 4 );
 jy_bias+=ADC_read( 3 );
 }

 ax_bias=ax_bias/100.0;
 ay_bias=ay_bias/100.0;
 jx_bias=jx_bias/100.0;
 jy_bias=jy_bias/100.0;

 while(1){
 ax=ay=az=jx=jy=0.0;

 for(i=0; i<100; i++){
 ax+=ADC_read( 1 );
 ay+=ADC_read( 0 );
 az+=ADC_read( 2 );
 jx+=ADC_read( 4 );
 jy+=ADC_read( 3 );
 }

 ax=ax/100.0-ax_bias;
 ay=ay/100.0-ay_bias;
 az=az/100.0- 576 ;
 jx=jx/100.0-jx_bias;
 jy=jy/100.0-jy_bias;

 x=(ax>=0.0) ? angle_3(ax, ay, az) : -angle_3(ax, ay, az);
 y=(ay>=0.0) ? angle_3(ay, ax, az) : -angle_3(ay, ax, az);

 jx=jx* 0.004887585 * 149.2537313 ;
 jy=jy* 0.004887585 * 149.2537313 ;

 if(x>=20.0)
 x=20.0;
 else if(x<=-20.0)
 x=-20.0;

 if(y>=20.0)
 y=20.0;
 else if(y<=-20.0)
 y=-20.0;

 debug(x, y);
 }
}

void setup()
{
 OSCCON=0x70;

 ANSELA=0x2F;
 ANSELB=0x00;
 ANSELD=0x00;
 ANSELE=0x00;
 TRISA=0x2F;
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

void debug(double x, double y)
{
 double ttmpx, ttmpy;
 int tmpx, tmpy;

 UART_write((x>=0.0) ? '+' : '-');
 ttmpx=(x>=0.0) ? x*10.0 : -x*10.0;
 tmpx=ttmpx;
 UART_write(dec2ascii((tmpx%1000-tmpx%100)/100));
 UART_write(dec2ascii((tmpx%100-tmpx%10)/10));
 UART_write('.');
 UART_write(dec2ascii(tmpx%10));
 UART_write(' ');

 UART_write((y>=0.0) ? '+' : '-');
 ttmpy=(y>=0.0) ? y*10.0 : -y*10.0;
 tmpy=ttmpy;
 UART_write(dec2ascii((tmpy%1000-tmpy%100)/100));
 UART_write(dec2ascii((tmpy%100-tmpy%10)/10));
 UART_write('.');
 UART_write(dec2ascii(tmpy%10));
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

double angle_3(double a, double b, double c)
{
 int i;
 double tmp;

 a=(a>=0) ? a : -a;
 b=(b>=0) ? b : -b;
 c=(c>=0) ? c : -c;

 tmp=a/sqrt(b*b+c*c);

 for(i=0; i<=200; i=i++){
 if(-0.001<=(t[i]-tmp) && (t[i]-tmp)<=0.001)
 return (double)i/10.0;
 }

 return 99.9;
}
