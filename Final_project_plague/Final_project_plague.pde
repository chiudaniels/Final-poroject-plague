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
int selectedCountry=0;
int selection=1;
int lethality;
int transmissionOut;
int transmissionIn;
boolean started = false;

void setup() {
  Countries = new ArrayList<Country>();
  size(1300, 800);
  background(color(101,182,222));
  australia = new Country(1250*(13./16.),575*(8./9.),175*(13./16.),175*(8./9.),"australia","australia.svg", false);
  usa = new Country (170*(13./16.),280*(8./9.),285*(13./16.),200*(8./9.),"usa","USA.svg", false);
  canada= new Country (0*(13./16.),25*(8./9.),500*(13./16.),300*(8./9.),"canada","canada.svg", false);
  fareast= new Country (1090*(13./16.),300*(8./9.),310*(13./16.),170*(8./9.),"fareast","fareast.svg", false);
  europe = new Country (740*(13./16.),120*(8./9.),215*(13./16.),275*(8./9.),"europe","europe.svg", false);
  greenland = new Country (500*(13./16.),40*(8./9.),160*(13./16.),200*(8./9.),"greenland", "greenland.svg", false);
  africa = new Country (700*(13./16.),390*(8./9.),300*(13./16.),350*(8./9.), "africa","africa.svg", false);
  middleeast= new Country (900*(13./16.),280*(8./9.),350*(13./16.),250*(8./9.),"middleeast","middleeast.svg", false);
  russia = new Country (910*(13./16.),50*(8./9.),675*(13./16.),290*(8./9.),"russia","russia.svg", false);
  southamerica = new Country (380*(13./16.),470*(8./9.),200*(13./16.),330*(8./9.),"southamerica","southamerica.svg", false);
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
  String[] australiaNeighbors = {"usa", "fareast", "southamerica"};
  String[] usaNeighbors = {"canada", "southamerica", "australia", "europe"};   
  String[] canadaNeighbors = {"usa", "greenland"};
  String[] fareastNeighbors = {"russia", "middleeast", "australia"};
  String[] europeNeighbors = {"usa", "middleeast", "russia", "africa"};
  String[] greenlandNeighbors = {"canada", "usa"};
  String[] africaNeighbors = {"europe", "middleeast", "southamerica"};
  String[] middleeastNeighbors = {"fareast", "russia", "europe", "africa"};
  String[] russiaNeighbors = {"europe", "fareast", "middleeast"};
  String[] southamericaNeighbors = {"usa", "africa", "australia"};
  australia.neighbors = australiaNeighbors;
  usa.neighbors = usaNeighbors;
  canada.neighbors = canadaNeighbors;
  fareast.neighbors = fareastNeighbors;
  europe.neighbors = europeNeighbors;
  greenland.neighbors = greenlandNeighbors;
  africa.neighbors = africaNeighbors;
  middleeast.neighbors = middleeastNeighbors;
  russia.neighbors = russiaNeighbors;
  southamerica.neighbors = southamericaNeighbors;
  window= GWindow.getWindow(this,"My Window",100,100,600,500,JAVA2D);
}

void draw() {
  if(!started) {
    //mouseclick on country, set infected = true;
  }
  if(selection==1){
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
    australia.display();
    ellipse(1095,580,25,25);
    ellipse(235,300,25,25);
    ellipse(210,175,25,25);
    ellipse(990,335,25,25);
    ellipse(700,280,25,25);
    ellipse(855,355,25,25);
    ellipse(970,200,25,25);
    ellipse(390,520,25,25);    
    ellipse(475,115,25,25);
    ellipse(700,465,25,25);
    delay(1000);
  }
  if (selection == 2){
    background(color(101, 182, 222));
    upgradescreen();
  }
  if(countryIndex == 10) {
  countryIndex = 0;
  }
  //selectCountry();
  Countries.get(countryIndex).behavior();
  //println(Countries.get(countryIndex).getPercentage());
  infectOthers(Countries.get(countryIndex));
  countryIndex++;
  window.addDrawHandler(this, "windowDraw");
  rect(1150,730,100,40);
}

void upgradescreen(){
    textSize(28);
    text("Transmission in country", 50,50); 
    rect(50,70,170,50);
    rect(250,70,170,50);
    rect(450,70,170,50);
    rect(650,70,170,50);
    text("Transmission in Animals", 50,200); 
    rect(50,70+150,170,50);
    rect(250,70+150,170,50);
    rect(450,70+150,170,50);
    rect(650,70+150,170,50);
    text("Letality", 50,350); 
    rect(50,370,170,50);
    rect(250,370,170,50);
    rect(450,370,170,50);
    rect(650,370,170,50);
}

void upgradescreenclick(){
  if (transmissionIn == 1 && mouseX <= 250 && mouseX >=50+170 && mouseY>=70 && mouseY<=50+70){
    transmissionIn++;
  }
  if (transmissionIn == 2 && mouseX <= 450 && mouseX >=450+170 && mouseY>=70 && mouseY<=50+70){
    transmissionIn++;
  }
  if (transmissionIn == 3 && mouseX <= 650 && mouseX >=650+170 && mouseY>=70 && mouseY<=50+70){
    transmissionIn++;
  }
  if (transmissionOut == 1 && mouseX <= 250 && mouseX >=50+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut++;
  }
  if (transmissionOut == 2 && mouseX <= 450 && mouseX >=450+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut++;
  }
  if (transmissionOut == 3 && mouseX <= 650 && mouseX >=650+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut++;
  }
  if (lethality == 1 && mouseX <= 250 && mouseX >=50+170 && mouseY>=370 && mouseY<=370+50){
    transmissionOut++;
  }
  if (lethality == 2 && mouseX <= 450 && mouseX >=450+170 && mouseY>=370 && mouseY<=370+50){
    transmissionOut++;
  }
  if (lethality == 3 && mouseX <= 650 && mouseX >=650+170 && mouseY>=370 && mouseY<=370+50){
    transmissionIn++;
  }
}

