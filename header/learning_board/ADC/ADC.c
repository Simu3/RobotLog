#define AN_pin 1

void Setup();
void DAC_Init();
int map(int, int, int, int, int);

void Main()
{
  int tmp;

  Setup();

  DAC_Init();
  
  ADC_Init();

  while(1){
    tmp = ADC_Read(AN_pin);
    DACCON1 = map(tmp, 0, 1023, 0, 31);
    Delay_us(10);
  }
}

void Setup()
{
  OSCCON = 0x70;

  ANSELA = 0x02;

  TRISA  = 0x02;

  PORTA  = 0x00;
}

void DAC_Init()
{
  DACCON0 = 0xE0;
  DACCON1 = 0x00;  //(Vdd * (DACCON1 / 2^5))
}

int map(int val, int from_low, int from_high, int to_low, int to_high)
{
  return (val - from_low) * (to_high - to_low) / (from_high - from_low) + to_low;
}