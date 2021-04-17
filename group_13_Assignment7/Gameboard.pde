class Gameboard {
  // Colors for active/inactive cells
  color snake = color(random(200), random(200), random(200));

  // Size of cells
  int tableSize = 20;
  int cellSize = 30;
  int moveTable = (width-(tableSize*cellSize))/2;

  //snake variables
  char direction = 'd';
  int[] snakeHead = {tableSize/2, tableSize/2};

  //food variables
  int[] foodLoc = {(int)random(tableSize), (int)random(tableSize)};

  // Array of cells
  int[][] cells;

  Gameboard() {
    // Instantiate arrays 
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

  void run() {
    //right
    if (direction == 'd') {
      if (cells[snakeHead[0]+1][snakeHead[1]] < -2) {
        time.pause();
      }
      cells[snakeHead[0]+1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[0] += 1;
    }
    //down
    if (direction == 's') {
      cells[snakeHead[0]][snakeHead[1]+1] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[1] += 1;
    }
    //left
    if (direction == 'a') {
      cells[snakeHead[0]-1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[0] -= 1;
    }
    //up
    if (direction == 'w') {
      cells[snakeHead[0]][snakeHead[1]-1] = cells[snakeHead[0]][snakeHead[1]] + 1;
      snakeHead[1] -= 1;
    }        



    //check for food
    if (snakeHead[0] == foodLoc[0] && snakeHead[1] == foodLoc[1]) {
      food(); //generate new food
      myScoreboard.increment();
    }



    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {
        if (cells[x][y] > 0) {
          cells[x][y] -= 1;
        }



        noStroke();
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

    test();
  }
}
