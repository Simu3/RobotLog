#line 1 "C:/Users/i121326/Documents/workspace/robot/controller/B_controller_v3/B_controller_v3.c"
#line 14 "C:/Users/i121326/Documents/workspace/robot/controller/B_controller_v3/B_controller_v3.c"
void SetUp();
void Move(int);
void RunMotor(int, int, int);

void Main()
{
 char error = 0;
 char command = 0;

 SetUp();

 while(1){
 do{
 command = Soft_UART_Read(&error);
 }while(error);

 Move(command);
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

 UART1_Init(9600);
 Soft_UART_Init(&PORTB, 4, 3, 9600, 0);

 PORTA.B4 = 1;

 delay_ms(10);
}

void Move(int command)
{
 switch(command){

 case 0x01:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 RunMotor( 128 ,  1 ,  127 );
 RunMotor( 128 ,  4 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x02:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 RunMotor( 128 ,  0 ,  127 );
 RunMotor( 128 ,  5 ,  127 );
 RunMotor( 129 ,  1 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x04:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  0 ,  127 );
 RunMotor( 128 ,  4 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x08:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127 );
 RunMotor( 128 ,  5 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x80:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127 );
 RunMotor( 128 ,  4 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x40:
 Soft_UART_Write('R');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127 );
 RunMotor( 128 ,  4 ,  127 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x21:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 RunMotor( 128 ,  1 ,  127  -  80 );
 RunMotor( 128 ,  4 ,  127  -  80 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x22:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(0);
 RunMotor( 128 ,  0 ,  127  -  80 );
 RunMotor( 128 ,  5 ,  127  -  80 );
 RunMotor( 129 ,  1 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x24:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  0 ,  127  -  80 );
 RunMotor( 128 ,  4 ,  127  -  80 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x28:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127  -  80 );
 RunMotor( 128 ,  5 ,  127  -  80 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0xA0:
 Soft_UART_Write('R');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('P');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127  -  80 );
 RunMotor( 128 ,  4 ,  127  -  80 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x60:
 Soft_UART_Write('R');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 Soft_UART_Write('L');
 Soft_UART_Write('M');
 Soft_UART_Write(1);
 RunMotor( 128 ,  1 ,  127  -  80 );
 RunMotor( 128 ,  4 ,  127  -  80 );
 RunMotor( 129 ,  0 ,  127 );
 RunMotor( 129 ,  4 ,  0 );
 break;


 case 0x10:
 RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  127 );
 break;


 case 0x30:
 RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  5 ,  127 );
 break;


 case 0x50:
 RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 PORTA.B4 = 1;
 break;

 case 0x90:
 RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 PORTA.B4 = 0;
 break;


 default:
 RunMotor( 128 ,  0 ,  0 );
 RunMotor( 128 ,  4 ,  0 );
 RunMotor( 129 ,  0 ,  0 );
 RunMotor( 129 ,  4 ,  0 );
 break;
 }
}

void RunMotor(int address, int command, int _data)
{
 UART1_Write(address);
 UART1_Write(command);
 UART1_Write(_data);
 UART1_Write((address + command + _data) & 0x7F);

 Delay_ms(1);
}
