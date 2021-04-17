Gameboard gameboard1;
Scoreboard myScoreboard;
PFont titleFont;

void setup() {
  size(800, 800);
  titleFont = createFont("SansSerif", 32);
  myScoreboard = new Scoreboard(titleFont);
  gameboard1 = new Gameboard();
}

void draw() {
  background(color(107,191,247));
  textFont(titleFont);
  textAlign(CENTER);
  text("Snake", width/2, 40);
  myScoreboard.display();
  
  gameboard1.display();
  
  noLoop();
}

void mousePressed() {
  myScoreboard.increment();
}
