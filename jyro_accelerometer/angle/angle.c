#define DEBUG_MODE                    0 //デバッグモードを有効化 : 1

#define ANAROG_PIN_ACCELE_X           0
#define ANAROG_PIN_ACCELE_Y           1
#define ANAROG_PIN_ACCELE_Z           2
#define ANAROG_PIN_JYRO_X             3
#define ANAROG_PIN_JYRO_Y             4

#define ANGLE_X_MAX                   20.0
#define ANGLE_X_MIN                   -20.0
#define ANGLE_Y_MAX                   20.0
#define ANGLE_Y_MIN                   -20.0
#define DEAD_ANGLE_AREA_MAX           1.0
#define DEAD_ANGLE_AREA_MIN           -1.0

#define ACCELE_Z_BIAS                 611.0         //Z axis of accelermaeter is 0[G]

#define JYRO_COEFFICIENT              0.7294902983  //(1 / 0.67) * 1000 / 10 * (5 / 1023)
#define PI                            3.1415926535
#define CUT_OFF_FREQUENCY             0.30
#define W                             ((2.0) * (PI) * (CUT_OFF_FREQUENCY))
#define TIME                          ((0.000128) * (TMR0))
#define Static_Angle(a, b, c)         (atan((a) / sqrt((b) * (b) + (c) * (c))) * ((180.0) / (PI)))
#define Dynamic_Angle(a)              ((a) * (JYRO_COEFFICIENT))
#define Composition_Of_Angle(a, b, c) ((a) - ((W) * (a) * (TIME)) + ((W) * (b) * (TIME)) + ((c) * (TIME)))

void Setup();
void Set_Bias(double*, double*, double*, double*);
void Rotate_Converter(double, double, double*, double*);
void Output(double, double, double, double);
void Debug(double, double, double, double);
char Dec2Ascii(char);

void Main()
{
  double accele_x_bias   = 0.0, accele_y_bias   = 0.0;
  double jyro_x_bias     = 0.0, jyro_y_bias     = 0.0;
  double accele_x        = 0.0, accele_y        = 0.0, accele_z = 0.0;
  double jyro_x          = 0.0, jyro_y          = 0.0;
  double static_angle_x  = 0.0, static_angle_y  = 0.0;
  double dynamic_angle_x = 0.0, dynamic_angle_y = 0.0;
  double angle_x         = 0.0, angle_y         = 0.0;
  double right_rotate    = 0.0, left_rotate     = 0.0;

  Setup();
  
  Set_Bias(&accele_x_bias, &accele_y_bias, &jyro_x_bias, &jyro_y_bias);

  while(1){
    TMR0 = 0;

    accele_x = ADC_read(ANAROG_PIN_ACCELE_X) - accele_x_bias;
    accele_y = ADC_read(ANAROG_PIN_ACCELE_Y) - accele_y_bias;
    accele_z = ADC_read(ANAROG_PIN_ACCELE_Z) - ACCELE_Z_BIAS;
    jyro_x   = ADC_read(ANAROG_PIN_JYRO_X)   - jyro_x_bias;
    jyro_y   = ADC_read(ANAROG_PIN_JYRO_Y)   - jyro_y_bias;
    
    static_angle_x = Static_Angle(accele_x, accele_y, accele_z);                //静的角度の算出
    static_angle_y = Static_Angle(accele_y, accele_x, accele_z);

    dynamic_angle_x = Dynamic_Angle(jyro_x);                                    //動的角度の算出
    dynamic_angle_y = Dynamic_Angle(jyro_y);

    angle_x = Composition_Of_Angle(angle_x, static_angle_x, dynamic_angle_x);   //角度の合成
    angle_y = Composition_Of_Angle(angle_y, static_angle_y, dynamic_angle_y);

    #if DEBUG_MODE
    Debug(-angle_x, -angle_y, static_angle_x, static_angle_y);
    #else
    Output(-angle_x * 0.8, -angle_y * 0.8, static_angle_x, static_angle_y);
    //Output(angle_x, angle_y, static_angle_x, static_angle_y);
    #endif
  }
}

void Setup()
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

  Delay_ms(100);
}

