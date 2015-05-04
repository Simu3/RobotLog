#line 1 "C:/Users/i121326/Documents/workspace/robot/controller/B_controller_v2/B_controller_v2.c"
#line 16 "C:/Users/i121326/Documents/workspace/robot/controller/B_controller_v2/B_controller_v2.c"
void SetUp();
void Move(int);
void RunMotor(int, int, int);

void Main()
{
 char error = 0;
 char button = 0;

 SetUp();

 while(1){
 do{
 button = Soft_UART_Read(&error);
 }while(error);

 Move(button);
 }
}

void SetUp()
{
 OSCCON = 0x70;

 ANSELA = 0x00;
 ANSELB = 0x00;

 TRISA = 0x00;
 TRISB = 0x00;

 PORTA = 0x00;
 PORTB = 0x00;

 Soft_UART_Init(&PORTB, 4, 2, 9600, 0);

 delay_ms(10);
}

void Move(int button)
{
 switch(button){

 case 0x01:  {PORTB.B1 = 0;} ;
 RunMotor( 128 ,  1 ,  127 );
 RunMotor( 128 ,  4 ,  127 );
 RunMotor( 129 ,  1 ,  127 );
 RunMotor( 129 ,  4 ,  127 );
 RunMotor( 130 ,  0 ,  127 );
 RunMotor( 130 ,  5 ,  127 );
 RunMotor( 131 ,  0 ,  0 );
 break;

 case 0x02:  {PORTB.B1 = 0;} ;
 RunMotor( 128 ,  0 ,  127 );
 RunMotor( 128 ,  5 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  5 ,  127 );
 RunMotor( 130 ,  1 ,  127 );
 RunMotor( 130 ,  4 ,  127 );
 RunMotor( 131 ,  0 ,  0 );
 break;

 case 0x04:  {PORTB.B1 = 1;} ;
 RunMotor( 128 ,  1 ,  100 );
 RunMotor( 128 ,  4 ,  100 );
 RunMotor( 129 ,  0 ,  100 );
 RunMotor( 129 ,  5 ,  100 );
 RunMotor( 130 ,  0 ,  100 );
 RunMotor( 130 ,  5 ,  100 );
 RunMotor( 131 ,  0 ,  0 );
 break;

 case 0x08:  {PORTB.B1 = 1;} ;
 RunMotor( 128 ,  1 ,  100 );
 RunMotor( 128 ,  4 ,  100 );
 RunMotor( 129 ,  1 ,  100 );
 RunMotor( 129 ,  4 ,  100 );
 RunMotor( 130 ,  1 ,  100 );
 RunMotor( 130 ,  4 ,  100 );
 RunMotor( 131 ,  0 ,  0 );
 break;








 case 0x10: RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 RunMotor( 130 ,  0 ,  0 );
 RunMotor( 130 ,  4 ,  0 );
 RunMotor( 131 ,  1 ,  127 );
 break;

 case 0x20: RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 RunMotor( 130 ,  0 ,  0 );
 RunMotor( 130 ,  4 ,  0 );
 RunMotor( 131 ,  0 ,  127 );
 break;

 default : RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 RunMotor( 130 ,  0 ,  0 );
 RunMotor( 130 ,  4 ,  0 );
 RunMotor( 131 ,  0 ,  0 );
 break;
 }
}

void RunMotor(int address, int command, int _data)
{
 Soft_UART_Write(address);
 Soft_UART_Write(command);
 Soft_UART_Write(_data);
 Soft_UART_Write((address + command + _data) & 0x7F);

 Delay_ms(1);
}
