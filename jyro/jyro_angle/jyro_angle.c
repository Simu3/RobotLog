#define SEN 0.67                                                                //sensitivity of ENC-03R is 0.67mV/deg/sec
#define D2A (5.0/1023.0)                                                        //parameter of D/A convert
#define MC (1.0/(2.0*1000000.0)*256.0)                                          //measurement cycle : 128[us]
#define AN_X 0                                                                  //ANpin of x_jyro's data
#define AN_Y 1                                                                  //ANpin of y_jyro's data
#define XSIGN PORTE.B1                                                          //X-axis data's sign (plus: 0, minus : 1)
#define X8 PORTE.B2                                                             //integer part 0bit
#define X7 PORTA.B7                                                             //integer part 1bit
#define X6 PORTA.B6                                                             //integer part 2bit
#define X5 PORTC.B0                                                             //integer part 3bit
#define X4 PORTC.b1                                                             //integer part 4bit
#define X3 PORTC.B2                                                             //fractional part 0bit
#define X2 PORTC.B3                                                             //fractional part 1bit
#define X1 PORTD.B0                                                             //fractional part 2bit
#define X0 PORTD.B1                                                             //fractional part 3bit
#define YSIGN PORTD.B7                                                          //X-axis data's sign (plus: 0, minus : 1)
#define Y8 PORTD.B6                                                             //integer part 0bit
#define Y7 PORTD.B5                                                             //integer part 1bit
#define Y6 PORTD.B4                                                             //integer part 2bit
#define Y5 PORTC.B7                                                             //integer part 3bit
#define Y4 PORTC.B6                                                             //integer part 4bit
#define Y3 PORTC.B5                                                             //fractional part 0bit
#define Y2 PORTC.B4                                                             //fractional part 1bit
#define Y1 PORTD.B3                                                             //fractional part 2bit
#define Y0 PORTD.B2                                                             //fractional part 3bit

typedef struct{                                                                 //data of jyro structure
  double x;                                                                     //X-axis data
  double y;                                                                     //Y-axis data
}_data;

enum {bias, md, old_a, new_a, old_v, new_v, angle};
enum {sign, bit8, bit7, bit6, bit5, bit4, bit3, bit2, bit1, bit0};

void set_up(_data[]);                                                           //initialize : register, structure
void read(_data[]);                                                             //measure, A/D convert : analog jyro data Å® digital jyro data
void read_bias(_data[]);                                                        //measure : bias voltage
void md2aa(_data[]);                                                            //convert : measurement data Å® angular acceleration
void aa2av(_data[]);                                                            //convert : angular acceleration Å® angular velocity
void av2a(_data[]);                                                             //convert : angular velocity Å® angle
void pout(_data[]);                                                             //output : parallel data of angle
void dec2bit(int, char[]);                                                      //convert : angle Å® parallel data

void main()
{
  _data data_ary[7];                                                            //data array
  short i,j;                                                                    //roop variable
  bit flag;                                                                     //timer's state (overflow : 1, nomal : 0)
  set_up(data_ary);
  read_bias(data_ary);

  while(1){
    for(j=0; j<10; j++){                                                        //ìÒèdêœï™ÇçsÇ¡Çƒ
      data_ary[old_v].x=data_ary[new_v].x;                                      //ÇªÇÍÇºÇÍÇÃêœï™Ç≈
      data_ary[old_v].y=data_ary[new_v].y;                                      //10âÒï™ÇÃïΩãœÇÇ∆Ç¡ÇƒÇ¢ÇÈ
                                                                                //
      for(i=0; i<10; i++){                                                      //ë™íËÇÃä‘äuÇÕÉ^ÉCÉ}Å[ÉåÉWÉXÉ^Ç…ÇÊÇË
        INTCON.TMR0IF=0;                                                        //ñÒ0.1[ms]Ç∆Ç»Ç¡ÇƒÇ¢ÇÈÇΩÇﬂ
        TMR0=0;                                                                 //ç≈èIìIÇ»äpìxÇÃílÇ™éZèoÇ≥ÇÍÇÈÇÃÇÕ
        flag=0;                                                                 //10[ms]ñàÇ∆Ç»ÇÈ
        data_ary[old_a].x=data_ary[new_a].x;                                    //
        data_ary[old_a].y=data_ary[new_a].y;                                    //
        do{                                                                     //
          if(INTCON.TMR0IF==1){                                                 //
            read(data_ary);                                                     //
            md2aa(data_ary);                                                    //
            flag=1;                                                             //
          }                                                                     //
        }while(flag==0);                                                        //
        aa2av(data_ary);                                                        //
      }                                                                         //
                                                                                //
      data_ary[new_v].x/10.0;                                                   //
      data_ary[new_v].x/10.0;                                                   //
                                                                                //
      av2a(data_ary);                                                           //
    }                                                                           //
                                                                                //
    data_ary[angle].x/10.0;                                                     //
    data_ary[angle].y/10.0;                                                     //

    pout(data_ary);
  }
}