void Set_bias(double *accele_x_bias, double *accele_y_bias, double *jyro_x_bias, double *jyro_y_bias)
{
  int i;

  for(i = 0; i < 100; i ++){
    *accele_x_bias += ADC_Read(ANAROG_PIN_ACCELE_X);
    *accele_y_bias += ADC_Read(ANAROG_PIN_ACCELE_Y);
    *jyro_x_bias   += ADC_Read(ANAROG_PIN_JYRO_X);
    *jyro_y_bias   += ADC_Read(ANAROG_PIN_JYRO_Y);
  }

  *accele_x_bias /= 100.0;
  *accele_y_bias /= 100.0;
  *jyro_x_bias   /= 100.0;
  *jyro_y_bias   /= 100.0;
}

void Rotate_Converter(double angle_x, double angle_y, double *right_rotate, double *left_rotate)
{
  *right_rotate  = (angle_x >= 0.0) ?  angle_x * 0.5 : -angle_x * 0.5;  //右側に傾いたら上に動かす
  *right_rotate += (angle_y >= 0.0) ? -angle_y :  angle_y;  //前方に傾いたら下に動かす
  *left_rotate   = (angle_x >= 0.0) ? -angle_x * 0.5 :  angle_x * 0.5;  //右側に傾いたら下に動かす
  *left_rotate  += (angle_y >= 0.0) ? -angle_y :  angle_y;  //前方に傾いたら下に動かす
}

void Output(double data1, double data2, double data3, double data4)
{
  double angle_x = 0.0, angle_y = 0.0;
  
  angle_x = data1;
  angle_y = data2;

  if(DEAD_ANGLE_AREA_MIN < data3 && data3 < DEAD_ANGLE_AREA_MAX)
    angle_x = 0.0;
  if(DEAD_ANGLE_AREA_MIN < data4 && data4 < DEAD_ANGLE_AREA_MAX)
    angle_y = 0.0;
      
  if(data1 >= ANGLE_X_MAX)
    angle_x = ANGLE_X_MAX;
  else if(data1 <= ANGLE_X_MIN)
    angle_x = ANGLE_X_MIN;
  if(data2 >= ANGLE_Y_MAX)
    angle_y = ANGLE_Y_MAX;
  else if(data2 <= ANGLE_Y_MIN)
    angle_y = ANGLE_Y_MIN;

  data1 = angle_x;
  data2 = angle_y;
  //Rotate_Converter(angle_x * 0.7, angle_y * 0.7, &data1, &data2); //角度をモータの動作方向に相当する回転角に変換
    
  UART1_Write(0);
  UART1_Write((data1 >= 0.0) ? 0 : 1);                             //+ : 0 - : 1
  UART1_Write((data1 >= 0.0) ? (data1 * 10.0) : (-data1 * 10.0));  //回転角データ

  Soft_UART_Write(0);
  Soft_UART_Write((data2 >= 0.0) ? 0 : 1);
  Soft_UART_Write((data2 >= 0.0) ? (data2 * 10.0) : (-data2 * 10.0));
}

void Debug(double data1, double data2, double data3, double data4)
{
  int tmp;

  if(DEAD_ANGLE_AREA_MIN < data3 && data3 < DEAD_ANGLE_AREA_MAX)
    data1 = 0.0;
  if(DEAD_ANGLE_AREA_MIN < data4 && data4 < DEAD_ANGLE_AREA_MAX)
    data2 = 0.0;

  if(data1 >= ANGLE_X_MAX)
    data1 = ANGLE_X_MAX;
  else if(data1 <= ANGLE_X_MIN)
    data1 = ANGLE_X_MIN;
  if(data2 >= ANGLE_Y_MAX)
    data2 = ANGLE_Y_MAX;
  else if(data2 <= ANGLE_Y_MIN)
    data2 = ANGLE_Y_MIN;

  Soft_UART_Write((data1 >= 0.0) ? '+' : '-');
  tmp = (data1 >= 0.0) ? data1 * 10.0 : -data1 * 10.0;
  Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
  Soft_UART_Write('.');
  Soft_UART_Write(Dec2Ascii(tmp % 10));
  Soft_UART_Write(' ');

  Soft_UART_Write((data2 >= 0.0) ? '+' : '-');
  tmp = (data2 >= 0.0) ? data2 * 10.0 : -data2 * 10.0;
  Soft_UART_Write(Dec2Ascii((tmp % 1000 - tmp % 100) / 100));
  Soft_UART_Write(Dec2Ascii((tmp % 100 - tmp % 10) / 10));
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