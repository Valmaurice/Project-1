PVector location, target;
boolean running = false;
PImage Erza,ataraxia,Clearheart,expression,background;



void setup() { 
  size(600, 800, P2D);
  
  location = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
   imageMode(CENTER);
   background=loadImage("background.jpg");
   Erza = loadImage("Erza.png");
   ataraxia = loadImage("ataraxia.png");
   Erza.resize(Erza.width/3,Erza.height/3);
   ataraxia.resize(ataraxia.width/4,ataraxia.height/4);

}

void draw() {
  image(background,width/2,height/2);
  
  PVector mouseLoc = new PVector(mouseX, mouseY);
  running = location.dist(mouseLoc) < 100;
  location = location.lerp(target, 0.1);

  if (running) {
    tint(255, 105, 105);
    expression=ataraxia;
    if (location.dist(target) < 5) {
      target = new PVector(random(width), random(height));
      
    }
  }
  else{
    tint(#766F6F);
    expression=Erza;
  }
  
  if(mousePressed){
    target.lerp(mouseLoc,0.9);
    tint(#FC4F4F);
    expression=ataraxia;
 

}
  
  image(expression,location.x, location.y);
  
}
