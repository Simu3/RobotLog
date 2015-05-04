void SetUp();

void Main()
{
  SetUp();
  
  while(1){
    if(PORTA.B5){
      UART1_Write(0);        //right
      UART1_Write(0);
      UART1_Write(215);
      
      Soft_UART_Write(0);    //left
      Soft_UART_Write(1);
      Soft_UART_Write(215);
      
      Delay_ms(30);
    }
    else{
      UART1_Write(0);
      UART1_Write(0);
      UART1_Write(0);
      
      Soft_UART_Write(0);
      Soft_UART_Write(0);
      Soft_UART_Write(0);
      
      Delay_ms(30);
    }
  }
}

void SetUp()
{
  // Delay_ms(1000); /* ‚±‚ê‚ð“ü‚ê‚é‚ÆƒoƒO‚é 2014/10/08 */
  
  OSCCON = 0x70;
  
  ANSELA = 0x00;
  TRISA  = 0x20;
  PORTA  = 0x00;

  UART1_Init(9600);
  
  Soft_UART_Init(&PORTA, 1, 2, 9600, 0);
  
  Delay_ms(1000);
}