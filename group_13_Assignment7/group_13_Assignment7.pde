Timer time;
Gameboard myGameboard;
Scoreboard myScoreboard;

//GLOBAL variables
boolean allowKeyPress;
boolean g_gameOver;
boolean g_win;
boolean g_start;
int g_goalScore;

void setup() {
  //general settings
  size(800, 800);

  //initialize the game
  myScoreboard = new Scoreboard();
  myGameboard = new Gameboard();
  time = new Timer(250);
  time.pause();

  //initialize global variables
  allowKeyPress = true;
  g_gameOver = false;
  g_win = false;
  g_start = true;
  g_goalScore = 20;
}

void draw() {



  //run everything according to the time
  if (time.isTime() && !g_gameOver) {
    // GUI
    background(color(107, 191, 247));
    myScoreboard.display_banner();

    // Game Engine
    myGameboard.run();
    allowKeyPress = true;
    //gameboard1.test();
  } else if (g_gameOver) {
    //GAME OVER !
    myScoreboard.display_gameOver();
  } else if (time.paused && !g_start) {
    //game is paused
    myScoreboard.display_pause_menu();
  } else if (g_start) {
    //initial screen
    background(color(107, 191, 247));
    myScoreboard.display_welcome();
  }
}

void mousePressed() {
  myGameboard.snake = color(random(200), random(200), random(200));

  if (myScoreboard.menuButton.inShape()) {
    if (!g_gameOver && !g_start) {
      if (!time.paused) {
        time.pause();
      } else {
        time.unpause();
      }
    }
  } else if (myScoreboard.pauseButton.inShape() && time.paused) {
    time.unpause();
    g_start = false;
  } else if (myScoreboard.quitButton.inShape() && time.paused) {
    exit();
  }
}

void keyPressed() {  
  //handle arrow keys
  if (key == CODED) {
    if (keyCode == LEFT) {
      key = 'a';
    }
    if (keyCode == RIGHT) {
      key = 'd';
    }
    if (keyCode == UP) {
      key = 'w';
    }
    if (keyCode == DOWN) {
      key = 's';
    }
  }

  //change the directions
  if ( (key == 'a' && myGameboard.direction != 'd') || (key == 'd' && myGameboard.direction != 'a') || (key == 'w' && myGameboard.direction != 's') || (key == 's' && myGameboard.direction != 'w') ) {
    if (allowKeyPress) {
      myGameboard.direction = key;
      allowKeyPress = false;
    }
  }

  // game pause input
  if (key== 'p') {
    if (!g_gameOver && !g_start) {
      //Pause/Unpause the game
      if (!time.paused) {
        time.pause();
      } else {
        time.unpause();
      }
    }
  }

  // restart the game!
  if (key=='r') {
    setup();
  }
}
