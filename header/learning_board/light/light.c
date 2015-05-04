void Setup();
void DAC_Init();

void Main()
{
  int i, count;

  Setup();

  DAC_Init();
  
  count = 0;

  while(1){
    for(i = 26; i < 31; i ++){
      DACCON1 = i;
      Delay_ms(500);
      count ++;
    }
    for(i = 31; i > 26; i --){
      DACCON1 = i;
      Delay_ms(500);
      count ++;
    }
    
    if(count >= 180){
      DACCON1 = 0;
      Delay_ms(20000);
      while(1){
        for(i = 26; i < 31; i ++){
          DACCON1 = i;
          Delay_ms(500);
        }
        for(i = 31; i > 26; i --){
          DACCON1 = i;
          Delay_ms(500);
        }
      }
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

void DAC_Init()
{
  DACCON0 = 0xE0;
  DACCON1 = 0x00;  //(Vdd * (DACCON1 / 2^5))
}