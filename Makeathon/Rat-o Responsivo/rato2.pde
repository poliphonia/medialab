import processing.serial.*;

float valor = 0;        // red value
PImage img;  // Declare variable "a" of type PImage
PImage img2;  // Declare variable "a" of type PImage
PImage img3;  // Declare variable "a" of type PImage

int numFrames = 10;
int currentFrame = 02;
PImage[] images = new PImage[numFrames];

Serial myPort;

void setup() {
  size (800, 600);
  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  frameRate(15);

  img = loadImage("ovo.jpg");// 
  img2 = loadImage("racha.jpg");
  img3 = loadImage("pinto.jpg");
  
  for (int i = 0; i < numFrames; i++) {
    String imageName = "rato" + nf(i, 2) + ".jpg";
    images[i] = loadImage(imageName);
  }
}

void draw ()
{
background(0);
 // ellipse(width/2, height/2, valor, valor);

  if ( valor <= 199 ) {
    image(images[currentFrame], 0, 0);
    currentFrame += 1; // moving on to the next image
    if(currentFrame >= images.length){
    currentFrame = 02;
    }
  } else if ( valor > 200 ) {
    image(images[currentFrame], 0, 0);
  }
  println(valor);
}

void serialEvent(Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  //if (inString != null) {
  //  // trim off any whitespace:
  //  inString = trim(inString);

  // split the string on the commas and convert the resulting substrings
  // into an integer array:
  float[] LC = float(split(inString, ","));

  // if the array has at least three elements, you know you got the whole
  // thing.  Put the numbers in the color variables:
  if (LC.length != 0) {
    //  // map them to the range 0-255:
    valor = map(LC[0], 0, 100, 0, 400);
    //}
  }
}