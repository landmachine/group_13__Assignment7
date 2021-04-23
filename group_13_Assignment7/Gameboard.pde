class Gameboard {
  color snake; 

  // Size of the game/cells
  int tableSize = 35;
  int cellSize = 20;
  int moveTable = (width-(tableSize*cellSize))/2;

  // Snake variables
  char direction = 'd';
  int[] snakeHead = {tableSize/2, tableSize/2};

  // Food variables
  int[] foodLoc = {7, 5};

  // The 2d grid where all the calculations are made
  int[][] cells;


  Gameboard() {
    // Chose a random color for our snake
    snake = color(random(200), random(200), random(200));

    // Instantiate the array 
    cells = new int[tableSize][tableSize];

    //initial snake
    cells[tableSize/2-1][tableSize/2] = 1;
    cells[tableSize/2][tableSize/2] = 2;
    //initial food
    cells[foodLoc[0]][foodLoc[1]] = -1;
    //set borders
    for (int y=0; y<cells.length; y++) {
      for (int x=0; x<cells.length; x++) {
        if (y == 0 || x == 0 || y == tableSize-1 || x == tableSize-1) {
          cells[x][y] = -3;
        }
      }
    }
  }

  //call this function to see the underlying 2d grid!
  // -3: borders
  // -1: food
  // n>0: snake
  void test() {
    for (int y=0; y<cells.length; y++) {
      for (int x=0; x<cells.length; x++) {
        print(cells[x][y]);
      }
      println();
    }
    println();
    println();
  }

  void food() {
    // need to randomly generate the food in a place that the snake does not occupy
    while (cells[foodLoc[0]][foodLoc[1]] !=0) {
      foodLoc[0] = (int)random(tableSize);
      foodLoc[1] = (int)random(tableSize);
    }
    cells[foodLoc[0]][foodLoc[1]] = -1;
  }

  void collision() {
    g_win = false;
    g_gameOver = true;
  }

  void victory() {
    g_win = true;
    g_gameOver = true;
  }

  void run() {
    //victory conditions
    //if (myScoreboard.score >= pow(tableSize, 2) - 3) {
    if (myScoreboard.score >= g_goalScore) {
      victory();
      return;
    }
    //right
    if (direction == 'd') {
      if (cells[snakeHead[0]+1][snakeHead[1]] < -2 || cells[snakeHead[0]+1][snakeHead[1]] > 0) {
        collision();
      }
      cells[snakeHead[0]+1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[0] += 1;
    }
    //down
    if (direction == 's') {
      if (cells[snakeHead[0]][snakeHead[1]+1] < -2 || cells[snakeHead[0]][snakeHead[1]+1] > 0) {
        collision();
      }
      cells[snakeHead[0]][snakeHead[1]+1] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[1] += 1;
    }
    //left
    if (direction == 'a') {
      if (cells[snakeHead[0]-1][snakeHead[1]] < -2 || cells[snakeHead[0]-1][snakeHead[1]] > 0) {
        collision();
      }
      cells[snakeHead[0]-1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[0] -= 1;
    }
    //up
    if (direction == 'w') {
      if (cells[snakeHead[0]][snakeHead[1]-1] < -2 || cells[snakeHead[0]][snakeHead[1]-1] > 0) {
        collision();
      }
      cells[snakeHead[0]][snakeHead[1]-1] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[1] -= 1;
    }        



    //check for food
    boolean eat = false;
    if (snakeHead[0] == foodLoc[0] && snakeHead[1] == foodLoc[1]) {
      eat = true;
      food(); //generate new food
      myScoreboard.increment();
    }

    //grid rect settings
    noStroke();
    rectMode(CORNER);
    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {

        //tail movement
        if (!eat) {
          if (cells[x][y] > 0) {
            cells[x][y] -= 1;
          }
        }

        //display
        if (cells[x][y] >= 1) {
          fill(snake);
        } else if (cells[x][y] == -1) {
          fill(0);
        } else if (cells[x][y] == -3) {
          fill(107, 191, 247);
        } else {
          fill(255);
        }
        rect(x*cellSize+moveTable, y*cellSize+moveTable, cellSize, cellSize);
      }
    }
  }
}
