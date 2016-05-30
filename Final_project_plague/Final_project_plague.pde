PImage world;
Country australia;
Country usa;
Country canada;
Country fareast;
Country europe;
Country iceland;
Country africa;
Country middleeast;
Country russia;
Country southamerica;
int loopColor1 = 0;
int loopColor2 = 120;
int loopColor3 = 240;

void setup() {
  size(1300, 800);
  background(color(101,182,222));
  australia = new Country(1250*(13./16.),575*(8./9.),175*(13./16.),175*(8./9.),"australia","australia.svg");
  usa = new Country (170*(13./16.),280*(8./9.),285*(13./16.),200*(8./9.),"usa","USA.svg");
  canada= new Country (30*(13./16.),30*(8./9.),460*(13./16.),300*(8./9.),"canada","canada.svg");
  fareast= new Country (1090*(13./16.),300*(8./9.),310*(13./16.),170*(8./9.),"fareast","fareast.svg");
  europe = new Country (740*(13./16.),120*(8./9.),215*(13./16.),275*(8./9.),"europe","europe.svg");
  iceland = new Country (500*(13./16.),40*(8./9.),160*(13./16.),200*(8./9.),"iceland", "iceland.svg");
  africa = new Country (700*(13./16.),390*(8./9.),300*(13./16.),350*(8./9.), "africa","africa.svg");
  middleeast= new Country (900*(13./16.),280*(8./9.),350*(13./16.),250*(8./9.),"middleeast","middleeast.svg");
  russia = new Country (910*(13./16.),50*(8./9.),675*(13./16.),290*(8./9.),"russia","russia.svg");
  southamerica = new Country (380*(13./16.),470*(8./9.),200*(13./16.),330*(8./9.),"southamerica","southamerica.svg");

}

void draw() {
  background(color(101, 182, 222));
  australia.drawer();
  usa.drawer();
  canada.drawer();
  fareast.drawer();
  europe.drawer();
  iceland.drawer();
  africa.drawer();
  middleeast.drawer();
  russia.drawer();
  
}

void mousePressed(){
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
}