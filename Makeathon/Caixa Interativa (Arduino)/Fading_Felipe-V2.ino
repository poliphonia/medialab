/*
  Fading

  This example shows how to fade an LED using the analogWrite() function.

  The circuit:
  - LED attached from digital pin 9 to ground.

  created 1 Nov 2008
  by David A. Mellis
  modified 30 Aug 2011
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Fading
*/




  


int portaLDR = A0; //Porta analógica utilizada pelo LDR  
int portaLed = 10;    // LED connected to digital pin 9

void setup() {
 Serial.begin(9600);
pinMode(portaLed, OUTPUT); //Define a porta do Led como saída  
}

void loop() {

    int estado = analogRead(portaLDR);  //Lê o valor fornecido pelo LDR  
      Serial.println(estado);
  // Caso o valor lido na porta analógica seja maior do que 
  // 800, acende o LED  
  // Ajuste o valor abaixo de acordo com o seu circuito  

  /// AQUI É CONSTANTE !!!!!!!!!!!!!---------------------------------
  if (estado > 50){  
 for (int fadeValue = 0 ; fadeValue <= 255; fadeValue += 5) {
  // sets the value (range from 0 to 255):
  analogWrite(portaLed, fadeValue);
   // wait for 30 milliseconds to see the dimming effect
   delay(30);
 }
     // fade out from max to min in increments of 5 points:
 for (int fadeValue = 255 ; fadeValue >= 0; fadeValue -= 5) {
  // sets the value (range from 0 to 255):
  analogWrite(portaLed, fadeValue);
 // wait for 30 milliseconds to see the dimming effect
   delay(30);} 
 }
  else  //Caso contrário, apaga o led 
  {

      digitalWrite(portaLed, LOW);} 

  }




       /// AQUI É FADE IN FADE OUT !!!!!!!!!!!!!---------------------------------
 
// fade in from min to max in increments of 5 points:
//for (int fadeValue = 0 ; fadeValue <= 255; fadeValue += 5) {
//  // sets the value (range from 0 to 255):
//  analogWrite(portaLed, fadeValue);
//   // wait for 30 milliseconds to see the dimming effect
//   delay(30);
// }
//
// // fade out from max to min in increments of 5 points:
// for (int fadeValue = 255 ; fadeValue >= 0; fadeValue -= 5) {
//  // sets the value (range from 0 to 255):
//  analogWrite(portaLed, fadeValue);
// // wait for 30 milliseconds to see the dimming effect
//   delay(30);
// }
 
