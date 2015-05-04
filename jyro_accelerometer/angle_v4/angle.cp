#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle/angle.c"
#line 19 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle/angle.c"
void Setup();
double Angle_Via_ArcTan_3(double, double, double);
void Output(double, double);
char Dec2Ascii(char);

const double TAN_LIST[]={
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
 double accele_x_bias, accele_y_bias;
 double jyro_x_bias, jyro_y_bias;
 double accele_x, accele_y, accele_z;
 double jyro_x, jyro_y;
 double angle_x, angle_y;
 double old_angle_x, new_angle_x, old_angle_y, new_angle_y;

 accele_x_bias = accele_y_bias = jyro_x_bias = jyro_y_bias = accele_x = accele_y =
 accele_z = jyro_x = jyro_y = angle_x = angle_y = old_angle_x = new_angle_x = old_angle_y = new_angle_y = 0.0;

 Setup();

 sin(accele_x);

 for(i = 0; i < 10; i ++){
 accele_x_bias += ADC_read( 1 );
 accele_y_bias += ADC_read( 0 );
 jyro_x_bias += ADC_read( 4 );
 jyro_y_bias += ADC_read( 3 );
 }

 accele_x_bias = accele_x_bias / 10.0;
 accele_y_bias = accele_y_bias / 10.0;
 jyro_x_bias = jyro_x_bias / 10.0;
 jyro_y_bias = jyro_y_bias / 10.0;

 while(1){
 TMR0 = 0;
 old_angle_x = new_angle_x;
 old_angle_y = new_angle_y;

 accele_x = accele_y = accele_z = jyro_x = jyro_y = 0.0;

 accele_x = ADC_read( 1 ) - accele_x_bias;
 accele_y = ADC_read( 0 ) - accele_y_bias;
 accele_z = ADC_read( 2 ) -  576 ;
 jyro_x = ADC_read( 4 ) - jyro_x_bias;
 jyro_y = ADC_read( 3 ) - jyro_y_bias;

 angle_x = (accele_x >= 0.0) ? Angle_Via_ArcTan_3(accele_x, accele_y, accele_z)
 : -Angle_Via_ArcTan_3(accele_x, accele_y, accele_z);
 angle_y = (accele_y >= 0.0) ? Angle_Via_ArcTan_3(accele_y, accele_x, accele_z)
 : -Angle_Via_ArcTan_3(accele_y, accele_x, accele_z);

 jyro_x = jyro_x *  0.7294902983 ;
 jyro_y = jyro_y *  0.7294902983 ;

 if(angle_x >= 20.0)
 angle_x = 20.0;
 else if(angle_x <= -20.0)
 angle_x = -20.0;
 if(angle_y >= 20.0)
 angle_y = 20.0;
 else if(angle_y <= -20.0)
 angle_y = -20.0;

 if((-1.0 <= jyro_x) && (jyro_x <= 1.0) && (-0.5 <= new_angle_x) && (new_angle_x <= 0.5))
 new_angle_x = 0.0;
 else
 new_angle_x = old_angle_x - ( (2.0 * 3.141592654  * 0.25 )  * old_angle_x *  (0.000128 * TMR0) ) + ( (2.0 * 3.141592654  * 0.25 )  * angle_x *  (0.000128 * TMR0) ) + ( (2.0 * 3.141592654  * 0.25 )  * jyro_x *  (0.000128 * TMR0) );
 if((-1.0 <= jyro_y) && (jyro_y <= 1.0) && (-0.5 <= new_angle_y) && (new_angle_y <= 0.5))
 new_angle_y = 0.0;
 else
 new_angle_y = old_angle_y - ( (2.0 * 3.141592654  * 0.25 )  * old_angle_y *  (0.000128 * TMR0) ) + ( (2.0 * 3.141592654  * 0.25 )  * angle_y *  (0.000128 * TMR0) ) + ( (2.0 * 3.141592654  * 0.25 )  * jyro_y *  (0.000128 * TMR0) );

 Output(new_angle_x, new_angle_y);
 }
}

void Setup()
{
 OSCCON = 0x70;

 OPTION_REG = 0x07;

 ANSELA = 0x2F;
 ANSELB = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 TRISA = 0x2F;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;

 PORTA = 0x00;
 PORTB = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;
 PORTE = 0x00;

 ADC_Init();

 UART1_Init(9600);

 delay_ms(3000);
}

void Output(double a, double b)
{
 int tmp;

 UART_write((a >= 0.0) ? '+' : '-');
 tmp = (a >= 0.0) ? a * 10.0 : -a * 10.0;
 UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 UART_write('.');
 UART_write(Dec2Ascii(tmp % 10));
 UART_write(' ');

 UART_write((b >= 0.0) ? '+' : '-');
 tmp = (b >= 0.0) ? b * 10.0 : -b * 10.0;
 UART_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 UART_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 UART_write('.');
 UART_write(Dec2Ascii(tmp % 10));
 UART_write('\n');
}

char Dec2Ascii(char dec)
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

double Angle_Via_ArcTan_3(double a, double b, double c)
{
 int left = 0, right = 200, median = 100;
 double tmp;

 a = (a >= 0) ? a : -a;

 tmp = a / sqrt(b * b + c * c);


 while(left < right){
 if(-0.001 <= (TAN_LIST[median] - tmp) && (TAN_LIST[median] - tmp) <= 0.001)
 return (double) median / 10.0;
 else if(TAN_LIST[median] < tmp)
 left = median + 1;
 else
 right = median - 1;

 median = (left + right) / 2;
 }

 if(-0.001 <= (TAN_LIST[median] - tmp) && (TAN_LIST[median] - tmp) <= 0.001)
 return (double) median / 10.0;
 else
 return 99.9;
}
