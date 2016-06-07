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
int lethality=1;
int transmissionOut=1;
int transmissionIn=1;
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
  if(selection==1){
    background(color(101, 182, 222));
    strokeWeight(1);
    stroke(0,0,0);
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
    fill(color(255,0,0));
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
    //countryborder();
    delay(1000);
    textSize(18);
    fill(color(128,128,128));
    rect(1150,730,100,40);
    fill(color(255,255,255));
    text("Upgrades",1160,760);
  }
  if (selection == 2){
    background(color(101, 182, 222));
    upgradescreen();
    textSize(32);
    fill(color(128,128,128));
    rect(1150,730,100,40);
    fill(color(255,255,255));
    text("Map",1160,760);
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
}

void upgradescreen(){
    textSize(28);
    fill(color(255,255,255));
    text("Transmission in country", 50,50); 
    text("Transmission in Animals", 50,200); 
    text("Letality", 50,350);
    text("Level:"+transmissionIn,800,50);
    text("Level:"+transmissionOut,800,200);
    text("Level:"+lethality,800,350);
    fill (color (0,128,255));
    rect(50,70,170,50);
    if (transmissionIn == 1){
      fill(color(102,255,102));
    }
    else if(transmissionIn > 1){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(250,70,170,50);
    if (transmissionIn == 2){
      fill(color(102,255,102));
    }
    else if(transmissionIn > 2){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(450,70,170,50);
    if (transmissionIn == 3){
      fill(color(102,255,102));
    }
    else if(transmissionIn > 3){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(650,70,170,50);
    
    fill (color (0,128,255));
    rect(50,70+150,170,50);
    if (transmissionOut == 1){
      fill(color(102,255,102));
    }
    else if(transmissionOut > 1){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(250,70+150,170,50);
   if (transmissionOut == 2){
      fill(color(102,255,102));
    }
    else if(transmissionOut > 2){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(450,70+150,170,50);
     if (transmissionOut == 3){
      fill(color(102,255,102));
    }
    else if(transmissionOut > 3){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(650,70+150,170,50);
    
    fill (color (0,128,255));
    rect(50,370,170,50);
    if (lethality == 1){
      fill(color(102,255,102));
    }
    else if(lethality > 1){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(250,370,170,50);
    if (lethality == 2){
      fill(color(102,255,102));
    }
    else if(lethality > 2){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(450,370,170,50);
    if (lethality == 3){
      fill(color(102,255,102));
    }
    else if(lethality > 3){
      fill (color(0,128,255));
    }
    else {
      fill (color (128,128,128));
    }
    rect(650,370,170,50);
}

void upgradescreenclick(){
  if (transmissionIn == 1 && (mouseX >= 250 && mouseX <=250+170) && mouseY>=70 && mouseY<=50+70){
    transmissionIn = 2;
  }
  else if (transmissionIn == 2 && mouseX >= 450 && mouseX <=450+170 && mouseY>=70 && mouseY<=50+70){
    transmissionIn=3;
  }
  else if (transmissionIn == 3 && mouseX >= 650 && mouseX <=650+170 && mouseY>=70 && mouseY<=50+70){
    transmissionIn=4;
  }
  else if (transmissionOut == 1 && mouseX >= 250 && mouseX <=250+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut=2;
  }
  else if (transmissionOut == 2 && mouseX >= 450 && mouseX <=450+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut=3;
  }
  else if (transmissionOut == 3 && mouseX >= 650 && mouseX <=650+170 && mouseY>=220 && mouseY<=220+50){
    transmissionOut=4;
  }
  else if (lethality == 1 && mouseX >= 250 && mouseX <=250+170 && mouseY>=370 && mouseY<=370+50){
    lethality=2;
  }
  else if (lethality == 2 && mouseX >= 450 && mouseX <=450+170 && mouseY>=370 && mouseY<=370+50){
    lethality=3;
  }
  else if (lethality == 3 && mouseX >= 650 && mouseX <=650+170 && mouseY>=370 && mouseY<=370+50){
    lethality=4;
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
          Countries.get(a).infected = true;
        }
        a++;
      }
      i++;
    }
      
  }
}

void countryborder(){
 switch(selectedCountry){
      case 1: 
        australia.setstroke(3,255,255,0);
        break;
      case 2: 
        usa.setstroke(3,255,255,0);
        break;
      case 3:
        canada.setstroke(3,255,255,0);
        break;
      case 4:
        fareast.setstroke(3,255,255,0);
        break;
      case 5:
        europe.setstroke(3,255,255,0);
        break;
      case 6:
        greenland.setstroke(3,255,255,0);
        break;
      case 7:
        africa.setstroke(3,255,255,0);
        break;
      case 8:
        middleeast.setstroke(3,255,255,0);
        break;
      case 9:
        russia.setstroke(3,255,255,0);
        break;
      case 10:
        southamerica.setstroke(3,255,255,0);
        break;
  }
}

public void windowDraw(PApplet app, GWinData data){
  app.background(0);
  app.fill(255);
      app.textSize(32);
      app.text("Area:",50,100);
      app.text("Infected:",50,150);
      app.text("Population:",50,200);
      //app.text("Fatality:",50,250);
      switch(selectedCountry){
      case 1: 
        app.text(australia.getName(),150,100);
        app.text(australia.getInfected(),200,150);
        app.text(australia.getPercentage(),250,200);
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
      if(!started){
        started=true;
        australia.setInfected(true);
      }
      //australia
    }
    else if((mouseX>=235-25 && mouseX<=235+25) && (mouseY>=300-25 && mouseY<=300+25)){
      selectedCountry=2;
       if(!started){
        started=true;
        usa.setInfected(true);
      }
      //usa
    }
    else if((mouseX>=200-25 && mouseX<=200+25) && (mouseY>=175-25 && mouseY<=175+25)){
      selectedCountry=3;
       if(!started){
        started=true;
        canada.setInfected(true);
      }
      //canada
    }
    else if((mouseX>=990-25 && mouseX<=990+25) && (mouseY>=335-25 && mouseY<=335+25)){
      selectedCountry=4;
       if(!started){
        started=true;
        fareast.setInfected(true);
      }
      //fareast
    }
    else if((mouseX>=700-25 && mouseX<=700+25) && (mouseY>=280-25 && mouseY<=280+25)){
      selectedCountry=5;
       if(!started){
        started=true;
        europe.setInfected(true);
      }
      //europe
    }
    else if((mouseX>=475-25 && mouseX<=475+25) && (mouseY>=115-25 && mouseY<=115+25)){
      selectedCountry=6;
       if(!started){
        started=true;
        greenland.setInfected(true);
      }
      //greenland
    }
    else if((mouseX>=700-25 && mouseX<= 700+25) && (mouseY>=465-25 && mouseY<=465+25)){
      selectedCountry=7;
       if(!started){
        started=true;
        africa.setInfected(true);
      }
      //africa
    }
    else if((mouseX>=850-25 && mouseX<=850+25 ) && (mouseY>=355-25 && mouseY<=355+25)){
      selectedCountry=8;
       if(!started){
        started=true;
        middleeast.setInfected(true);
      }
      //middleeast
    }
    else if((mouseX>=970-25 && mouseX<=970+25) && (mouseY>=200-25 && mouseY<=200+25)){
      selectedCountry=9;
         if(!started){
        started=true;
        russia.setInfected(true);
      }
      //russia
    }
    else if((mouseX>=390-25 && mouseX<=390+25) && (mouseY>=520-25 && mouseY<=520+25)){
      selectedCountry=10;
         if(!started){
        started=true;
        southamerica.setInfected(true);
      }
      //southamerica
    } 
    else if((mouseX>=1150 && mouseX<=1150+100) && (mouseY>=730 && mouseY<=730+50)){
      selection=2;
    }
  }
  else{
    upgradescreenclick();
    if((mouseX>=1150 && mouseX<=1150+100) && (mouseY>=730 && mouseY<=730+50)){
      selection=1;
    }
  }
  println("mouse pos X:" + mouseX);
  println("mouse pos Y:" + mouseY);
  println("selectedCountry:" + selectedCountry);
  println("transmissionIn:" + transmissionIn);
  println((transmissionIn == 1 && (mouseX <= 250 && mouseX >=250+170) && mouseY>=70 && mouseY<=50+70));
}