PImage world;
PShape australia;
void setup() {
    size(1000, 650);
    world = loadImage("WorldMap.jpg");
    australia = loadShape("australia.svg"); 
}

void draw() {
    image(world,100,100);
    //background(100);
    shape(australia,100,100,100,100);
    fill(0);
}