// This example code is in the public domain.

import processing.serial.*;

float redValue = 0;        // red value
float greenValue = 0;      // green value
float blueValue = 0;       // blue value

Serial myPort;


void setup() {
  size(800, 800);
  rectMode(CENTER); 

  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());

  // I know that the first port in the serial list on my Mac is always my
  // Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
}

void draw() {
  // DESENHE AQUI 


  //if (frameCount % 60 == 0){

  fill(255);
  textSize(14);
  text("Ilumine os lados da pirâmide com a LANTERNA do seu celular", width/2-200, height-50);

  //quadrado opacidade
  noStroke();
  fill(0, 25);
  rect(width/2, height/2, width, height);

  //float grossura = map(blueValue, 0, 500, 0, 15);

  //linha branca
  stroke(255);
  line(0, height/2, width/2-85, height/2);

  strokeWeight(random(7));
  stroke(redValue, greenValue, blueValue);
  line (width/2+100, height/2, width, (random(height)));

  strokeWeight(random(5));
  stroke(255);
  triangle(width/3, height*0.6, // pos1
    width*0.7, height*0.6, // pos2
    width/2, height/3); // pos3



  //println("vermelho é" + redValue);
  println(frameCount);
}

void serialEvent(Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);

    // split the string on the commas and convert the resulting substrings
    // into an integer array:
    float[] colors = float(split(inString, ","));

    // if the array has at least three elements, you know you got the whole
    // thing.  Put the numbers in the color variables:
    if (colors.length >= 3) {
      // map them to the range 0-255:
      redValue = map(colors[0], 0, 270, 0, 255);
      greenValue = map(colors[1], 0, 250, 0, 255);
      blueValue = map(colors[2], 0, 500, 0, 255);
    }
  }
}