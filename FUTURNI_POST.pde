PImage img;
PFont font;

void setup() {
size(900,900,P3D);
img = loadImage("3.png");
font = createFont("Darvine-Regular-BF65fbe42214468.otf",300);



}

void draw() {
  

  
  background(0);
  fill(#A7190F);
  noStroke();
  push();
  textFont(font);
text("MON.O",100,250);
textAlign(CENTER,CENTER);

  translate(width/2, height/2);
  rotateY(radians(frameCount));
  
  float tiles = 150;
  float tileSize = width/tiles;
  
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float b = map(brightness(c),0,255,0,1);
      float z = map(b,0,1,-100, 100);
      
     
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      box(tileSize*b);
      
      pop();
    
    }
  
  }
  
  pop();

}

void text() {

}
