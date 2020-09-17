import processing.serial.*;

import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

Serial port;
float steering;
float vel1;
float vel2;
float vel;
ControlDevice device;
ControlIO control;

ControlSlider[] sliders = new ControlSlider[8];


void setup() {
  port = new Serial(this,"COM14",115200);
  port.clear();
  size(360, 200);
  
  control = ControlIO.getInstance(this);
  //cont = control.getMatchedDevice("dfgt");
  device = control.getDevice("Wireless controller for PLAYSTATION(R)3");
  //device = control.getDevice("Logitech Driving Force");
   if (device == null) {
    println("not today chump");
    System.exit(-1);
  }
  
  sliders[7] = device.getSlider(7);//left joystick
  sliders[0] = device.getSlider(0);
  sliders[1] = device.getSlider(1);
  //println(Arduino.list());
  /*arduino = new Arduino(this, Arduino.list()[3], 57600);
  arduino.pinMode(10, Arduino.SERVO);
  arduino.pinMode(11, Arduino.SERVO);*/
  
}

public void getUserInput(){
 // assign our float value 
 //access the controller.
 steering = map(sliders[7].getValue(), -1, 1, 0, 180);
 vel1 = map(sliders[0].getValue(), -1, 1, 90, 93);//110);
 vel2 = map(sliders[1].getValue(), -1, 1, 114, 93);
 vel = (vel1+vel2)/2;
 //println(thumb);
 
}

void draw(){
 keyPressed();
 println((int)steering);
 println((int)vel);
 //getUserInput();
 background(steering,100,255);
 
 //arduino.servoWrite(11, (int)vel2);
}

void keyPressed(){
 if(key=='s'){
 getUserInput();
 port.write(constrain((int)steering, 40, 140));
 port.write((int)vel);
 }
 if(key=='c')
 {
 port.clear();
 }
 if(key=='e'){
 port.write(89);
 port.write(96);
 port.clear();
 }
}
