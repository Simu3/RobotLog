#define RL_ADD         128
#define FB_ADD         129
#define MOTOR1_FORWARD 0
#define MOTOR1_REVERSE 1
#define MOTOR2_FORWARD 4
#define MOTOR2_REVERSE 5
#define STRAIGHT_SPEED 127
#define TURN_SPEED     127
#define SHIFT_SPEED    127
#define BEL_CON_SPEED  127
#define DOWN_SPEED     80
#define STOP           0

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

  TRISA  = 0x00;
  TRISB  = 0x00;

  PORTA  = 0x00;
  PORTB  = 0x00;

  UART1_Init(9600);
  Soft_UART_Init(&PORTB, 4, 3, 9600, 0);
  
  PORTA.B4 = 1;

  delay_ms(10);
}

void Move(int command)
{
  switch(command){
    /* Å™ */
    case 0x01:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      RunMotor(RL_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å´ */
    case 0x02:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      RunMotor(RL_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
      RunMotor(RL_ADD, MOTOR2_REVERSE, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å® */
    case 0x04:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_FORWARD, TURN_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å© */
    case 0x08:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, TURN_SPEED);
      RunMotor(RL_ADD, MOTOR2_REVERSE, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;

    /* L1 */
    case 0x80:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;

    /* R1 */
    case 0x40:
      Soft_UART_Write('R');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å™Å{Å~ */
    case 0x21:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      RunMotor(RL_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STRAIGHT_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å´Å{Å~ */
    case 0x22:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(0);
      RunMotor(RL_ADD, MOTOR1_FORWARD, STRAIGHT_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_REVERSE, STRAIGHT_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_REVERSE, STRAIGHT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å®Å{Å~ */
    case 0x24:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_FORWARD, TURN_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, TURN_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* Å©Å{Å~ */
    case 0x28:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, TURN_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_REVERSE, TURN_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, TURN_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* L1Å{Å~ */
    case 0xA0:
      Soft_UART_Write('R');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('P');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;
    
    /* R1Å{Å~ */
    case 0x60:
      Soft_UART_Write('R');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      Soft_UART_Write('L');
      Soft_UART_Write('M');
      Soft_UART_Write(1);
      RunMotor(RL_ADD, MOTOR1_REVERSE, SHIFT_SPEED - DOWN_SPEED);
      RunMotor(RL_ADD, MOTOR2_FORWARD, SHIFT_SPEED - DOWN_SPEED);
      RunMotor(FB_ADD, MOTOR1_FORWARD, SHIFT_SPEED);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
    break;

    /* Å¢ */
    case 0x10:
      RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR2_FORWARD, BEL_CON_SPEED);
    break;
    
    /* Å¢Å{Å~ */
    case 0x30:
      RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR2_REVERSE, BEL_CON_SPEED);
    break;
    
    /* R1Å{Å¢ */
    case 0x50:
      RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
      PORTA.B4 = 1;  // 1:arm on  0:arm off
    break;
    /* L1Å{Å¢ */
    case 0x90:
      RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
      PORTA.B4 = 0;  // 1:arm on  0:arm off
    break;
    
    /* ñ≥ì¸óÕ */
    default: 
      RunMotor(RL_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(RL_ADD, MOTOR2_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR1_FORWARD, STOP);
      RunMotor(FB_ADD, MOTOR2_FORWARD, STOP);
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