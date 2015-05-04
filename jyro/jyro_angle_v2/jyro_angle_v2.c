#define SEN 149.25373134                                                        //sensitivity of ENC-03R(av→aa) is 1/(0.67mV/deg/sec)
#define D2A 0.0048875855                                                        //parameter of D/A convert (5/1023)
#define MC 0.000128                                                             //measurement cycle : 128[us]
#define AN_X 0                                                                  //ANpin of x_jyro's data
#define AN_Y 1                                                                  //ANpin of y_jyro's data

typedef struct{                                                                 //data of jyro structure
  double x;                                                                     //X-axis data
  double y;                                                                     //Y-axis data
}_data;

enum {bias, md, old_a, new_a, old_v, new_v, angle};

void set_up();                                                                  //initialize : register
void init_struct(_data[]);                                                      //initialize : structure
void read(_data[]);                                                             //measure, A/D convert : analog jyro data → digital jyro data
void read_bias(_data[]);                                                        //measure : bias voltage
void md2aa(_data[]);                                                            //convert : measurement data → angular acceleration
void aa2av(_data[]);                                                            //convert : angular acceleration → angular velocity
void av2a(_data[]);                                                             //convert : angular velocity → angle
void output(_data[]);                                                           //output : angle data
void debug(_data[], char);

void print(int, int);
void printa(int);
short dec2ascii(int);

void main()
{
  _data data_ary[7];                                                            //data array
  short i,j;                                                                    //roop variable
  bit flag;                                                                     //timer's state (overflow : 1, nomal : 0)
  set_up();
  init_struct(data_ary);
  read_bias(data_ary);
  
  data_ary[bias].x=0.0;
  data_ary[bias].y=0.0;
  data_ary[angle].x=0.0;
  data_ary[angle].y=0.0;

  while(1){
    for(j=0; j<10; j++){                                                        //二重積分を行って
      data_ary[old_v].x=data_ary[new_v].x;                                      //それぞれの積分で
      data_ary[old_v].y=data_ary[new_v].y;                                      //10回分の平均をとっている
                                                                                //最終的な角度の値が算出されるのは
      for(i=0; i<10; i++){                                                      //測定の間隔がタイマーレジスタにより
        data_ary[old_a].x=data_ary[new_a].x;                                    //約0.1[ms]となっているため
        data_ary[old_a].y=data_ary[new_a].y;                                    //10[ms]毎となる
        flag=0;
        INTCON.TMR0IF=0;
        TMR0=0;

        while(flag==0){
          if(INTCON.TMR0IF==1){
            read(data_ary);
            flag=1;
          }
        }

        //debug(data_ary, md);
        md2aa(data_ary);
        //debug(data_ary, new_a);
        aa2av(data_ary);
        //debug(data_ary, new_v);
      }

      data_ary[new_v].x/10.0;
      data_ary[new_v].y/10.0;
      
      //debug(data_ary, new_v);

      av2a(data_ary);
      //debug(data_ary, angle);    
    }


    data_ary[angle].x/10.0;
    data_ary[angle].y/10.0;
    
    //output(data_ary);
    debug(data_ary, angle);
    
    init_struct(data_ary);
  }

}

void set_up()
{
  OSCCON=0x70;                                                                  //oscillator set up : frequency of inside oscillator ← 8[MHz]
  OPTION_REG=0x08;                                                              //Timer0 set up

  ANSELA=0x03;                                                                  //A/D set up : analog(0,1), digital(2,3,4,5,6,7)
  ANSELB=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
  ANSELD=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2,3,4,5,6,7)
  ANSELE=0x00;                                                                  //A/D set up : analog(none), digital(0,1,2)
  TRISA=0x03;                                                                   //I/O set up : input(0,1), output(2,3,4,5,6,7)
  TRISB=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
  TRISC=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
  TRISD=0x00;                                                                   //I/O set up : input(none), output(0,1,2,3,4,5,6,7)
  TRISE=0x00;                                                                   //I/O set up : input(none), output(0,1,2)

  PORTA=0x00;                                                                   //initialize : PORTA ← 0
  PORTB=0x00;                                                                   //initialize : PORTA ← 0
  PORTC=0x00;                                                                   //initialize : PORTC ← 0
  PORTD=0x00;                                                                   //initialize : PORTA ← 0
  PORTE=0x00;                                                                   //initialize : PORTA ← 0

  ADC_Init();                                                                   //initialize : A/D convert library

  UART1_Init(9600);                                                             //initialize : baudrate ← 9600

  delay_ms(5000);
}

