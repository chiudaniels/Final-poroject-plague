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
 
  Country(float X,float Y, String Name, int numNeighbors,int Width, int Length, float sizex, float sizey){
    xpos= X;
    ypos= Y;
    xsize = sizex;
    ysize= sizey;
    name= Name;
    neighbors = new String[numNeighbors];
    spread = new int[Length][Width];
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
  }
 
 
  void setInfected(boolean x){
  infected=x;
  }
 
  void setShape(String location){
   shape = loadShape(location);
   shape.disableStyle();
  }
 
  void drawer(){
  shape(shape, xpos,ypos, xsize, ysize);
  fill(color(rcolor,gcolor,bcolor));
  }
 
  void setRGB(int r,int g,int b){
  rcolor=r;
  gcolor=g;
  bcolor=b;
  }
 
  void display (){
  fill(0,0,0);// Make green rgb
  shape (shape,0,0); // this will be position of country  
  }
  void grow() {
  if(infected) {
    int rand = int(random(5));
    if(rand == 1) {
      spreadDisease();
    }
    else if(rand == 2) {
      contaminate();
    }
    else if(rand == 3) {
      decontaminate();
    }
    else if(rand == 4) {
      despreadDisease();
    }
  }
  }
  void spreadDisease() {
  for(int i = 0; i < spread.length; i++) {
    for(int a = 0; a < spread[0].length; a++) {
      if(spread[i][a] == 0) {
        if(surroundNeighbors(i, a)) {
          spread[i][a] = 1;
        }
      }
    }
  }
  }
  void despreadDisease() {
  for(int i = 0; i < spread.length; i++) {
    for(int a = 0; a < spread[0].length; a++) {
      if(spread[i][a] == 0) {
        if(surroundNeighbors(i, a)) {
          spread[i][a] = -1;
        }
      }
    }
  }
  }
  void contaminate() {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0) {
        spread[i][a] = spread[i][a] + 1;
      }
    }
  }
  }
  void decontaminate() {
  for(int i = 0; i< spread.length; i++) {
    for(int a = 0; a< spread[0].length; a++) {
      if(spread[i][a] != 0) {
        spread[i][a] = spread[i][a] - 1;
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
  if(disease.infected >= population) {
    population = 0;
    disease.infected = 0;
    disease = null;
  }
  }
}