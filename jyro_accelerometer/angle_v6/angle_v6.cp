#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v6/angle_v6.c"
#line 27 "C:/Users/i121326/Documents/workspace/robot/jyro_accelerometer/angle_v6/angle_v6.c"
void Setup();
void Set_Bias(double*, double*, double*, double*);
void Rotate_Converter(double, double, double*, double*);
void Output(double, double, double, double);
void Debug(double, double, double, double);
char Dec2Ascii(char);

void Main()
{
 double accele_x_bias = 0.0, accele_y_bias = 0.0;
 double jyro_x_bias = 0.0, jyro_y_bias = 0.0;
 double accele_x = 0.0, accele_y = 0.0, accele_z = 0.0;
 double jyro_x = 0.0, jyro_y = 0.0;
 double static_angle_x = 0.0, static_angle_y = 0.0;
 double dynamic_angle_x = 0.0, dynamic_angle_y = 0.0;
 double angle_x = 0.0, angle_y = 0.0;
 double right_rotate = 0.0, left_rotate = 0.0;

 Setup();

 Set_Bias(&accele_x_bias, &accele_y_bias, &jyro_x_bias, &jyro_y_bias);

 while(1){
 TMR0 = 0;

 accele_x = ADC_read( 0 ) - accele_x_bias;
 accele_y = ADC_read( 1 ) - accele_y_bias;
 accele_z = ADC_read( 2 ) -  611.0 ;
 jyro_x = ADC_read( 3 ) - jyro_x_bias;
 jyro_y = ADC_read( 4 ) - jyro_y_bias;

 static_angle_x =  (atan((accele_x) / sqrt((accele_y) * (accele_y) + (accele_z) * (accele_z))) * ((180.0) / ( 3.1415926535 ))) ;
 static_angle_y =  (atan((accele_y) / sqrt((accele_x) * (accele_x) + (accele_z) * (accele_z))) * ((180.0) / ( 3.1415926535 ))) ;

 dynamic_angle_x =  ((jyro_x) * ( 0.7294902983 )) ;
 dynamic_angle_y =  ((jyro_y) * ( 0.7294902983 )) ;

 angle_x =  ((angle_x) - (( ((2.0) * ( 3.1415926535 ) * ( 0.30 )) ) * (angle_x) * ( ((0.000128) * (TMR0)) )) + (( ((2.0) * ( 3.1415926535 ) * ( 0.30 )) ) * (static_angle_x) * ( ((0.000128) * (TMR0)) )) + ((dynamic_angle_x) * ( ((0.000128) * (TMR0)) ))) ;
 angle_y =  ((angle_y) - (( ((2.0) * ( 3.1415926535 ) * ( 0.30 )) ) * (angle_y) * ( ((0.000128) * (TMR0)) )) + (( ((2.0) * ( 3.1415926535 ) * ( 0.30 )) ) * (static_angle_y) * ( ((0.000128) * (TMR0)) )) + ((dynamic_angle_y) * ( ((0.000128) * (TMR0)) ))) ;




 Output(-angle_x * 0.8, -angle_y * 0.8, static_angle_x, static_angle_y);


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



 Soft_UART_Init(&PORTB, 6, 4, 9600, 0);


 Delay_ms(100);
}

void Set_bias(double *accele_x_bias, double *accele_y_bias, double *jyro_x_bias, double *jyro_y_bias)
{
 int i;

 for(i = 0; i < 100; i ++){
 *accele_x_bias += ADC_Read( 0 );
 *accele_y_bias += ADC_Read( 1 );
 *jyro_x_bias += ADC_Read( 3 );
 *jyro_y_bias += ADC_Read( 4 );
 }

 *accele_x_bias /= 100.0;
 *accele_y_bias /= 100.0;
 *jyro_x_bias /= 100.0;
 *jyro_y_bias /= 100.0;
}

void Rotate_Converter(double angle_x, double angle_y, double *right_rotate, double *left_rotate)
{
 *right_rotate = (angle_x >= 0.0) ? angle_x * 0.5 : -angle_x * 0.5;
 *right_rotate += (angle_y >= 0.0) ? -angle_y : angle_y;
 *left_rotate = (angle_x >= 0.0) ? -angle_x * 0.5 : angle_x * 0.5;
 *left_rotate += (angle_y >= 0.0) ? -angle_y : angle_y;
}

void Output(double data1, double data2, double data3, double data4)
{
 double angle_x = 0.0, angle_y = 0.0;

 angle_x = data1;
 angle_y = data2;

 if( -1.0  < data3 && data3 <  1.0 )
 angle_x = 0.0;
 if( -1.0  < data4 && data4 <  1.0 )
 angle_y = 0.0;

 if(data1 >=  20.0 )
 angle_x =  20.0 ;
 else if(data1 <=  -20.0 )
 angle_x =  -20.0 ;
 if(data2 >=  20.0 )
 angle_y =  20.0 ;
 else if(data2 <=  -20.0 )
 angle_y =  -20.0 ;

 data1 = angle_x;
 data2 = angle_y;


 UART1_Write(0);
 UART1_Write((data1 >= 0.0) ? 0 : 1);
 UART1_Write((data1 >= 0.0) ? (data1 * 10.0) : (-data1 * 10.0));

 Soft_UART_Write(0);
 Soft_UART_Write((data2 >= 0.0) ? 0 : 1);
 Soft_UART_Write((data2 >= 0.0) ? (data2 * 10.0) : (-data2 * 10.0));
}

void Debug(double data1, double data2, double data3, double data4)
{
 int tmp;

 if( -1.0  < data3 && data3 <  1.0 )
 data1 = 0.0;
 if( -1.0  < data4 && data4 <  1.0 )
 data2 = 0.0;

 if(data1 >=  20.0 )
 data1 =  20.0 ;
 else if(data1 <=  -20.0 )
 data1 =  -20.0 ;
 if(data2 >=  20.0 )
 data2 =  20.0 ;
 else if(data2 <=  -20.0 )
 data2 =  -20.0 ;

 Soft_UART_Write((data1 >= 0.0) ? '+' : '-');
 tmp = (data1 >= 0.0) ? data1 * 10.0 : -data1 * 10.0;
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write('.');
 Soft_UART_Write(Dec2Ascii(tmp % 10));
 Soft_UART_Write(' ');

 Soft_UART_Write((data2 >= 0.0) ? '+' : '-');
 tmp = (data2 >= 0.0) ? data2 * 10.0 : -data2 * 10.0;
 Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 Soft_UART_Write('.');
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
