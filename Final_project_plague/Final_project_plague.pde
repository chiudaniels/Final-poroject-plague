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

void setup() {
    size(1600, 900);
    world = loadImage("WorldMap.jpg");
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
    australia.setFill(color(127));
    australia.setFill(false);
}

void draw() {
    //image(world,0,0);
    background(color(101,182,222));
    shape(australia,1250,575,175,175);
    shape(usa,170,280,285,200);
    shape(canada,30,30,460,300);
    shape(southamerica,380,470,200,330);
    shape(africa,700,390,300,350);
    shape(europe,740,120,215,300);
    shape(russia,910,50,675,290);
    shape(fareast,1090,300,310,170);
    shape(middleeast,900,280,350,250);
    shape(iceland,500,40,160,200);
    australia.disableStyle();
    australia.setFill(color(127));
}

void mousePressed(){
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
}