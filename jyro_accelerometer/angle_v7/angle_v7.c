#define DEBUG_MODE          0 //デバッグモードを有効化：1
#define ACCELE_CHECK_MODE   0 //加速度のチェックモードを有効化：1
#define ANAROG_PIN_ACCELE_X 0
#define ANAROG_PIN_ACCELE_Y 1
#define ANAROG_PIN_ACCELE_Z 2
#define ANAROG_PIN_JYRO_X   3
#define ANAROG_PIN_JYRO_Y   4
#define ACCELE_Z_BIAS       507.0 //加速度のZ軸のバイアス
#define JYRO_COEFFICIENT    (5.0 / 1024.0 * 0.0067)
#define ACCELE_COEFFICIENT  (5.0 / 1024.0 * 1.0)
#define PI                  3.141592654
#define F0                  0.134
#define W                   (2.0 * PI * F0)
#define DT                  (0.000128 * (double)TMR0)

void SetUp();
void OutPut(double, double);
void Debug(double, double);
void AcceleCheck(double, double, double);
char Dec2Ascii(char);

void Main()
{
  double accele_x_bias = 0.0, accele_y_bias = 0.0;
  double jyro_x_bias   = 0.0, jyro_y_bias   = 0.0;
  double accele_x      = 0.0, accele_y      = 0.0, accele_z = 0.0;
  double jyro_x        = 0.0, jyro_y        = 0.0;
  double theta_x       = 0.0, theta_y       = 0.0;
  double roll          = 0.0, pitch         = 0.0;
  int    i             = 0;

  SetUp();

  for(i = 0; i < 100; i ++){
    accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
    accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
    jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
    jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
  }

  accele_x_bias /= 100.0;
  accele_y_bias /= 100.0;
  jyro_x_bias   /= 100.0;
  jyro_y_bias   /= 100.0;

  while(1){
    TMR0 = 0;

    accele_x = (ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias) * ACCELE_COEFFICIENT;
    accele_y = (ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias) * ACCELE_COEFFICIENT;
    accele_z = (ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS) * ACCELE_COEFFICIENT;
    jyro_x   = (ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias)   * JYRO_COEFFICIENT;
    jyro_y   = (ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias)   * JYRO_COEFFICIENT;

    theta_x = atan(accele_x / sqrt(accele_y * accele_y + accele_z * accele_z)) * (180.0 / PI);
    theta_y = atan(accele_y / sqrt(accele_x * accele_x + accele_z * accele_z)) * (180.0 / PI);

    roll  += (jyro_x * DT) - (W * roll  * DT) + (W * theta_x * DT); //相補フィルタ
    pitch += (jyro_y * DT) - (W * pitch * DT) + (W * theta_y * DT);
    
    if(-0.15 < roll  && roll  < 0.15)
      roll = 0.0;
    if(-0.15 < pitch && pitch < 0.15)
      pitch = 0.0;

    #if DEBUG_MODE
    #if ACCELE_CHECK_MODE
    accele_x = ADC_read(ANAROG_PIN_ACCELE_X);
    accele_y = ADC_read(ANAROG_PIN_ACCELE_Y);
    accele_z = ADC_read(ANAROG_PIN_ACCELE_Z);
    AcceleCheck(accele_x, accele_y, accele_z);
    #else
    Debug(roll, pitch);
    #endif
    #else
    OutPut(pitch - roll, pitch + roll);  //right, left
    #endif
  }
}

void SetUp()
{
  OSCCON = 0x70;

  OPTION_REG = 0x07;  //タイマー0設定

  ANSELA = 0x2F;
  ANSELB = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;

  TRISA  = 0x2F;
  TRISB  = 0x00;
  TRISC  = 0x00;
  TRISD  = 0x00;
  TRISE  = 0x00;

  PORTA  = 0x00;
  PORTB  = 0x00;
  PORTC  = 0x00;
  PORTD  = 0x00;
  PORTE  = 0x00;

  ADC_Init();

  UART1_Init(9600);
  
  #if DEBUG_MODE
  Soft_UART_Init(&PORTB, 4, 6, 9600, 0);
  #else
  Soft_UART_Init(&PORTB, 6, 4, 9600, 0);
  #endif

  Delay_ms(10);
}

void OutPut(double right, double left)
{
  int tmp;

  UART1_Write(0);
  UART1_Write((right >= 0.0) ? 0 : 1); //+ : 0 - : 1
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
  Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
  Soft_UART_Write('.');
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write(' ');

  Soft_UART_Write('P');
  Soft_UART_Write(':');
  Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
  tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
  Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
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
  Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write(' ');

  tmp = (int)accele_y;
  Soft_UART_Write('Y');
  Soft_UART_Write(':');
  Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
  Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write(' ');

  tmp = (int)accele_z;
  Soft_UART_Write('Z');
  Soft_UART_Write(':');
  Soft_UART_Write(Dec2Ascii((tmp % 10000 - tmp % 1000) / 1000));
  Soft_UART_Write(Dec2Ascii((tmp % 1000  - tmp % 100)  / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100   - tmp % 10)   / 10));
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write('\n');
}

char Dec2Ascii(char dec)
{
  switch(dec){
    case 0:  return '0';
    case 1:  return '1';
    case 2:  return '2';
    case 3:  return '3';
    case 4:  return '4';
    case 5:  return '5';
    case 6:  return '6';
    case 7:  return '7';
    case 8:  return '8';
    case 9:  return '9';
    default: return '*';
  }
}