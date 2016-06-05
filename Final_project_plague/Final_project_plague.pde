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

void setup() {
    Countries = new ArrayList<Country>();
    size(1300, 800);
    background(color(101,182,222));
    australia = new Country(1250*(13./16.),575*(8./9.),175*(13./16.),175*(8./9.),"australia","australia.svg");
    usa = new Country (170*(13./16.),280*(8./9.),285*(13./16.),200*(8./9.),"usa","USA.svg");
    canada= new Country (0*(13./16.),25*(8./9.),500*(13./16.),300*(8./9.),"canada","canada.svg");
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
    window= GWindow.getWindow(this,"My Window",100,100,500,500,JAVA2D);
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
    delay(500);
    if(countryIndex == 10) {
	countryIndex = 0;
    }
    //selectCountry();
    Countries.get(countryIndex).behavior();
    countryIndex++;
    window.addDrawHandler(this, "windowDraw");
  
}
public void windowDraw(PApplet app, GWinData data){
    app.background(0);
    app.fill(255);
    app.textSize(32);
    app.text("Area:",50,100);
    app.text("Infected:",50,150);
    app.text("Population:",50,200);
    if (selectedCountry==1){
    }
    if (selectedCountry==2){
    }
    if (selectedCountry==3){
    }
    if (selectedCountry==4){
    }
    if (selectedCountry==5){
    }
    if (selectedCountry==6){
    }
    if (selectedCountry==7){
    }
    if (selectedCountry==8){
    }
    if (selectedCountry==9){
    }
    if (selectedCountry==10){
    }
}

void mousePressed(){
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
    println("mouse pos X:" + mouseX);
    println("mouse pos Y:" + mouseY);
    println("selectedCountry:" + selectedCountry);
}
