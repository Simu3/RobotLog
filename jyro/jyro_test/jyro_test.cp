#line 1 "C:/Users/i121326/Documents/workspace/robot/jyro/jyro_test/jyro_test.c"
void set_up();
int read(unsigned short);
void print(int, int);
void printa(int);
short dec2ascii(int);

void main() {
 set_up();

 while(1){
 print(read(1), read(2));
 }
}



void set_up()
{
 OSCCON=0x70;
 ANSELA=0b00000110;
 TRISA=0b00000110;

 PORTA=0x00;

 ADC_Init();

 UART1_Init(9600);
}


int read(unsigned short num){
 int j_data=0;

 j_data=ADC_Read(num);

 return j_data;
}



void print(int x_data,int y_data)
{
 UART1_Write('X');

 printa(x_data);
 UART1_Write('Y');

 printa(y_data);

 UART1_Write('\n');
}

void printa(int j_data)
{
 UART1_Write(':');
 UART1_Write(dec2ascii((j_data-j_data%1000)/1000));
 UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));
 UART1_Write(dec2ascii((j_data%100-j_data%10)/10));
 UART1_Write(dec2ascii(j_data%10));
 UART1_Write(' ');
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
