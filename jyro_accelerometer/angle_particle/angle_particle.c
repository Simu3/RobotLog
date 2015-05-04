#define ANAROG_PIN_JYRO_X   3
#define ANAROG_PIN_JYRO_Y   4
#define JYRO_COEFFICIENT    (5.0 / 1024.0 * 0.0067)
#define PI                  3.141592654

void SetUp();
void Debug(double, double);
char Dec2Ascii(char);

struct _particle{
  double theta_x;
  double theta_y;
  double ang_vel_x;
  double ang_vel_y;
  double weight;
}particle[15];

void Main()
{
  double jyro_x_bias = 0.0, jyro_y_bias = 0.0;
  double jyro_x      = 0.0, jyro_y      = 0.0;
  double ang_vel_x   = 0.0, ang_vel_y   = 0.0;
  double theta_x     = 0.0, theta_y     = 0.0;
  const double dt    = 0.1;
  const double sigma = 10.0;
  double d = 0.0;
  int    i           = 0;

  SetUp();
  
  // 粒子構造体の初期化
  for(i = 0; i < 15; i ++){
    particle[i].theta_x   = 0.0;
    particle[i].theta_y   = 0.0;
    particle[i].ang_vel_x = 0.0;
    particle[i].ang_vel_y = 0.0;
    particle[i].weight    = 0.0;
  }

  for(i = 0; i < 100; i ++){
    jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
    jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
  }

  jyro_x_bias   /= 100.0;
  jyro_y_bias   /= 100.0;

  while(1){
    jyro_x = (ADC_read(ANAROG_PIN_JYRO_X) - jyro_x_bias) * JYRO_COEFFICIENT;
    jyro_y = (ADC_read(ANAROG_PIN_JYRO_Y) - jyro_y_bias) * JYRO_COEFFICIENT;
    
    ang_vel_x = jyro_x * dt;
    ang_vel_y = jyro_y * dt;
    
    theta_x = ang_vel_x * dt;
    theta_y = ang_vel_y * dt;
    
    //リサンプリング
    TMR0 = 0;
    for(i = 0; i < 15; i ++){
      srand((double)TMR0);
      particle[i].theta_x = (theta_x + rand() % (int)pow(sigma, 2.0)) * particle[i].weight;
      particle[i].theta_y = (theta_y + rand() % (int)pow(sigma, 2.0)) * particle[i].weight;
      particle[i].ang_vel_x = ang_vel_x;
      particle[i].ang_vel_y = ang_vel_y;
    }
    
    // 予測(状態遷移)
    for(i = 0; i < 15; i ++){
      particle[i].theta_x = particle[i].theta_x + particle[i].ang_vel_x * dt;
      particle[i].theta_y = particle[i].theta_y + particle[i].ang_vel_y * dt;
      particle[i].ang_vel_x = particle[i].ang_vel_x;
      particle[i].ang_vel_y = particle[i].ang_vel_y;
    }
    
    // 尤度決定
    for(i = 0; i < 15; i ++){
      d = sqrt(pow(particle[i].theta_x - theta_x, 2.0) + pow(particle[i].theta_y - theta_y, 2.0));
      particle[i].weight = (1.0 / sqrt(2.0 * PI)) * exp(-1.0 * pow(d, 2.0) / (2.0 * pow(sigma, 2.0)));
    }
    
    // 観測(現状体の推定)
    theta_x = 0.0;
    theta_y = 0.0;
    for(i = 0; i < 15; i ++){
      theta_x += particle[i].theta_x * particle[i].weight;
      theta_y += particle[i].theta_y * particle[i].weight;
    }
    theta_x /= 15.0;
    theta_y /= 15.0;

    Debug(theta_x, theta_y);
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
  TRISB  = 0x20;
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
  
  Soft_UART_Init(&PORTB, 4, 6, 9600, 0);

  Delay_ms(10);
}

void Debug(double roll, double pitch)
{
  int tmp;

  Soft_UART_Write('X');
  Soft_UART_Write(':');
  Soft_UART_Write((roll >= 0.0) ? '+' : '-');
  tmp = (roll >= 0.0) ? roll * 10.0 : -roll * 10.0;
  Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
  Soft_UART_Write('.');
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write(' ');

  Soft_UART_Write('Y');
  Soft_UART_Write(':');
  Soft_UART_Write((pitch >= 0.0) ? '+' : '-');
  tmp = (pitch >= 0.0) ? pitch * 10.0 : -pitch * 10.0;
  Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100  - tmp % 10)  / 10));
  Soft_UART_Write('.');
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