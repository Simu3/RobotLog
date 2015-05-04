#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro/jyro_angle/jyro_angle.c"
#line 27 "C:/Users/i121326/Documents/workspace/robot/jyro/jyro_angle/jyro_angle.c"
typedef struct{
 double x;
 double y;
}_data;

enum {bias, md, old_a, new_a, old_v, new_v, angle};
enum {sign, bit8, bit7, bit6, bit5, bit4, bit3, bit2, bit1, bit0};

void set_up(_data[]);
void read(_data[]);
void read_bias(_data[]);
void md2aa(_data[]);
void aa2av(_data[]);
void av2a(_data[]);
void pout(_data[]);
void dec2bit(int, char[]);

void main()
{
 _data data_ary[7];
 short i,j;
 bit flag;
 set_up(data_ary);
 read_bias(data_ary);

 while(1){
 for(j=0; j<10; j++){
 data_ary[old_v].x=data_ary[new_v].x;
 data_ary[old_v].y=data_ary[new_v].y;

 for(i=0; i<10; i++){
 INTCON.TMR0IF=0;
 TMR0=0;
 flag=0;
 data_ary[old_a].x=data_ary[new_a].x;
 data_ary[old_a].y=data_ary[new_a].y;
 do{
 if(INTCON.TMR0IF==1){
 read(data_ary);
 md2aa(data_ary);
 flag=1;
 }
 }while(flag==0);
 aa2av(data_ary);
 }

 data_ary[new_v].x/10.0;
 data_ary[new_v].x/10.0;

 av2a(data_ary);
 }

 data_ary[angle].x/10.0;
 data_ary[angle].y/10.0;

 pout(data_ary);
 }
}

void set_up(_data data_ary[])
{
 short i;

 OSCCON=0x70;
 OPTION_REG=0x08;

 ANSELA=0x03;
 ANSELB=0x00;
 ANSELD=0x00;
 ANSELE=0x00;
 TRISA=0x03;
 TRISB=0x00;
 TRISC=0x00;
 TRISD=0x00;
 TRISE=0x00;

 PORTA=0x00;
 PORTB=0x00;
 PORTC=0x00;
 PORTD=0x00;
 PORTE=0x00;

 ADC_Init();

 UART1_Init(9600);

 for(i=bias; i<angle; i++){
 data_ary[i].x=0.0;
 data_ary[i].y=0.0;
 }
}

void read(_data data_ary[])
{
 data_ary[md].x=ADC_read( 0 );
 data_ary[md].y=ADC_read( 1 );
}

void read_bias(_data data_ary[])
{
 int i;

 for(i=0; i<1000; i++){
 data_ary[bias].x+=ADC_read( 0 );
 data_ary[bias].y+=ADC_read( 1 );
 delay_ms(1);
 }

 data_ary[bias].x=data_ary[bias].x/1000.0* (5.0/1023.0) / 0.67 ;
 data_ary[bias].y=data_ary[bias].y/1000.0* (5.0/1023.0) / 0.67 ;
}

void md2aa(_data data_ary[])
{
 data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)* (5.0/1023.0) / 0.67 ;
 data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)* (5.0/1023.0) / 0.67 ;
}

void aa2av(_data data_ary[])
{
 data_ary[new_v].x+=(data_ary[old_a].x+data_ary[new_a].x)* (1.0/(2.0*1000000.0)*256.0) /2.0;
 data_ary[new_v].y+=(data_ary[old_a].y+data_ary[new_a].y)* (1.0/(2.0*1000000.0)*256.0) /2.0;
}

void av2a(_data data_ary[])
{
 data_ary[angle].x+=(data_ary[old_v].x+data_ary[new_v].x)* (1.0/(2.0*1000000.0)*256.0) /2.0;
 data_ary[angle].y+=(data_ary[old_v].y+data_ary[new_v].y)* (1.0/(2.0*1000000.0)*256.0) /2.0;
}

void pout(_data data_ary[])
{
 char tmp[10]={0,0,0,0,0,0,0,0,0,0};

 dec2bit((int)(data_ary[angle].x*10.0+0.5), tmp);
  PORTE.B1 =tmp[sign];
  PORTE.B2 =tmp[bit8];
  PORTA.B7 =tmp[bit7];
  PORTA.B6 =tmp[bit6];
  PORTC.B0 =tmp[bit5];
  PORTC.b1 =tmp[bit4];
  PORTC.B2 =tmp[bit3];
  PORTC.B3 =tmp[bit2];
  PORTD.B0 =tmp[bit1];
  PORTD.B1 =tmp[bit0];

 dec2bit((int)(data_ary[angle].y*10.0+0.5), tmp);
  PORTD.B7 =tmp[sign];
  PORTD.B6 =tmp[bit8];
  PORTD.B5 =tmp[bit7];
  PORTD.B4 =tmp[bit6];
  PORTC.B7 =tmp[bit5];
  PORTC.B6 =tmp[bit4];
  PORTC.B5 =tmp[bit3];
  PORTC.B4 =tmp[bit2];
  PORTD.B3 =tmp[bit1];
  PORTD.B2 =tmp[bit0];
}

void dec2bit(int dec, char pal[])
{
 if(dec<0){
 pal[sign]=1;
 dec=-dec;
 }
 else
 pal[sign]=0;

 pal[bit8]=(dec&0x100)>>8;
 pal[bit7]=(dec&0x80)>>7;
 pal[bit6]=(dec&0x40)>>6;
 pal[bit5]=(dec&0x20)>>5;
 pal[bit4]=(dec&0x10)>>4;
 pal[bit3]=(dec&0x08)>>3;
 pal[bit2]=(dec&0x04)>>2;
 pal[bit1]=(dec&0x02)>>1;
 pal[bit0]=dec&0x01;
}
