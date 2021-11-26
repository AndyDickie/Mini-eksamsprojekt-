class Controller extends Init {
  int state;
  
  Controller(int state_) {
    state = state_;
  }

  void startScreen() {
    background(0);
  }



  void update() {
    if (state == 0) {
      startScreen();
    }
  }
}
