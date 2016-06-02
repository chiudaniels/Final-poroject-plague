import g4p_controls.*;

ArrayList <Country> Countries;
PImage world;
Country australia;
Country usa;
Country canada;
Country fareast;
Country europe;
Country greenland;
Country africa;
Country middleeast;
Country russia;
Country southamerica;
int countryIndex;
GWindow window;

void setup() {
  Countries = new ArrayList<Country>();
  size(1300, 800);
  background(color(101,182,222));
  australia = new Country(1250*(13./16.),575*(8./9.),175*(13./16.),175*(8./9.),"australia","australia.svg");
  usa = new Country (170*(13./16.),280*(8./9.),285*(13./16.),200*(8./9.),"usa","USA.svg");
  canada= new Country (30*(13./16.),30*(8./9.),460*(13./16.),300*(8./9.),"canada","canada.svg");
  fareast= new Country (1090*(13./16.),300*(8./9.),310*(13./16.),170*(8./9.),"fareast","fareast.svg");
  europe = new Country (740*(13./16.),120*(8./9.),215*(13./16.),275*(8./9.),"europe","europe.svg");
  greenland = new Country (500*(13./16.),40*(8./9.),160*(13./16.),200*(8./9.),"greenland", "greenland.svg");
  africa = new Country (700*(13./16.),390*(8./9.),300*(13./16.),350*(8./9.), "africa","africa.svg");
  middleeast= new Country (900*(13./16.),280*(8./9.),350*(13./16.),250*(8./9.),"middleeast","middleeast.svg");
  russia = new Country (910*(13./16.),50*(8./9.),675*(13./16.),290*(8./9.),"russia","russia.svg");
  southamerica = new Country (380*(13./16.),470*(8./9.),200*(13./16.),330*(8./9.),"southamerica","southamerica.svg");
  Countries.add(australia);
  Countries.add(usa);
  Countries.add(canada);
  Countries.add(fareast);
  Countries.add(europe);
  Countries.add(greenland);
  Countries.add(africa);
  Countries.add(middleeast);
  Countries.add(russia);
  Countries.add(southamerica);
  countryIndex = 0;
  window= GWindow.getWindow(this,"My Window",100,100,1001,1001,JAVA2D);
}

void draw() {
  background(color(101, 182, 222));
  australia.display();
  usa.display();
  canada.display();
  fareast.display();
  europe.display();
  greenland.display();
  africa.display();
  middleeast.display();
  russia.display();
  southamerica.display();
  delay(500);
  if(countryIndex == 10) {
    countryIndex = 0;
  }
  Countries.get(countryIndex).behavior();
  countryIndex++;
  window.addDrawHandler(this, "windowDraw");
}
public void windowDraw(PApplet app, GWinData data){
    app.background(255);
    app.strokeWeight(2);
    // draw black line to current mouse position
    app.stroke(0);
    app.line(app.width / 2, app.height/2, app.mouseX, app.mouseY);
  }

void mousePressed(){
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
}