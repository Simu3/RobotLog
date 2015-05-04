#define FRONT_ADD         128
#define RIGHT_ADD         129
#define LEFT_ADD          130
#define BEL_CON_ADD       131
#define MOTOR1_FORWARD    0
#define MOTOR1_REVERSE    1
#define MOTOR2_FORWARD    4
#define MOTOR2_REVERSE    5
#define STRAIGHT_SPEED    127
#define TURN_SPEED        100
#define BEL_CON_SPEED     127
#define STOP              0
#define STEERING_STRAIGHT {PORTB.B1 = 0;}
#define STEERING_CURVE    {PORTB.B1 = 1;}

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

  Soft_UART_Init(&PORTB, 4, 2, 9600, 0);

  delay_ms(10);
}

void Move(int button)
{
  switch(button){
    /* Å™ */
    case 0x01: STEERING_STRAIGHT;
               RunMotor(FRONT_ADD,   MOTOR1_REVERSE, STRAIGHT_SPEED);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STRAIGHT_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, STRAIGHT_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STRAIGHT_SPEED);
               RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STRAIGHT_SPEED);
               RunMotor(LEFT_ADD,    MOTOR2_REVERSE, STRAIGHT_SPEED);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
               break;
    /* Å´ */
    case 0x02: STEERING_STRAIGHT;
               RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STRAIGHT_SPEED);
               RunMotor(FRONT_ADD,   MOTOR2_REVERSE, STRAIGHT_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STRAIGHT_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, STRAIGHT_SPEED);
               RunMotor(LEFT_ADD,    MOTOR1_REVERSE, STRAIGHT_SPEED);
               RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STRAIGHT_SPEED);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
               break;
    /* Å® */
    case 0x04: STEERING_CURVE;
               RunMotor(FRONT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, TURN_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR2_REVERSE, TURN_SPEED);
               RunMotor(LEFT_ADD,    MOTOR1_FORWARD, TURN_SPEED);
               RunMotor(LEFT_ADD,    MOTOR2_REVERSE, TURN_SPEED);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
               break;
    /* Å© */
    case 0x08: STEERING_CURVE;
               RunMotor(FRONT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR1_REVERSE, TURN_SPEED);
               RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, TURN_SPEED);
               RunMotor(LEFT_ADD,    MOTOR1_REVERSE, TURN_SPEED);
               RunMotor(LEFT_ADD,    MOTOR2_FORWARD, TURN_SPEED);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
               break;

    /* R1 */
    //case 0x40:

    /* L1 */
    //case 0x80:

    /* Å¢ */
    case 0x10: RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
               RunMotor(BEL_CON_ADD, MOTOR1_REVERSE, BEL_CON_SPEED);
               break;
    /* Å~ */
    case 0x20: RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, BEL_CON_SPEED);
               break;
    /* ñ≥ì¸óÕ */
    default  : RunMotor(FRONT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(FRONT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR1_FORWARD, STOP);
               RunMotor(RIGHT_ADD,   MOTOR2_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR1_FORWARD, STOP);
               RunMotor(LEFT_ADD,    MOTOR2_FORWARD, STOP);
               RunMotor(BEL_CON_ADD, MOTOR1_FORWARD, STOP);
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