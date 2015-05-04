void setup();
void run_h(int, int, int);
void run_s(int, int, int);

void main(){
  setup();

  while(1){
    run_s(128, 0, 100);
    run_h(128, 4, 100);
  }
}

void setup()
{
  OSCCON = 0x70;
  
  ANSELA = 0x00;
  TRISA  = 0x00;
  PORTA  = 0x00;
  
  APFCON.TXCKSEL = 0;
  APFCON.RXDTSEL = 0;
  
  UART1_Init(9600);
  
  Soft_UART_Init(&PORTA, 3, 2, 9600, 0);
  
  delay_ms(10);
}

void run_h(int address,int command,int Data)
{
     UART1_write(address);
     UART1_write(command);
     UART1_write(Data);
     UART1_write((address+command+Data) & 0x7f);
     delay_ms(1);
}

void run_s(int address,int command,int Data)
{
     Soft_UART_Write(address);
     Soft_UART_Write(command);
     Soft_UART_Write(Data);
     Soft_UART_Write((address+command+Data) & 0x7f);
     delay_ms(1);
}