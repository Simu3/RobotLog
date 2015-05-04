#line 1 "C:/Users/i121326/Documents/workspace/robot/infrared_distance/infrared_distance.c"




void Setup();
void Debug(int, int);
char Dec2Ascii(char);

enum {OFF, ON};

void Main()
{
 int front_sensor, back_sensor;
 bit front_state, back_state;

 Setup();

 front_sensor = back_sensor = 0;
 front_state = back_state = OFF;

  {PORTA.B4 = 1; PORTA.B5 = 0;} ;

 while(1){
 front_sensor = ADC_Read(1);
 back_sensor = ADC_Read(2);

 Delay_ms(50);



 if(front_sensor >  600  && front_state == OFF){
  {PORTA.B4 = 0; PORTA.B5 = 1;} ;
 front_state = ON;
 }
 else if(back_sensor >  600  && back_state == OFF){
  {PORTA.B4 = 0; PORTA.B5 = 1;} ;
 back_state = ON;
 }
 else if(front_state == ON && back_state == ON && front_sensor <  600  && back_sensor <  600 ){
  {PORTA.B4 = 1; PORTA.B5 = 0;} ;
 front_state = back_state = OFF;
 }
 }
}

void Setup()
{
 OSCCON = 0x70;

 ANSELA = 0x06;
 TRISA = 0x06;

 PORTA = 0x00;

 ADC_Init();
#line 62 "C:/Users/i121326/Documents/workspace/robot/infrared_distance/infrared_distance.c"
 Delay_ms(10);
}

void Debug(int front_sensor, int back_sensor)
{
 int tmp;

 tmp = front_sensor;
 UART1_write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
 UART1_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 UART1_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 UART1_write(Dec2Ascii(tmp % 10));

 UART1_write(' ');

 tmp = back_sensor;
 UART1_write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
 UART1_write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
 UART1_write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
 UART1_write(Dec2Ascii(tmp % 10));

 UART1_write('\n');
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
