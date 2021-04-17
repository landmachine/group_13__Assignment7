class Gameboard {
  // Colors for active/inactive cells
  color snake = color(random(200), random(200), random(200));
  
  // Size of cells
  int tableSize = 20;
  int cellSize = 30;
  int moveTable = (width-(tableSize*cellSize))/2;
  
  //snake variables
  String direction = "d";
  int[] snakeHead = {tableSize/2, tableSize/2};
  
  // Array of cells
  int[][] cells;
  
  Gameboard(){
    // Instantiate arrays 
    cells = new int[tableSize][tableSize];
    
    //initial snake
    cells[tableSize/2-1][tableSize/2] = 1;
    cells[tableSize/2][tableSize/2] = 2;

  }
  
  void test(){
    for (int y=0; y<cells.length; y++) {
      //println(cells[x]);
      for (int x=0; x<cells.length; x++) {
        print(cells[x][y]);
      }
      println();
    }
  }
  
  void run(){
  //right
  if(direction == "d"){
    cells[snakeHead[0]+1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
    snakeHead[0] += 1;
  }
  //down
  if(direction == "s"){
    cells[snakeHead[0]][snakeHead[1]+1] = cells[snakeHead[0]][snakeHead[1]] + 1;
    snakeHead[1] += 1;
  }
  //left
  if(direction == "a"){
    cells[snakeHead[0]-1][snakeHead[1]] = cells[snakeHead[0]][snakeHead[1]] + 1;
    snakeHead[0] -= 1;
  }
  //up
  if(direction == "w"){
    cells[snakeHead[0]][snakeHead[1]-1] = cells[snakeHead[0]][snakeHead[1]] + 1;
    snakeHead[1] -= 1;
  }
    
    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {
       

        
        
        
        //display
        if (cells[x][y] >= 1){
          fill(snake);
        }else{
          fill(255);
        }
        rect(x*cellSize+moveTable, y*cellSize+moveTable, cellSize, cellSize);
      }
    }
    
    

  }
 
  
  
  
  
  
}
