#include <multiCameraIrControl.h>
#include <util/delay.h>
#define F_CPU 20000000UL 
#define irLED 1 
#define statusLED 2
#define pushBUTTON1 3
#define pushBUTTON2 4
#define buzzerPIN 0
#define interVAL 3

Canon D5(irLED);

void setup( ) {
  pinMode(buzzerPIN, OUTPUT);
  pinMode(statusLED, OUTPUT);
  pinMode(pushBUTTON1, INPUT);
  pinMode(pushBUTTON2, INPUT);
  digitalWrite(pushBUTTON1, HIGH);
  digitalWrite(pushBUTTON2, HIGH);
}

void loop( ) {
  beep();
  _delay_ms(1000);
  if (digitalRead(pushBUTTON1) == LOW) {
    digitalWrite(statusLED, HIGH);
    D5.shutterNow();
    beep();
    delay(250);
    digitalWrite(statusLED, LOW);
  }
  if (digitalRead(pushBUTTON2) == LOW) {
    D5.shutterDelayed();      
    beep();
    delay(1000);      
    beep();
    delay(1000);      
    beep();
    delay(1000);
  }
}

void beep(){
  for( int i = 0; i < 50; i++)
  {   
    digitalWrite(buzzerPIN, HIGH);
    delayMicroseconds(100);
    digitalWrite(buzzerPIN, LOW);
    delayMicroseconds(100);
  }
}

void shootNow(){
  digitalWrite(statusLED, HIGH); //Timelapse active
  D5.shutterNow();
  beep();
  delay(250);
  digitalWrite(statusLED, LOW);
}

void shootDelayRec(){
  D5.shutterDelayed();      
  beep();
  delay(1000);      
  beep();
  delay(1000);      
  beep();
  delay(1000);
}

