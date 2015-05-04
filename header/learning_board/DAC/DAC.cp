#line 1 "C:/Users/i121326/Documents/workspace/robot/header/learning_board/DAC/DAC.c"
void Setup();
void DAC_Init();

void Main()
{
 int i;

 Setup();

 DAC_Init();

 while(1){


 for(i = 15; i < 32; i ++){
 DACCON1 = i;
 Delay_ms(80);
 }
 for(i = 31; i > 15; i --){
 DACCON1 = i;
 Delay_ms(80);
 }
 }
}

void Setup()
{
 OSCCON = 0x70;

 ANSELA = 0x00;

 TRISA = 0x00;

 PORTA = 0x00;
}

void DAC_Init()
{
 DACCON0 = 0xE0;
 DACCON1 = 0x00;
}
