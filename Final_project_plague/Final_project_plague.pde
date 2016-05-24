PImage world;
PShape australia;
PShape usa;
PShape canada;
PShape fareast;
PShape europe;
PShape iceland;
PShape africa;
PShape middleeast;
PShape russia;
PShape southamerica;
int loopColor1 = 0;
int loopColor2 = 120;
int loopColor3 = 240;

void setup() {
    size(1600, 900);
    world = loadImage("WorldMap.jpg");
    background(color(101,182,222));
    australia = loadShape("australia.svg");
    usa = loadShape("USA.svg");
    canada= loadShape("canada.svg");
    fareast= loadShape("fareast.svg");
    europe = loadShape("europe.svg");
    iceland = loadShape("iceland.svg");
    africa = loadShape("africa.svg");
    middleeast= loadShape("middleeast.svg");
    russia = loadShape("russia.svg");
    southamerica = loadShape("southamerica.svg");
    australia.disableStyle();
    usa.disableStyle();
    canada.disableStyle(); 
    southamerica.disableStyle();
    africa.disableStyle();
    europe.disableStyle();
    russia.disableStyle();
    fareast.disableStyle();
    middleeast.disableStyle();
    iceland.disableStyle();
    /*
    australia.setFill(false);
    usa.setFill(false);
    canada.setFill(false);
    southamerica.setFill(false);
    africa.setFill(false);
    europe.setFill(false);
    russia.setFill(false);
    fareast.setFill(false);
    middleeast.setFill(false);
    iceland.setFill(false);
    */
}

void draw() {
  /*
  background(color(101, 182, 222));
  shape(australia,1250,575,175,175);
  fill(color(127,1, 10));
  shape(usa,170,280,285,200);
  fill(color(320, 20, 1));
  shape(canada,30,30,460,300);
  fill(color(10, 320, 20));
  shape(southamerica,380,470,200,330);
  fill(color(10, 120, 120));
  shape(africa,700,390,300,350);
  fill(color(10, 120, 320));
  shape(europe,740,120,215,300);
  fill(color(10, 200, 120));
  shape(russia,910,50,675,290);
  fill(color(200, 120, 320));
  shape(fareast,1090,300,310,170);
  fill(color(120, 200, 320));
  shape(middleeast,900,280,350,250);
  fill(color(100, 100, 100));
  shape(iceland,500,40,160,200);
  */
  background(color(101, 182, 222));
  fill(color(250, int(random(255)), int (random(255))));
  shape(australia,1250,575,175,175);
  fill(color(int(random(255)), 250, int(random(255))));
  shape(usa,170,280,285,200);
  shape(canada,30,30,460,300);
  shape(southamerica,380,470,200,330);
  fill(color(250, int(random(255)), int (random(255))));  
  shape(africa,700,390,300,350);
  fill(color(250, int(random(255)), int (random(255))));  
  shape(europe,740,120,215,300);
  shape(russia,910,50,675,290);
  shape(fareast,1090,300,310,170);
  shape(middleeast,900,280,350,250);
  fill(color(250, int(random(255)), int (random(255))));  
  shape(iceland,500,40,160,200);
  
}
/*
void mousePressed(){
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
}
*/