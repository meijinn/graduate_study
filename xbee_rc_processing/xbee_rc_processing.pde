import processing.serial.*;

import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

Serial port;
float steering;
float vel;

ControlDevice device;
ControlIO control;

ControlSlider[] sliders = new ControlSlider[2];

void setup(){
  //XBee Explorer USB
  port=new Serial(this,"COM14",115200);
  port.clear();
  size(360, 200);
  
  control = ControlIO.getInstance(this);

  device = control.getDevice("Logitech Driving Force");
   if (device == null) {
    println("not today chump");
    System.exit(-1);
  }
  
  sliders[0] = device.getSlider(0);//left joystick
  sliders[1] = device.getSlider(1);

}
void draw(){
keyPressed();
println((int)steering);
println((int)vel);
}

public void getUserInput(){
 // assign our float value 
 //access the controller.
 steering = map(sliders[0].getValue(), -1, 1, 0, 180);
 vel = map(sliders[1].getValue(), -1, 1, 92, 104);//92, 104

}

void keyPressed(){
 if(key=='s'){
 getUserInput();
 port.write(constrain((int)steering, 40, 140));//40, 140
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
