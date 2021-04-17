class Timer {
  int displayTime; //Ideal display time for each frame
  int milliStart; //Start time, corrected for pausing
  int pausedTime; //Time at which timer is paused
  boolean paused; //Is the timer paused?

  Timer(int dt) {
    displayTime = dt;
    milliStart = millis();
    paused = false;
  }

  boolean isTime() {  
    if (!paused && millis() - milliStart >= displayTime) {
      milliStart = millis();
      return true;
    }
    return false;
  }

  boolean pause() {
    if (!paused) {
      paused = true;
      pausedTime = millis();
      return true;
    }
    return false;
  }

  boolean unpause() {
    if (paused) {
      paused = false;
      milliStart = millis() - (pausedTime - milliStart);
      //Accounts for time passed before timer was paused
      return true;
    }
    return false;
  }
}