void set_up(_data data_ary[])
{
  short i;

  OSCCON=0x70;                                                                  //oscillator set up : frequency of inside oscillator Å© 8[MHz]
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

  PORTA=0x00;                                                                   //initialize : PORTA Å© 0
  PORTB=0x00;                                                                   //initialize : PORTA Å© 0
  PORTC=0x00;                                                                   //initialize : PORTC Å© 0
  PORTD=0x00;                                                                   //initialize : PORTA Å© 0
  PORTE=0x00;                                                                   //initialize : PORTA Å© 0

  ADC_Init();                                                                   //initialize : A/D convert library

  UART1_Init(9600);                                                             //initialize : baudrate Å© 9600

  for(i=bias; i<angle; i++){                                                    //initialize : data structure
    data_ary[i].x=0.0;                                                          //    Åb
    data_ary[i].y=0.0;                                                          //    Å´
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
    data_ary[bias].x+=ADC_read(AN_X);                                           //   Åb
    data_ary[bias].y+=ADC_read(AN_Y);                                           //   Åb
    delay_ms(1);                                                                //   Å´
  }                                                                             //  end

  data_ary[bias].x=data_ary[bias].x/1000.0*D2A/SEN;                             //convert : measurement data Å® angular acceleration(0Åã)
  data_ary[bias].y=data_ary[bias].y/1000.0*D2A/SEN;
}

void md2aa(_data data_ary[])
{
  data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)*D2A/SEN;
  data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)*D2A/SEN;
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

void pout(_data data_ary[])
{
  char tmp[10]={0,0,0,0,0,0,0,0,0,0};

  dec2bit((int)(data_ary[angle].x*10.0+0.5), tmp);                              //convert : double Å® int (floating point 1)*10
  XSIGN=tmp[sign];
  X8=tmp[bit8];
  X7=tmp[bit7];
  X6=tmp[bit6];
  X5=tmp[bit5];
  X4=tmp[bit4];
  X3=tmp[bit3];
  X2=tmp[bit2];
  X1=tmp[bit1];
  X0=tmp[bit0];

  dec2bit((int)(data_ary[angle].y*10.0+0.5), tmp);
  YSIGN=tmp[sign];
  Y8=tmp[bit8];
  Y7=tmp[bit7];
  Y6=tmp[bit6];
  Y5=tmp[bit5];
  Y4=tmp[bit4];
  Y3=tmp[bit3];
  Y2=tmp[bit2];
  Y1=tmp[bit1];
  Y0=tmp[bit0];
}

void dec2bit(int dec, char pal[])
{
  if(dec<0){                                                                    //set : sign of data and change data to absolute value
    pal[sign]=1;                                                                // Åb
    dec=-dec;                                                                   // Åb
  }                                                                             // Åb
  else                                                                          // Å´
    pal[sign]=0;                                                                //end

  pal[bit8]=(dec&0x100)>>8;                                                     //get : bit of number 8
  pal[bit7]=(dec&0x80)>>7;                                                      //get : bit of number 7
  pal[bit6]=(dec&0x40)>>6;                                                      //get : bit of number 6
  pal[bit5]=(dec&0x20)>>5;                                                      //get : bit of number 5
  pal[bit4]=(dec&0x10)>>4;                                                      //get : bit of number 4
  pal[bit3]=(dec&0x08)>>3;                                                      //get : bit of number 3
  pal[bit2]=(dec&0x04)>>2;                                                      //get : bit of number 2
  pal[bit1]=(dec&0x02)>>1;                                                      //get : bit of number 1
  pal[bit0]=dec&0x01;                                                           //get : bit of number 0
}