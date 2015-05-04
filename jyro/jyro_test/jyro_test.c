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

/* 各種処理 */
//各種初期設定
void set_up()
{
  OSCCON=0x70;
  ANSELA=0b00000110;
  TRISA=0b00000110;

  PORTA=0x00;

  ADC_Init();       //AD変換ライブラリ初期化

  UART1_Init(9600); //シリアル通信ライブラリ初期化(baudrate:9600)
}

/* データ読み込み */
int read(unsigned short num){
  int j_data=0;
  
  j_data=ADC_Read(num);
  
  return j_data;
}

/* データ表示 */
//データ表示モジュール
void print(int x_data,int y_data)
{
  UART1_Write('X');  //シリアル出力(TXPin)
  //UART1_Write(x_data);
  printa(x_data);
  UART1_Write('Y');
  //UART1_Write(y_data);
  printa(y_data);
  //UART1_Write(10);   //改行
  UART1_Write('\n');   //改行
}
//シリアルデータの出力
void printa(int j_data)
{
  UART1_Write(':');
  UART1_Write(dec2ascii((j_data-j_data%1000)/1000));           //千の位
  UART1_Write(dec2ascii((j_data%1000-j_data%100)/100));        //百の位
  UART1_Write(dec2ascii((j_data%100-j_data%10)/10));           //十の位
  UART1_Write(dec2ascii(j_data%10));                          //一の位
  UART1_Write(' ');
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