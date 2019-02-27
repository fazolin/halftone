import processing.svg.*;

PImage img;

float r, g, b, lumi;
int resolution =10; // resolução do halftone
int factorEllipse = 100; // tamanho da elipse ( maior o número, menos a ellipse)

void setup() {
  size(1844, 771); // colocar resolução do arquivo original
  img = loadImage("girl.png"); // colocar arquivo na pasta data
  noLoop();
  beginRecord(SVG, "filename.svg"); // nome de saida
}

void draw() {
  background(0);
  loadPixels(); 

  img.loadPixels(); 
  for (int y = 0; y < height; y=y+resolution) {
    for (int x = 0; x < width; x=x+resolution) {
      int loc = x + y*width;
      r = red(img.pixels[loc]);
      g = green(img.pixels[loc]);
      b = blue(img.pixels[loc]);
      lumi = (r+g+b)/factorEllipse;
      noStroke();
      fill(255);
      ellipse(x, y, lumi, lumi);
    }
  }
  endRecord();
}
