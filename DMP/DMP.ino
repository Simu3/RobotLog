#include "Wire.h"
#include "I2Cdev.h"
#include "MPU6050_6Axis_MotionApps20.h"

bool blink_state = false;

MPU6050 mpu;

bool dmp_ready = false;

uint8_t  mpu_int_status;
uint8_t  dev_status;
uint16_t packet_size;
uint16_t fifo_count;
uint8_t  fifo_buffer[64];

Quaternion q;
VectorFloat gravity;
float ypr[3];
int right_data, left_data;
float pitch_off, roll_off;
int count = 0;

volatile bool mpu_interrupt = false;

void dmpDataReady()
{
  mpu_interrupt = true;
}

void setup()
{
  pinMode(7, INPUT);

  Wire.begin();
  
  Serial.begin(115200);
  
  while(!Serial);
  
  mpu.initialize();
  mpu.testConnection();
  
  /* setting parameter */
  mpu.setFullScaleAccelRange(0);
  mpu.setFullScaleGyroRange(0);
  mpu.setDHPFMode(0);
  mpu.setDLPFMode(0);
  mpu.setXAccelOffset(-5633);
  mpu.setYAccelOffset(-769);
  mpu.setZAccelOffset(2000);  
  mpu.setXGyroOffset(57);
  mpu.setYGyroOffset(9);
  mpu.setZGyroOffset(-4);
  
  dev_status = mpu.dmpInitialize();
  
  if(dev_status == 0){
    mpu.setDMPEnabled(true);
    mpu_int_status = mpu.getIntStatus();
    dmp_ready = true;
    packet_size = mpu.dmpGetFIFOPacketSize();
  }
  else{
    // Serial.print("failed\n");
    Serial.write('E');
    Serial.write('E');
    Serial.write('E');
  }
  
  delay(30000);
}

void loop()
{ 
  if(!dmp_ready)
    return;
  
  mpu_interrupt  = false;
  mpu_int_status = mpu.getIntStatus();
  
  fifo_count = mpu.getFIFOCount();
  
  if((mpu_int_status & 0x10) || (fifo_count == 1024)){
    mpu.resetFIFO();
    // Serial.print("overflow\n");
    Serial.write('E');
    Serial.write('E');
    Serial.write('E');
  }
  else if(mpu_int_status & 0x02){
    while(fifo_count < packet_size)
      fifo_count = mpu.getFIFOCount();
      
    mpu.getFIFOBytes(fifo_buffer, packet_size);
    
    fifo_count -= packet_size;
    
    mpu.dmpGetQuaternion(&q, fifo_buffer);
    mpu.dmpGetGravity(&gravity, &q);
    mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);

    ypr[1] *= 180 / M_PI * 10.0;
    ypr[2] *= 180 / M_PI * 10.0;

    if(count == 0){
      pitch_off = ypr[1];
      roll_off  = ypr[2];
      count ++;
    }

    ypr[1] -= pitch_off;
    ypr[2] -= roll_off;

    /* pitch 反転 */
    right_data = -ypr[1] - ypr[2] * 0.5;
    left_data  = -ypr[1] + ypr[2] * 0.5;
     
    if(right_data > 255){
      right_data = 255;
    }
    else if(right_data < -255){
      right_data = -255;
    }

    if(left_data > 255){
      left_data = 255;
    }
    else if(left_data < -255){
      left_data = -255;
    }

    if(1){//digitalRead(7) == HIGH){
        Serial.write('R');
        Serial.write((right_data >= 0) ? 'P' : 'M');
        Serial.write(abs(right_data));
        Serial.write('L');
        Serial.write((left_data >= 0) ? 'P' : 'M');
        Serial.write(abs(left_data));

        // Serial.print('R');
        // Serial.print((right_data >= 0) ? 'P' : 'M');
        // Serial.print(abs(right_data));
        // Serial.print("\t");
        // Serial.print('L');
        // Serial.print((left_data >= 0) ? 'P' : 'M');
        // Serial.print(abs(left_data));
        // Serial.print("\r\n");
    }
    else{
        Serial.write('R');
        Serial.write('P');
        Serial.write(0);
        Serial.write('L');
        Serial.write('P');
        Serial.write(0);

        // Serial.print('R');
        // Serial.print('P');
        // Serial.print(0);
        // Serial.print("\t");
        // Serial.print('L');
        // Serial.print('P');
        // Serial.print(0);
        // Serial.print("\r\n");
    }
  }
}