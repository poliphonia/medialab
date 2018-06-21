#include <HCSR04.h>

HCSR04 hc(5, 6); //initialisation class HCSR04 (trig pin , echo pin)

void setup()
{
  Serial.begin(9600);
}

void loop()
{
//  if ( hc.dist() > 100 )
//    {
//      Serial.println( "Mais que 100" );
//    }
//  else
//  {
//    Serial.println( "Alooo");
//}
int numero = hc.dist();
   Serial.println(numero );  //return curent distance in serial
   delay (100);
}

