PImage world;
void setup() {
    size(1000, 650);
    world = loadImage("WorldMap.jpg");
}

void draw() {
    image(world,0,0);
}