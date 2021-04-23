class Scoreboard {
  int score;
  PFont myfont;
  Button pauseButton, quitButton, menuButton, startButton;

  Scoreboard() {
    score = 0;
    myfont = createFont("SansSerif", 32);
    pauseButton = new Button(width/2, height/2 - 10, 120, 40, "Unpause (P)");
    quitButton = new Button(width/2, height/2 + 40, 120, 40, "Quit (ESC)");
    menuButton = new Button(width - 40, 25, 60, 25, "Menu");
    startButton = new Button(width/2, height/2 - 10, 120, 40, "Start the game!");
  }

  void display_banner() {
    display_score();
    display_title();
    display_menu();
  }

  void display_welcome() {
    fill(200);
    rectMode(CENTER);
    stroke(1);
    rect(width/2, height/2, 200, 150);
    noStroke();
    rectMode(CORNER);

    textFont(myfont);
    textAlign(CENTER);
    textSize(15);
    fill(0);
    text("Welcome to the Snake!", width/2, height/2-50);
    startButton.display();
    quitButton.display();
  }

  void increment() {
    score += 1;
  }

  void display_score() {
    textFont(myfont);
    textAlign(LEFT);
    textSize(20);
    fill(0);
    text("Score: " + score, 15, 30);
  }

  void display_title() {
    textFont(myfont);
    textAlign(CENTER);
    textSize(35);
    fill(0);
    text("Snake", width/2, 40);
  }

  void display_menu() {
    textSize(20);
    menuButton.display();
  }

  void display_pause_menu() {    
    fill(200);
    rectMode(CENTER);
    stroke(1);
    rect(width/2, height/2, 200, 180);
    noStroke();
    rectMode(CORNER);

    textFont(myfont);
    textAlign(CENTER);
    textSize(15);
    fill(0);
    text("GAME PAUSED", width/2, height/2-50);
    pauseButton.display();
    quitButton.display();
    textSize(12);
    text("Press 'R' to restart", width/2, height/2+75);
  }

  void display_gameOver() {
    fill(150);
    rectMode(CENTER);
    stroke(2);
    rect(width/2, height/2, width-100, height-100);
    noStroke();
    rectMode(CORNER);

    textFont(myfont);
    textAlign(CENTER);
    textSize(15);
    fill(0);
    if (g_win) {
      text("YOU HAVE WON!", width/2, height/2-50);
      text("Score: " + score, width/2, height/2-10);
      text("Press 'R' to Restart", width/2, height/2+20);
      text("Press 'ESC' to Quit", width/2, height/2+50);
    } else {
      text("GAME IS OVER!", width/2, height/2-50);
      text("Score: " + score, width/2, height/2-10);
      text("Press 'R' to Restart", width/2, height/2+20);
      text("Press 'ESC' to RageQuit", width/2, height/2+50);
    }
  }
}
