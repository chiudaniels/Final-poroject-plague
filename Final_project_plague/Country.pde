public class Country{
  String[] neighbors;
  float[][] spread;
  float population;
  float xpos,ypos,xsize,ysize;
  String name;
  PShape shape;
  int lethality;
  int transmissionOut;
  int transmissionIn;
  boolean infected=false;
  int rcolor,gcolor,bcolor;
  int immunity; 
  int strokeweight =1;
 
  Country(float X,float Y, String Name, int numNeighbors, float sizex, float sizey){
    xpos= X;
    ypos= Y;
    xsize = sizex;
    ysize= sizey;
    name= Name;
    neighbors = new String[numNeighbors];
    spread = new float[10][10];
    lethality = 1;
    transmissionIn = 1;
    transmissionOut = 1;
    immunity = 1;
    if(infected) {
      spread[(spread.length / 2) - 1][(spread[1].length / 2 ) - 1] = 1;
    }
  }
 
  Country(float X,float Y,float sizex, float sizey, String Name,String shapeloc, boolean isInfected, float Pop){
    xpos= X;
    ypos= Y;
    xsize = sizex;
    ysize= sizey;
    name= Name;
    setShape(shapeloc);
    spread = new float[10][10];
    infected = true;
    lethality = 1;
    transmissionIn = 1;
    transmissionOut = 1;
    immunity = 1;
    infected = isInfected;
    if(infected) {
      spread[(spread.length / 2) - 1][(spread[1].length / 2 ) - 1] = 1;
    }
    population = Pop;
  }
  void setInfected(boolean x){
  infected=x;
  }
 
  void setShape(String location){
   shape = loadShape(location);
   shape.disableStyle();
  }

  void setRGB(float r,float g,float b){
    rcolor = int(r);
    gcolor = int(g);
    bcolor = int(b);
  }
  
  void setstroke(int n,int r, int g, int b){
    strokeweight=n;
    stroke(color(r,g,b));
  }
  
  void greenred(float percent){
    setRGB((255*percent), (255*(1.00-percent)),0);
  }
   
  void display (){ 
  shape(shape, xpos,ypos, xsize, ysize);
  greenred(getPercentage());
  fill(color(rcolor,gcolor,bcolor));
  strokeWeight(strokeweight);
  }
  
  void grow() {
  if(infected) {
    if(spread[(spread.length / 2) - 1][(spread[0].length / 2) - 1] == 0) {
      spread[spread.length / 2][spread[0].length / 2] = 1;
    }
    int rand = int(random(10));
    if(rand == 1 || rand == 6) {
      spreadDisease(transmissionOut);
    }
    else if(rand == 2 || rand == 7 || rand == 9) {
      contaminate(transmissionIn);
    }
    else if(rand == 3) {
      decontaminate(immunity);
    }
    else if(rand == 4) {
      despreadDisease(immunity);
    }
    else if(rand == 5) {
      //kill(lethality);
    }
    
  }
  }
  void spreadDisease (int amount) {
  for(int i = 0; i < spread.length; i++) {
    for(int a = 0; a < spread[0].length; a++) {
      if(spread[i][a] == 0) {
        if(surroundNeighbors(i, a)) {
          spread[i][a] = amount;
        }
      }
    }
  }
  }
  void despreadDisease(int amount) {
  for(int i = 0; i < spread.length; i++) {
    for(int a = 0; a < spread[0].length; a++) {
      if(spread[i][a] == 0) {
        if(surroundNeighbors(i, a)) {
          spread[i][a] = (amount * -1);
        }
      }
    }
  }
  }
  void contaminate(int amount) {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0 && spread[i][a] < 10) {
        spread[i][a] = spread[i][a] + amount;
      }
    }
  }
  }
  void decontaminate(int amount) {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0 && spread[i][a] > -10) {
        spread[i][a] = spread[i][a] - amount;
      }
    }
  }
  }
  /*
  void kill(int Lethality) {
    float percentage = Lethality * 1.0 / 10;
    population -= getInfected() * percentage;
  }
  */
  boolean surroundNeighbors(int i, int a) {
  boolean ret = true;
  if(i > 0) {
    if(spread[i - 1][a] == 0) {
      return ret;
    }
  }
  if(i < spread.length - 1) {
    if(spread[i + 1][a] == 0) {
      return ret;
    }
  }
  if(a > 0) {
    if(spread[i][a - 1] == 0) {
      return ret;
    }
  }
  if(a < spread[0].length - 1) {
    if(spread[i][a + 1] == 0) {
      return ret;
    }
  }
  return false;
  }
  void behavior() {
    grow();
    greenred(getPercentage());
    //print(getPercentage());
    //display();
    /*
    if(disease.infected >= population) {
      population = 0;
      disease.infected = 0;
      disease = null;
    }
    */
  }
  float getPercentage() {
    float ret = 0;
    for(int i = 0; i < spread.length; i++) {
      for(int a = 0; a < spread[0].length; a++) {
        ret += spread[i][a];
      }
    }
    return ret / 1000.0;
  }
  float getInfected() {
    return int(getPercentage() * population);
  }
  float getPopulation(){
    return population;
  }
  String getName(){
    return name;
  }
}