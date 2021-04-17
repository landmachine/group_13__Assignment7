class Scoreboard {
  int score;
  PFont font;

  Scoreboard(PFont f) {
    score = 0;
    font = f;
  }

  void increment() {
    score += 1;
  }

  void display() {
    textFont(font);
    textAlign(LEFT);
    textSize(20);
    fill(0);
    text("Score: " + score, 10, 30);
  }
}
