#line 1 "C:/workspace/robot/jyro/jyro_angle_v2/jyro_angle_v2.c"






typedef struct{
 double x;
 double y;
}_data;

enum {bias, md, old_a, new_a, old_v, new_v, angle};

void set_up();
void init_struct(_data[]);
void read(_data[]);
void read_bias(_data[]);
void md2aa(_data[]);
void aa2av(_data[]);
void av2a(_data[]);
void output(_data[]);
void debug(_data[], char);

void print(int, int);
void printa(int);
short dec2ascii(int);

void main()
{
 _data data_ary[7];
 short i,j;
 bit flag;
 set_up();
 init_struct(data_ary);
 read_bias(data_ary);

 data_ary[bias].x=0.0;
 data_ary[bias].y=0.0;
 data_ary[angle].x=0.0;
 data_ary[angle].y=0.0;

 while(1){
 for(j=0; j<10; j++){
 data_ary[old_v].x=data_ary[new_v].x;
 data_ary[old_v].y=data_ary[new_v].y;

 for(i=0; i<10; i++){
 data_ary[old_a].x=data_ary[new_a].x;
 data_ary[old_a].y=data_ary[new_a].y;
 flag=0;
 INTCON.TMR0IF=0;
 TMR0=0;

 while(flag==0){
 if(INTCON.TMR0IF==1){
 read(data_ary);
 flag=1;
 }
 }


 md2aa(data_ary);

 aa2av(data_ary);

 }

 data_ary[new_v].x/10.0;
 data_ary[new_v].y/10.0;



 av2a(data_ary);

 }


 data_ary[angle].x/10.0;
 data_ary[angle].y/10.0;


 debug(data_ary, angle);

 init_struct(data_ary);
 }

}

void set_up()
{
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

 delay_ms(5000);
}

void init_struct(_data data_ary[])
{
 char i;

 for(i=md; i<new_v; i++){
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

 data_ary[bias].x=data_ary[bias].x/1000.0;
 data_ary[bias].y=data_ary[bias].y/1000.0;


}

void md2aa(_data data_ary[])
{
 data_ary[new_a].x=(data_ary[md].x-data_ary[bias].x)* 0.0048875855 * 149.25373134 ;
 data_ary[new_a].y=(data_ary[md].y-data_ary[bias].y)* 0.0048875855 * 149.25373134 ;
}

void aa2av(_data data_ary[])
{
 data_ary[new_v].x+=(data_ary[old_a].x+data_ary[new_a].x)* 0.000128 /2.0;
 data_ary[new_v].y+=(data_ary[old_a].y+data_ary[new_a].y)* 0.000128 /2.0;
}

void av2a(_data data_ary[])
{
 data_ary[angle].x+=(data_ary[old_v].x+data_ary[new_v].x)* 0.000128 /2.0;
 data_ary[angle].y+=(data_ary[old_v].y+data_ary[new_v].y)* 0.000128 /2.0;
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
#line 200 "C:/workspace/robot/jyro/jyro_angle_v2/jyro_angle_v2.c"
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




void print(int x_data,int y_data)
{




 printa(x_data);


 printa(y_data);

 UART1_Write('\n');
}

void printa(int j_data)
{


 UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));
 UART1_Write(dec2ascii((j_data%100-j_data%10)/10));
 UART1_Write(dec2ascii(j_data%10));
 UART1_Write('\t');
 Delay_ms(1);
}

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
