public class Country{
  String[] neighbors;
  int[][] spread;
  int population;
  float x,y;
  String name;
  PShape shape; 
  Disease disease;
  boolean infected;
    
  Country(float X,float Y, String Name, PShape z, int numNeighbors,int Width, int Length, boolean Infected){
      x= X;
      y= Y;
      name= Name;
      shape = z; 
      neighbors = new String[numNeighbors];
      spread = new int[Length][Width];
      infected = Infected;
      if(infected) {
        spread[spread.length / 2][spread[1].length / 2] = 1;
      }
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
        increaseNum();
      }
      else if(rand == 3) {
        decreaseNum();
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
        }
      }
    }
  }
  void despreadDisease() {
  }
  void increaseNum() {
    for(int i = 0; i< spread.length; i++) {
      for(int a = 0; a< spread[0].length; a++) {
        if(spread[i][a] > 0) {
          spread[i][a] = spread[i][a] + 1;
        }
      }
    }
  }
  void decreaseNum() {
    for(int i = 0; i< spread.length; i++) {
      for(int a = 0; a< spread[0].length; a++) {
        if(spread[i][a] > 0) {
          spread[i][a] = spread[i][a] - 1;
        }
      }
    }
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