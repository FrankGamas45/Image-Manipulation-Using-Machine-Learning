import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.utils.*;

PImage img;
int delta = 5;
int widthMax = 4032;
int heightMax = 3024;

void setup(){
  img = loadImage("Images/IMG_2033.JPG");
  System.out.println("Width is.... equal to " + img.width);
  System.out.println("Height is.... equal to " + img.height);
  size(4032, 3024);
}

void draw(){
  delta();
  dilate();
  System.out.println("Done");
}
