void Setup();

void Main()
{
  int i;

  Setup();

  PWM1_Init(5000);
  
  PWM1_Start();

  while(1){
    for(i = 0; i < 255; i ++){
      PWM1_Set_Duty(i);
      Delay_ms(10);
    }
  }
}

void Setup()
{
  OSCCON = 0x70;

  ANSELA = 0x00;

  TRISA  = 0x00;

  PORTA  = 0x00;
}