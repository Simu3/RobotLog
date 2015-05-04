#line 1 "C:/Users/i121326/Documents/workspace/robot/controller/controller_plus/controller_plus.c"
void SetUp();

void Main()
{
 SetUp();

 while(1){
 if(PORTA.B5){
 UART1_Write(0);
 UART1_Write(0);
 UART1_Write(215);

 Soft_UART_Write(0);
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


 OSCCON = 0x70;

 ANSELA = 0x00;
 TRISA = 0x20;
 PORTA = 0x00;

 UART1_Init(9600);

 Soft_UART_Init(&PORTA, 1, 2, 9600, 0);

 Delay_ms(1000);
}
