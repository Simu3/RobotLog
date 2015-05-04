#line 1 "C:/Users/i121326/Documents/workspace/robot/controller/A_controller/A_controller.c"
#line 14 "C:/Users/i121326/Documents/workspace/robot/controller/A_controller/A_controller.c"
void Setup();
void Move(int);
void Run_Motor(int, int, int);

void Main()
{
 char error = 0;
 char button = 0;

 Setup();

 while(1){
 do{
 button = Soft_UART_Read(&error);
 }while(error);

 Move(button);
 }
}

void Setup()
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
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x02: speed += 3;
 if(speed >=  127 )
 speed =  127 ;
 Run_Motor( 132 ,  1 , speed);
 Run_Motor( 132 ,  4 , speed);
 Run_Motor( 133 ,  0 , speed);
 Run_Motor( 133 ,  5 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x04: speed += 3;
 if(speed >=  64 )
 speed =  64 ;
 Run_Motor( 132 ,  1 , speed);
 Run_Motor( 132 ,  4 , speed);
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x08: speed += 3;
 if(speed >=  64 )
 speed =  64 ;
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  0 , speed);
 Run_Motor( 133 ,  5 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x40: speed += 3;
 if(speed >=  102 )
 speed =  102 ;
 Run_Motor( 132 ,  0 ,  0 );
 Run_Motor( 132 ,  4 ,  0 );
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x80: speed += 3;
 if(speed >=  102 )
 speed =  102 ;
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  0 ,  0 );
 Run_Motor( 133 ,  4 ,  0 );
 Run_Motor( 134 ,  0 ,  0 );
 before_command = button;
 break;

 case 0x10: Run_Motor( 132 ,  0 ,  0 );
 Run_Motor( 132 ,  4 ,  0 );
 Run_Motor( 133 ,  0 ,  0 );
 Run_Motor( 133 ,  4 ,  0 );
 Run_Motor( 134 ,  1 ,  127 );
 before_command = button;
 break;

 case 0x20: Run_Motor( 132 ,  0 ,  0 );
 Run_Motor( 132 ,  4 ,  0 );
 Run_Motor( 133 ,  0 ,  0 );
 Run_Motor( 133 ,  4 ,  0 );
 Run_Motor( 134 ,  0 ,  127 );
 before_command = button;
 break;

 default : speed -= 3;
 if(speed <=  0 )
 speed =  0 ;
 if(before_command == 0x01){
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x02){
 Run_Motor( 132 ,  1 , speed);
 Run_Motor( 132 ,  4 , speed);
 Run_Motor( 133 ,  0 , speed);
 Run_Motor( 133 ,  5 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x04){
 Run_Motor( 132 ,  1 , speed);
 Run_Motor( 132 ,  4 , speed);
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x08){
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  0 , speed);
 Run_Motor( 133 ,  5 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x40){
 Run_Motor( 132 ,  0 ,  0 );
 Run_Motor( 132 ,  4 ,  0 );
 Run_Motor( 133 ,  1 , speed);
 Run_Motor( 133 ,  4 , speed);
 Run_Motor( 134 ,  0 ,  0 );
 }
 else if(before_command == 0x80){
 Run_Motor( 132 ,  0 , speed);
 Run_Motor( 132 ,  5 , speed);
 Run_Motor( 133 ,  0 ,  0 );
 Run_Motor( 133 ,  4 ,  0 );
 Run_Motor( 134 ,  0 ,  0 );
 }
 else{
 Run_Motor( 132 ,  0 ,  0 );
 Run_Motor( 132 ,  4 ,  0 );
 Run_Motor( 133 ,  0 ,  0 );
 Run_Motor( 133 ,  4 ,  0 );
 Run_Motor( 134 ,  0 ,  0 );
 }
 }
}

void Run_Motor(int address, int command, int _data)
{
 Soft_UART_write(address);
 Soft_UART_write(command);
 Soft_UART_write(_data);
 Soft_UART_write((address + command + _data) & 0x7F);

 Delay_ms(1);
}
