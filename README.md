# FPV RC car Using Steering Gamecontroller on NITAC graduate study
> Steering controlled FPV RC car, by using Arduino, Xbee, processing, and windows 10 PC.

This is my second project that something to build using Arduino.
It contains creating Steering Controlled RC system on Tamiya XB TT01D-Type-E TOYOTA 86.

I've played some racing games for many years. I like to operate 
That passion made me coming up with a **GOOD IDEA**.

Terms: Since 2020 July.

## Features
FPV systems are existing tech used on drone, RC car and etc.
It includes complicated electrical and modulation system remodeling.
At the point of using game controller, bluetooth wireless controllers are often adopted by using designated Arduino bluetooth contoroller API.
It is difficult to convert steering controller to RC transmitter without Arduino API.
But using processing and serial connection by Xbee modules make me easy to build objective FPV RC systems.
### Gamecontrolplus
Loosely saying, this works to correspodent any gamecontroller to PC as a RC car input device. Please refer [here](http://lagers.org.uk/gamecontrol/).
### Processing Serial, Xbee
These establish wireless connection PC to Arduino. Please refer [this Xbee1](https://www.storange.jp/2017/05/arduinoxbee.html), [here Xbee2](https://qiita.com/s_fujii/items/9804eaf3599139164aa3),
[here processing serial](https://processing.org/reference/libraries/serial/index.html).
## Tools

1. PC
1. GT Force Pro x1 
1. Arduino UNO x1
1. Xbee S2C x2
1. Wireless proto shield x1 (receiver) It might be not for sale.
1. Xbee usb shield x1 (transmitter)
1. Wires, Cables
1. Tamiya XB series TT01D-Type-E TOYOTA 86. I think that any Tamiya XB series goes.
1. XCTU
1. gopro max x1
## Installation

- Install Arduino IDE. [here](https://www.arduino.cc/en/main/software/).
- Install Processing. [here](https://processing.org/download/)
- Set up XBee as coordinater(transmitter) and rooter(receiver) on XCTU.
- Wiring Arduino to servo and DC motor.(motor cables are easy to connect by jumper wire)
- write xbee_rc.ino on Arduino
- connect GT Force Pro and transmitter Xbee on PC
- run xbee_rc_processing.pde on processing IDE
- Set up your python environment ver.3.7 32 bit
- install gopropy-api on your python environment [refer here](https://github.com/KonradIT/gopro-py-api). and [using guide is here](https://github.com/KonradIT/goprowifihack/blob/master/MAX/MAX-Commands.md). 
- Wiring like them.


![3 3V_Servo](https://user-images.githubusercontent.com/27892408/112413429-88b87200-8d63-11eb-8487-92c1041ecdaf.png)


- **NOTICE**
Arduino might be broken by Overvoltage.
Please refer carefully specification of your RC Servos.


## Future plans
Implement 
- ~~FPV cam, Gopro max enable to see the live streaming video on PC.~~
- Improving streaming latency.
- ~~Mock shifting system.~~
- Driving assist system.


## Get Feedback

Requests are welcome.
Even if I don't have a lot of technical knowledge,
as a student majored on Electrical and Electronics engineering,
I'm eager to do my best performance.
Pleased to make your acquaintance.

## Author

This document is written by
- Takahashi Shoutarou
- National Institute of Technology, Akashi College, electrical and information technology department, electrical and electronics engineering course

## License

This project is **Confidential**.
