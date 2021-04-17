Timer time;
Gameboard gameboard1;
Scoreboard myScoreboard;
PFont titleFont;

void setup() {
  size(800, 800);
  titleFont = createFont("SansSerif", 32);
  time = new Timer(500);
  myScoreboard = new Scoreboard(titleFont);
  gameboard1 = new Gameboard();

  //frameRate(1);
}

void draw() {
  //run everything
  if (time.isTime()) {
    //GUI
    background(color(107, 191, 247));
    textFont(titleFont);
    textAlign(CENTER);
    text("Snake", width/2, 40);
    
    //game engine
    myScoreboard.display();
    gameboard1.run();
    //gameboard1.test();
  }
  
}

void mousePressed() {
  myScoreboard.increment();
}

void keyPressed() {
  if(key == ' '){
    println("space bar!");
  }
  
  else if (key == 'a' || key == 's' || key == 'd' || key == 'w') {
    if( (key == 'a' && gameboard1.direction != 'd') || (key == 'd' && gameboard1.direction != 'a') || (key == 'w' && gameboard1.direction != 's') || (key == 's' && gameboard1.direction != 'w') ){
      gameboard1.direction = key;
    }
  }
}
