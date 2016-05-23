public class Country{
  int population;
  float x,y;
  String name;
  PShape shape; 
  Disease disease;
  
  Country(float x,float y, String name, PShape z){
      x=this.x;
      y=this.y;
      name=this.name;
      shape = z; 
  }
  void display (){
    fill(0,0,0);// Make green rgb 
    shape (shape,0,0); // this will be position of country  
  }
  void grow() {
    int rand = int(random(4));
    if(rand == 0) {
      if(disease.infected * 1.5 > population) {
        //spread to neighbors by probability;
      }
      else {
        disease.infected *= 1.5;
      }
    }
   else if(rand == 1) {
       if(disease.infected * 1.25 > population) {
         //spread to neighbors by probablility;
       }
       else {
         disease.infected *= 1.25;
       }
   }
   else if(rand == 3) {
       if(disease.infected < 10) {
         disease.infected = 0;
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