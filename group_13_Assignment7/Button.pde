class Button {
  int xPos, yPos, xLen, yLen;
  PFont buttonFont;
  PShape buttonGraphic;
  String displayText;

  Button(int _xPos, int _yPos, int _xLen, int _yLen, String _displayText) {
    xPos = _xPos;
    yPos = _yPos;
    xLen = _xLen;
    yLen = _yLen;
    displayText = _displayText;
    buttonFont = createFont("SansSerif", 32);
    rectMode(CENTER);
    buttonGraphic = createShape(RECT, 0, 0, xLen, yLen);
  }

  Button(int _xPos, int _yPos, int _xLen, int _yLen, String _displayText, PFont _buttonFont) {
    xPos = _xPos;
    yPos = _yPos;
    xLen = _xLen;
    yLen = _yLen;
    displayText = _displayText;
    buttonFont = _buttonFont;
    rectMode(CENTER);
    buttonGraphic = createShape(RECT, 0, 0, xLen, yLen);
  }

  void display() {
    color col;
    if (inShape()) {
      // mouse hover
      col = color(100);
    } else {
      // static
      col = color(150);
    }
    buttonGraphic.setFill(col);
    shapeMode(CENTER);
    shape(buttonGraphic, xPos, yPos);
    textAlign(CENTER, CENTER);
    text(displayText, xPos, yPos-4);
  }

  boolean inShape() {
    if ((mouseX > xPos - xLen/2 && mouseX < xPos + xLen/2) && 
      (mouseY > yPos - yLen/2 && mouseY < yPos + yLen/2)) {
      return true;
    }
    return false;
  }
}
