/*
* Servo & Speed Controller
* Processing ---- SVSC_P
* Arduino Duemilanove ---- SVSC_A
*/

#include <Servo.h>
Servo servo;
Servo speedcontroller;
//int val1;
//int val2;

//int servoneutral = 63;
//int speedcontrollerneutral = 63;

int steering=89; //= servoneutral;
int vel=96; //= speedcontrollerneutral;
//int reversea = 'F';
//boolean reverseb = false;

void setup() {
  Serial.begin(115200);
  servo.attach(10);//10
  speedcontroller.attach(11);//11
}

void loop() {
  if(Serial.available()>2){
    steering = Serial.read();
    vel = Serial.read();
    //val3 = Serial.read();
    Serial.print(65);
  }
  servo.write(steering);
  speedcontroller.write(vel);
}
