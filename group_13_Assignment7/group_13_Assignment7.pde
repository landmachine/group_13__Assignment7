Timer time;
Gameboard myGameboard;
Scoreboard myScoreboard;


void setup() {
  //general settings
  size(800, 800);
  
  //initialize the game
  time = new Timer(250);
  myScoreboard = new Scoreboard();
  myGameboard = new Gameboard();
}

void draw() {
  
  //run everything according to the time
  if (time.isTime()) {
    //GUI
    background(color(107, 191, 247));
    myScoreboard.display_score();
    myScoreboard.display_title();
    
    //Game Engine
    myGameboard.run();
    //gameboard1.test();
  }
  
}

void mousePressed() {
  //TEMPORARY!
  if (!time.paused){
    time.pause();
  }else{
    time.unpause();
  }
}

void keyPressed() {
  //handle arrow keys
  if(key == CODED){
    if(keyCode == LEFT){
      key = 'a';
    }
    if(keyCode == RIGHT){
      key = 'd';
    }
    if(keyCode == UP){
      key = 'w';
    }
    if(keyCode == DOWN){
      key = 's';
    }
  }
  
  //change the directions
  //   FIXME: dont allow direction changes till snakes moves at least 1 block
  if( (key == 'a' && myGameboard.direction != 'd') || (key == 'd' && myGameboard.direction != 'a') || (key == 'w' && myGameboard.direction != 's') || (key == 's' && myGameboard.direction != 'w') ){
    myGameboard.direction = key;
  }
  
}
