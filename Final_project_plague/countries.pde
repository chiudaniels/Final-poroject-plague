public class country{
  float x,y;
  String name;
  PShape shape; 
  
  country(float x,float y, String name, PShape z){
      x=this.x;
      y=this.y;
      name=this.name;
      shape = z; 
  }
  void display (){
    fill(0,0,0);// Make green rgb 
    shape (shape,0,0); // this will be position of country  
  }
  
}