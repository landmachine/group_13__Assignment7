//test
Gameboard gameboard1;


void setup(){
  size(800, 800);
  
  gameboard1 = new Gameboard();
}


void draw() {
  background(200);
  
  gameboard1.test();
  gameboard1.display();
  noLoop();
}
