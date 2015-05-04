#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v5/angle_v5.c"
#line 19 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v5/angle_v5.c"
void Setup();
void Output(double, double);
char Dec2Ascii(char);

void main()
{
 int i = 0;
 double accele_x_bias = 0.0, accele_y_bias = 0.0;
 double jyro_x_bias = 0.0, jyro_y_bias = 0.0;
 double accele_x = 0.0, accele_y = 0.0, accele_z = 0.0;
 double jyro_x = 0.0, jyro_y = 0.0;
 double angle_x = 0.0, angle_y = 0.0;
 double x = 0.0, y = 0.0;

 Setup();

 for(; i < 10; i ++){
 accele_x_bias += ADC_read( 1 );
 accele_y_bias += ADC_read( 0 );
 jyro_x_bias += ADC_read( 4 );
 jyro_y_bias += ADC_read( 3 );
 }

 accele_x_bias /= 10.0;
 accele_y_bias /= 10.0;
 jyro_x_bias /= 10.0;
 jyro_y_bias /= 10.0;

 while(1){
 TMR0 = 0;

 accele_x = ADC_read( 1 ) - accele_x_bias;
 accele_y = ADC_read( 0 ) - accele_y_bias;
 accele_z = ADC_read( 2 ) -  576 ;
 jyro_x = ADC_read( 4 ) - jyro_x_bias;
 jyro_y = ADC_read( 3 ) - jyro_y_bias;

 angle_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 /  3.1415926535 );
 angle_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 /  3.1415926535 );

 jyro_x = jyro_x *  0.7294902983 ;
 jyro_y = jyro_y *  0.7294902983 ;

 x += -( (2.0 * 3.1415926535  * 0.3 )  * x *  (0.000128 * TMR0) ) + ( (2.0 * 3.1415926535  * 0.3 )  * angle_x *  (0.000128 * TMR0) ) + (jyro_x *  (0.000128 * TMR0) );
 y += -( (2.0 * 3.1415926535  * 0.3 )  * y *  (0.000128 * TMR0) ) + ( (2.0 * 3.1415926535  * 0.3 )  * angle_y *  (0.000128 * TMR0) ) + (jyro_y *  (0.000128 * TMR0) );

 Output(x, y);
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
