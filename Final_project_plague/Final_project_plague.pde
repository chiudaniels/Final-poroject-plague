PImage world;
PShape australia;
void setup() {
    size(1600, 900);
    world = loadImage("WorldMap.jpg");
    australia = loadShape("australia.svg"); 
}

void draw() {
    image(world,0,0);
    //background(100);
    shape(australia,1250,575,175,175);
    fill(0);
}