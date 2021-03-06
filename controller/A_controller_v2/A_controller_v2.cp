#line 1 "C:/Users/i121326/Documents/workspace/robot/controller/A_controller_v2/A_controller_v2.c"
#line 14 "C:/Users/i121326/Documents/workspace/robot/controller/A_controller_v2/A_controller_v2.c"
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

 Soft_UART_Init(&PORTB, 4, 3, 9600, 0);

 Delay_ms(10);
}

void Move(int button)
{
 static int speed = 0;
 static int before_command = 0;

 switch(button){

 case 0x01: speed += 3;
 if(speed >=  127 )
 speed =  127 ;
 before_command = button;
 break;

 case 0x02: speed += 3;
 if(speed >=  127 )
 speed =  127 ;
 before_command = button;
 break;

 case 0x04: speed += 3;
 if(speed >=  64 )
 speed =  64 ;
 before_command = button;
 break;

 case 0x08: speed += 3;
 if(speed >=  64 )
 speed =  64 ;
 before_command = button;
 break;

 case 0x40: speed += 3;
 if(speed >=  102 )
 speed =  102 ;
 before_command = button;
 break;

 case 0x80: speed += 3;
 if(speed >=  102 )
 speed =  102 ;
 before_command = button;
 break;

 case 0x10: before_command = button;
 break;

 case 0x20: before_command = button;
 break;

 default : speed -= 3;
 if(speed <=  0 )
 speed =  0 ;
 break;

 if(before_command == 0x01){
 RunMotor( 132 ,  0 , speed);
 RunMotor( 132 ,  5 , speed);
 RunMotor( 133 ,  1 , speed);
 RunMotor( 133 ,  4 , speed);
 RunMotor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x02){
 RunMotor( 132 ,  1 , speed);
 RunMotor( 132 ,  4 , speed);
 RunMotor( 133 ,  0 , speed);
 RunMotor( 133 ,  5 , speed);
 RunMotor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x04){
 RunMotor( 132 ,  1 , speed);
 RunMotor( 132 ,  4 , speed);
 RunMotor( 133 ,  1 , speed);
 RunMotor( 133 ,  4 , speed);
 RunMotor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x08){
 RunMotor( 132 ,  0 , speed);
 RunMotor( 132 ,  5 , speed);
 RunMotor( 133 ,  0 , speed);
 RunMotor( 133 ,  5 , speed);
 RunMotor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x40){
 RunMotor( 132 ,  0 ,  0 );
 RunMotor( 132 ,  4 ,  0 );
 RunMotor( 133 ,  1 , speed);
 RunMotor( 133 ,  4 , speed);
 RunMotor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x80){
 RunMotor( 132 ,  0 , speed);
 RunMotor( 132 ,  5 , speed);
 RunMotor( 133 ,  0 ,  0 );
 RunMotor( 133 ,  4 ,  0 );
 RunMotor( 134 ,  0 ,  0 );
 }
 else{
 RunMotor( 132 ,  0 ,  0 );
 RunMotor( 132 ,  4 ,  0 );
 RunMotor( 133 ,  0 ,  0 );
 RunMotor( 133 ,  4 ,  0 );
 RunMotor( 134 ,  0 ,  0 );
 }
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
