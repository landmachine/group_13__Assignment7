class Scoreboard {
  int score;
  PFont scoreFont;
  PFont titleFont;

  Scoreboard() {
    score = 0;
    scoreFont = createFont("SansSerif", 32);
    titleFont = createFont("SansSerif", 32);
  }

  void increment() {
    score += 1;
  }

  void display_score() {
    textFont(scoreFont);
    textAlign(LEFT);
    textSize(20);
    fill(0);
    text("Score: " + score, 15, 30);
  }

  void display_title() {
    textFont(titleFont);
    textAlign(CENTER);
    textSize(35);
    fill(0);
    text("Snake", width/2, 40);
  }
}
