class Controller extends Init {
  int state;
  String userName;

  Controller(int state_) {
    state = state_;
  }

  void startScreen() {
    background(0);
  }
  void homeScreen() {
    background(0);
    textSize(50);
    text("Hej " + userName, width/2, height/10);
  }
  void update() {
    if (state == 0) {
      startScreen();
    }
    if ( state == 1) {
      homeScreen();
    }
  }
}
