Timer time;
Gameboard myGameboard;
Scoreboard myScoreboard;

//GLOBAL variables
boolean g_gameOver;
boolean g_win;
int g_goalScore;

void setup() {
  //general settings
  size(800, 800);

  //initialize the game
  time = new Timer(250);
  myScoreboard = new Scoreboard();
  myGameboard = new Gameboard();

  //initialize global variables
  g_gameOver = false;
  g_win = false;
  g_goalScore = 10;
}

void draw() {

  //run everything according to the time
  if (time.isTime() && !g_gameOver) {
    // Run GUI
    background(color(107, 191, 247));
    myScoreboard.display_entireTopBanner();
    //Game Engine
    myGameboard.run();
    //gameboard1.test();
  } else if (g_gameOver) {
    //GAME OVER !
    myScoreboard.display_gameOver();
  } else if (time.paused) {
    myScoreboard.display_pause_menu();
    //game is paused do nothing
    //print("p");
  }
}

void mousePressed() {
    myScoreboard.click();
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
  //   FIXME: dont allow direction changes till snakes moves at least 1 block
  if ( (key == 'a' && myGameboard.direction != 'd') || (key == 'd' && myGameboard.direction != 'a') || (key == 'w' && myGameboard.direction != 's') || (key == 's' && myGameboard.direction != 'w') ) {
    myGameboard.direction = key;
  }
}
