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
  
  void display_pause_menu(){
    fill(200);
    rectMode(CENTER);
    stroke(1);
    rect(width/2, height/2, 200, 150);
    noStroke();
    rectMode(CORNER);
    
    textFont(scoreFont); // Uses the scoreFont!!!
    textAlign(CENTER);
    textSize(15);
    fill(0);
    text("GAME PAUSED", width/2, height/2-50);
    text("Press 'P' to Unpause", width/2, height/2-10);
    text("Press 'ESC' to RageQuit", width/2, height/2+20);
  }
  
  void display_gameOver(){
    fill(150);
    rectMode(CENTER);
    stroke(2);
    rect(width/2, height/2, width-100, height-100);
    noStroke();
    rectMode(CORNER);
    
    textFont(scoreFont); // Uses the scoreFont!!!
    textAlign(CENTER);
    textSize(15);
    fill(0);
    if (g_win){
      text("YOU HAVE WON!", width/2, height/2-50);
    }else{
      text("GAME IS OVER!", width/2, height/2-50);
    }
    text("Score: " + score, width/2, height/2-10);
    text("Press 'ESC' to RageQuit", width/2, height/2+20);
  
  }
}
