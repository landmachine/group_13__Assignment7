class Gameboard {
  // Colors for active/inactive cells
  color alive = color(random(255), random(255), random(255));
  color dead = color(0);
  
  // Size of cells
  int tableSize = 30;
  int cellSize = 20;
  int moveTable = 80;
  
  
  // Array of cells
  int[][] cells;
  int[][] cellsBuffer;
  
  Gameboard(){
    // Instantiate arrays 
    cells = new int[tableSize][tableSize];
    cellsBuffer = new int[tableSize][tableSize];

  }
  
  void test(){
    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {
        
      }
    }
  }
  
  void display(){
    fill(255);
    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {
        rect(x*cellSize+moveTable, y*cellSize+moveTable, cellSize, cellSize);
      }
    }
  }
 
  
  
  
  
  
}
