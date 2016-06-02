public class Country{
  String[] neighbors;
  int[][] spread;
  int population;
  float xpos,ypos,xsize,ysize;
  String name;
  PShape shape;
  Disease disease;
  boolean infected=false;
  int rcolor,gcolor,bcolor;
 
  Country(float X,float Y, String Name, int numNeighbors, float sizex, float sizey){
    xpos= X;
    ypos= Y;
    xsize = sizex;
    ysize= sizey;
    name= Name;
    neighbors = new String[numNeighbors];
    spread = new int[10][10];
    if(infected) {
      spread[spread.length / 2][spread[1].length / 2] = 1;
    }
  }
 
  Country(float X,float Y,float sizex, float sizey, String Name,String shapeloc){
    xpos= X;
    ypos= Y;
    xsize = sizex;
    ysize= sizey;
    name= Name;
    setShape(shapeloc);
    spread = new int[10][10];
    infected = true;
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
 
  void greenred(float percent){
    setRGB((255*percent), (255*(1.00-percent)),0);
  }
   
  void display (){ 
  shape(shape, xpos,ypos, xsize, ysize);
  fill(color(rcolor,gcolor,bcolor));
  }
  void grow() {
  if(infected) {
    int rand = int(random(5));
    if(rand == 1) {
      spreadDisease(1);
    }
    else if(rand == 2) {
      contaminate(1);
    }
    /*
    else if(rand == 3) {
      decontaminate(1);
    }
    else if(rand == 4) {
      despreadDisease(1);
    }
    */
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
          spread[i][a] = amount * -1;
        }
      }
    }
  }
  }
  void contaminate(int amount) {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0) {
        spread[i][a] = spread[i][a] + amount;
      }
    }
  }
  }
  void decontaminate(int amount) {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0) {
        spread[i][a] = spread[i][a] - amount;
      }
    }
  }
  }
  boolean surroundNeighbors(int i, int a) {
  boolean ret = true;
  if(i > 0) {
    if(spread[i - 1][a] > 0) {
      return ret;
    }
  }
  if(i < spread.length - 1) {
    if(spread[i + 1][a] > 0) {
      return ret;
    }
  }
  if(a > 0) {
    if(spread[i][a - 1] > 0) {
      return ret;
    }
  }
  if(a < spread[0].length - 1) {
    if(spread[i][a + 1] > 0) {
      return ret;
    }
  }
  return false;
  }
  void behavior() {
    grow();
    greenred(getPercentage());
    print(getPercentage());
    display();
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
    return ret / 100.0 ;
  }
  int getInfected() {
    return int(getPercentage() * population);
  }
}