void init_struct(_data data_ary[])
{
  char i;

  for(i=md; i<new_v; i++){                                                      //initialize : data structure
    data_ary[i].x=0.0;                                                          //    ｜
    data_ary[i].y=0.0;                                                          //    ↓
  }                                                                             //   end
}

void read(_data data_ary[])
{
  data_ary[md].x=ADC_read(AN_X);
  data_ary[md].y=ADC_read(AN_Y);
}

void read_bias(_data data_ary[])
{
  int i;

  for(i=0; i<1000; i++){                                                        //average : measurement data
    data_ary[bias].x+=ADC_read(AN_X);                                           //   ｜
    data_ary[bias].y+=ADC_read(AN_Y);                                           //   ｜
    delay_ms(1);                                                                //   ↓
  }                                                                             //  end

  data_ary[bias].x=data_ary[bias].x/1000.0;                                     //convert : measurement data → angular acceleration(0°)
  data_ary[bias].y=data_ary[bias].y/1000.0;

  //debug(data_ary, bias);
}

void md2aa(_data data_ary[])
{
  data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)*D2A*SEN;
  data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)*D2A*SEN;
}

void aa2av(_data data_ary[])
{
  data_ary[new_v].x+=(data_ary[old_a].x+data_ary[new_a].x)*MC/2.0;
  data_ary[new_v].y+=(data_ary[old_a].y+data_ary[new_a].y)*MC/2.0;
}

void av2a(_data data_ary[])
{
  data_ary[angle].x+=(data_ary[old_v].x+data_ary[new_v].x)*MC/2.0;
  data_ary[angle].y+=(data_ary[old_v].y+data_ary[new_v].y)*MC/2.0;
}

void output(_data data_ary[])
{
  if(data_ary[angle].x<0){
    if(data_ary[angle].y<0)
      print((unsigned char)(-data_ary[angle].x*10.0), (unsigned char)(-data_ary[angle].y*10.0));
    else
      print((unsigned char)(-data_ary[angle].x*10.0), (unsigned char)(data_ary[angle].y*10.0));
  }
  else{
    if(data_ary[angle].y<0)
      print((unsigned char)(data_ary[angle].x*10.0), (unsigned char)(-data_ary[angle].y*10.0));
    else
      print((unsigned char)(data_ary[angle].x*10.0), (unsigned char)(data_ary[angle].y*10.0));
  }


  /*if(data_ary[angle].x<0){
    UART_write(1);
    UART_write((unsigned char)(-data_ary[angle].x*10.0));
  }
  else{
    UART_write(0);
    UART_write((unsigned char)(data_ary[angle].x*10.0));
  }

  if(data_ary[angle].y<0){
    UART_write(1);
    UART_write((unsigned char)(-data_ary[angle].y*10.0));
  }
  else{
    UART_write(0);
    UART_write((unsigned char)(data_ary[angle].y*10.0));
  }*/
}

void debug(_data data_ary[], char number)
{
  if(data_ary[number].x<0){
    if(data_ary[number].y<0)
      print((unsigned char)(-data_ary[number].x), (unsigned char)(-data_ary[number].y));
    else
      print((unsigned char)(-data_ary[number].x), (unsigned char)(data_ary[number].y));
  }
  else{
    if(data_ary[number].y<0)
      print((unsigned char)(data_ary[number].x), (unsigned char)(-data_ary[number].y));
    else
      print((unsigned char)(data_ary[number].x), (unsigned char)(data_ary[number].y));
  }

}


/* データ表示 */
//データ表示モジュール
void print(int x_data,int y_data)
{
  //x_data=111; y_data=222;

  //UART1_Write('X');  //シリアル出力(TXPin)
  //UART1_Write(x_data);
  printa(x_data);
  //UART1_Write('Y');
  //UART1_Write(y_data);
  printa(y_data);
  //UART1_Write(10);   //改行
  UART1_Write('\n');   //改行
}
//シリアルデータの出力
void printa(int j_data)
{
  //UART1_Write(':');
  //UART1_Write(dec2ascii((j_data-j_data%1000)/1000));                          //千の位
  UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));                         //百の位
  UART1_Write(dec2ascii((j_data%100-j_data%10)/10));                            //十の位
  UART1_Write(dec2ascii(j_data%10));                                            //一の位
  UART1_Write('\t');
  Delay_ms(1);
}
//10進数→ASCIIコード変換
short dec2ascii(int dec)
{
  switch(dec){
    case 0: return 48;
    case 1: return 49;
    case 2: return 50;
    case 3: return 51;
    case 4: return 52;
    case 5: return 53;
    case 6: return 54;
    case 7: return 55;
    case 8: return 56;
    case 9: return 57;
  }
  Delay_ms(1);
}