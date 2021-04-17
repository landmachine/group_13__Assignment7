class Gameboard {
  // Colors for active/inactive cells
  color alive = color(random(255), random(255), random(255));
  color dead = color(0);
  
  // Size of cells
  int tableSize = 30;
  int cellSize = 20;
 
  // Array of cells
  int[][] cells;
  // Buffer to record the state of the cells and use this while changing the others in the interations
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
    for (int x=0; x<cells.length; x++) {
      for (int y=0; y<cells.length; y++) {
        rect(x*cellSize, y*cellSize, cellSize, cellSize);
      }
    }
  }
 
  
  
  
  
  
}