void infectOthers(Country country) { 
  int totalSide1 = 0;
  int totalSide2 = 0;
  int totalSide3 = 0;
  int totalSide4= 0;
  for(int i = 0; i < country.spread.length; i++) {
    totalSide1 += country.spread[0][i];
    totalSide2 += country.spread[i][country.spread[0].length - 1];
    totalSide3 += country.spread[country.spread.length - 1][i];
    totalSide4 += country.spread[i][0];   
  }
  if(totalSide1 > 40 || totalSide2 > 40 || totalSide3 > 40 || totalSide4 > 40){
    int i = 0;
    boolean temp = true;
    while(i < country.neighbors.length && temp) {
      int a = 0;
      while(a < Countries.size() && temp) {
        if(!(Countries.get(a).infected) && country.neighbors[i].equals(Countries.get(a).name)) {
          temp = false;
        }
        a++;
      }
      i++;
    }
  }
}

public void windowDraw(PApplet app, GWinData data){
  app.background(0);
  app.fill(255);
      app.textSize(32);
      app.text("Area:",50,100);
      app.text("Infected:",50,150);
      app.text("Population:",50,200);
      app.text("Fatality:",50,250);
      switch(selectedCountry){
      case 1: 
        app.text(australia.getName(),150,100);
        app.text(australia.getInfected(),200,150);
        app.text(australia.getPopulation(),250,200);
        break;
      case 2: 
        app.text(usa.getName(),150,100);
        app.text(usa.getInfected(),200,150);
        app.text(usa.getPopulation(),250,200);
        break;
      case 3:
        app.text(canada.getName(),150,100);
        app.text(canada.getInfected(),200,150);
        app.text(canada.getPopulation(),250,200);
        break;
      case 4:
       app.text(fareast.getName(),150,100);
        app.text(fareast.getInfected(),200,150);
        app.text(fareast.getPopulation(),250,200);
        break;
      case 5:
       app.text(europe.getName(),150,100);
        app.text(europe.getInfected(),200,150);
        app.text(europe.getPopulation(),250,200);
        break;
      case 6:
        app.text(greenland.getName(),150,100);
        app.text(greenland.getInfected(),200,150);
        app.text(greenland.getPopulation(),250,200);
        break;
      case 7:
        app.text(africa.getName(),150,100);
        app.text(africa.getInfected(),200,150);
        app.text(africa.getPopulation(),250,200);
        break;
      case 8:
       app.text(middleeast.getName(),150,100);
        app.text(middleeast.getInfected(),200,150);
        app.text(middleeast.getPopulation(),250,200);
        break;
      case 9:
        app.text(russia.getName(),150,100);
        app.text(russia.getInfected(),200,150);
        app.text(russia.getPopulation(),250,200);
        break;
      case 10:
        app.text(southamerica.getName(),150,100);
        app.text(southamerica.getInfected(),200,150);
        app.text(southamerica.getPopulation(),250,200);
        break;
  }
}

void mousePressed(){
  if (selection == 1){
    if((mouseX>=1095-25 && mouseX<=1095+25) && (mouseY>=580-25 && mouseY<=580+25)){
      selectedCountry=1;
      //australia
    }
    else if((mouseX>=235-25 && mouseX<=235+25) && (mouseY>=300-25 && mouseY<=300+25)){
      selectedCountry=2;
      //usa
    }
    else if((mouseX>=200-25 && mouseX<=200+25) && (mouseY>=175-25 && mouseY<=175+25)){
      selectedCountry=3;
      //canada
    }
    else if((mouseX>=990-25 && mouseX<=990+25) && (mouseY>=335-25 && mouseY<=335+25)){
      selectedCountry=4;
      //fareast
    }
    else if((mouseX>=700-25 && mouseX<=700+25) && (mouseY>=280-25 && mouseY<=280+25)){
      selectedCountry=5;
      //europe
    }
    else if((mouseX>=475-25 && mouseX<=475+25) && (mouseY>=115-25 && mouseY<=115+25)){
      selectedCountry=6;
      //greenland
    }
    else if((mouseX>=700-25 && mouseX<= 700+25) && (mouseY>=465-25 && mouseY<=465+25)){
      selectedCountry=7;
      //africa
    }
    else if((mouseX>=850-25 && mouseX<=850+25 ) && (mouseY>=355-25 && mouseY<=355+25)){
      selectedCountry=8;
      //middleeast
    }
    else if((mouseX>=970-25 && mouseX<=970+25) && (mouseY>=200-25 && mouseY<=200+25)){
      selectedCountry=9;
      //russia
    }
    else if((mouseX>=390-25 && mouseX<=390+25) && (mouseY>=520-25 && mouseY<=520+25)){
      selectedCountry=10;
      //southamerica
    } 
    else if((mouseX>=1150 && mouseX<=1150+100) && (mouseY>=730 && mouseY<=730+50)){
      selection=2;
    }
  }
  else if (selection==2){
    upgradescreenclick();
    if((mouseX>=1150 && mouseX<=1150+100) && (mouseY>=730 && mouseY<=730+50)){
      selection=1;
    }
  }
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
  println("selectedCountry:" + selectedCountry);
}