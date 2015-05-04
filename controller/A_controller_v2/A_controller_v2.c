#define RIGHT_ADD      132
#define LEFT_ADD       133
#define BEL_CON_ADD    134
#define MOTOR1_FORWARD 0
#define MOTOR1_REVERSE 1
#define MOTOR2_FORWARD 4
#define MOTOR2_REVERSE 5
#define STRAIGHT_SPEED 127
#define TURN_SPEED     64
#define CURVE_SPEED    102
#define BEL_CON_SPEED  127
#define STOP           0

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

  TRISA  = 0x00;
  TRISB  = 0x00;

  PORTA  = 0x00;
  PORTB  = 0x00;

  Soft_UART_Init(&PORTB, 4, 3, 9600, 0);

  Delay_ms(10);
}

void Move(int button)
{
  static int speed = 0;
  static int before_command = 0;

  switch(button){
    /* Å™ */
    case 0x01: speed += 3;
               if(speed >= STRAIGHT_SPEED)
                 speed = STRAIGHT_SPEED;
               before_command = button;
               break;
    /* Å´ */
    case 0x02: speed += 3;
               if(speed >= STRAIGHT_SPEED)
                 speed = STRAIGHT_SPEED;
               before_command = button;
               break;
    /* Å® */
    case 0x04: speed += 3;
               if(speed >= TURN_SPEED)
                 speed = TURN_SPEED;
               before_command = button;
               break;
    /* Å© */
    case 0x08: speed += 3;
               if(speed >= TURN_SPEED)
                 speed = TURN_SPEED;
               before_command = button;
               break;
    /* R1 */
    case 0x40: speed += 3;
               if(speed >= CURVE_SPEED)
                 speed = CURVE_SPEED;
               before_command = button;
               break;
    /* L1 */
    case 0x80: speed += 3;
               if(speed >= CURVE_SPEED)
                 speed = CURVE_SPEED;
               before_command = button;
               break;
    /* Å¢ */
    case 0x10: before_command = button;
               break;
    /* Å~ */
    case 0x20: before_command = button;
               break;
    /* ñ≥ì¸óÕ */
    default  : speed -= 3;
               if(speed <= STOP)
                 speed = STOP;
               break;
                 
    if(before_command == 0x01){
      RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
      RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else if(before_command == 0x02){
      RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
      RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
      RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
      RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else if(before_command == 0x04){
      RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, speed);
      RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, speed);
      RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else if(before_command == 0x08){
      RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
      RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR1_FORWARD, speed);
      RunMotor(LEFT_ADD,    MOTOR2_REVERSE, speed);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else if(before_command == 0x40){
      RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
      RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
      RunMotor(LEFT_ADD,    MOTOR1_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR2_FORWARD, speed);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else if(before_command == 0x80){
      RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, speed);
      RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, speed);
      RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
      RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
    }
    else{
      RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
      RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
      RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
      RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
      RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
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