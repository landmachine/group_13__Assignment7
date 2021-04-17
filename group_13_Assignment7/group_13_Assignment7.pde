Scoreboard myScoreboard;
PFont titleFont;

void setup() {
  size(800, 800);
  titleFont = createFont("SansSerif", 32);
  myScoreboard = new Scoreboard(titleFont);
}

void draw() {
  background(color(107,191,247));
  textFont(titleFont);
  textAlign(CENTER);
  text("Snake", width/2, 40);
  myScoreboard.display();
}

void mousePressed() {
  myScoreboard.increment();
}
