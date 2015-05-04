#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v7/angle_v7.c"
#line 16 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v7/angle_v7.c"
void SetUp();
void OutPut(double, double);
void Debug(double, double);
void AcceleCheck(double, double, double);
char Dec2Ascii(char);

void Main()
{
 double accele_x_bias = 0.0, accele_y_bias = 0.0;
 double jyro_x_bias = 0.0, jyro_y_bias = 0.0;
 double accele_x = 0.0, accele_y = 0.0, accele_z = 0.0;
 double jyro_x = 0.0, jyro_y = 0.0;
 double theta_x = 0.0, theta_y = 0.0;
 double roll = 0.0, pitch = 0.0;
 int i = 0;

 SetUp();

 for(i = 0; i < 100; i ++){
 accele_x_bias += ADC_Read( 0 );
 accele_y_bias += ADC_Read( 1 );
 jyro_x_bias += ADC_Read( 3 );
 jyro_y_bias += ADC_Read( 4 );
 }

 accele_x_bias /= 100.0;
 accele_y_bias /= 100.0;
 jyro_x_bias /= 100.0;
 jyro_y_bias /= 100.0;

 while(1){
 TMR0 = 0;

 accele_x = (ADC_read( 0 ) - accele_x_bias) *  (5.0 / 1024.0 * 1.0) ;
 accele_y = (ADC_read( 1 ) - accele_y_bias) *  (5.0 / 1024.0 * 1.0) ;
 accele_z = (ADC_read( 2 ) -  507.0 ) *  (5.0 / 1024.0 * 1.0) ;
 jyro_x = (ADC_read( 3 ) - jyro_x_bias) *  (5.0 / 1024.0 * 0.0067) ;
 jyro_y = (ADC_read( 4 ) - jyro_y_bias) *  (5.0 / 1024.0 * 0.0067) ;

 theta_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 /  3.141592654 );
 theta_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 /  3.141592654 );

 roll += (jyro_x *  (0.000128 * (double)TMR0) ) - ( (2.0 * 3.141592654  * 0.134 )  * roll *  (0.000128 * (double)TMR0) ) + ( (2.0 * 3.141592654  * 0.134 )  * theta_x *  (0.000128 * (double)TMR0) );
 pitch += (jyro_y *  (0.000128 * (double)TMR0) ) - ( (2.0 * 3.141592654  * 0.134 )  * pitch *  (0.000128 * (double)TMR0) ) + ( (2.0 * 3.141592654  * 0.134 )  * theta_y *  (0.000128 * (double)TMR0) );

 if(-0.15 < roll && roll < 0.15)
 roll = 0.0;
 if(-0.15 < pitch && pitch < 0.15)
 pitch = 0.0;
#line 76 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v7/angle_v7.c"
 OutPut(pitch - roll, pitch + roll);

 }
}

void SetUp()
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




 Soft_UART_Init(&PORTB, 6, 4, 9600, 0);


 Delay_ms(10);
}

void OutPut(double right, double left)
{
 int tmp;

 UART1_Write(0);
 UART1_Write((right >= 0.0) ? 0 : 1);
 tmp = (int)(abs(right) * 10.0);
 UART1_Write(tmp);

 Soft_UART_Write(0);
 Soft_UART_Write((left >= 0.0) ? 0 : 1);
 tmp = (int)(abs(left) * 10.0);
 Soft_UART_Write(tmp);
}

void Debug(double roll, double pitch)
{
 int tmp;

 Soft_UART_Write('R');
 Soft_UART_Write(':');
 Soft_UART_Write((roll >= 0.0) ? '+' : '-');
 tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write('.');
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write(' ');

 Soft_UART_Write('P');
 Soft_UART_Write(':');
 Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
 tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write('.');
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write('\n');
}

void AcceleCheck(double accele_x, double accele_y, double accele_z)
{
 int tmp;

 tmp = (int)accele_x;
 Soft_UART_Write('X');
 Soft_UART_Write(':');
 Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write(' ');

 tmp = (int)accele_y;
 Soft_UART_Write('Y');
 Soft_UART_Write(':');
 Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write(' ');

 tmp = (int)accele_z;
 Soft_UART_Write('Z');
 Soft_UART_Write(':');
 Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write('\n');
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
