class Controller extends Init {
  int state;
  String userName;
  Button Login, Register, Home, JoinClass;
  AnswerFunction test;
  
  Controller(int state_) {
    state = state_;
    Login = new Button(width/3-50, height/3-50, 100, 100, "Login");
    Register = new Button(2*(width/3)-50, (height/3)-50, 100, 100, "Register");
    Home = new Button(width/10, height/10, 100, 100, "Home");
    JoinClass = new Button(width/10, 2*height/10, 100, 50, "Join Class");
    
    test = new AnswerFunction();
  }

  void startScreen() {
    background(0);
    Login.display();
    Register.display();
  }
  void LoginScreen(){
    background(0);
    Home.display();
    //ToggleLogin(true);
  }
  
  void RegisterScreen(){
    background(0);
    Home.display();
  }
  void homeScreen() {
    background(0);
    textSize(50);
    text("Hej " + userName, width/2, height/10);
    JoinClass.display();
  }
  
  void answerScreen(){
   background(0);
   test.display();
  }
    void joinClassScreen() {
    //background(0);
    
  }
  void update() {
    
    //if (userName != null){
    //  c.state = 3;
    //  //ToggleLogin(false);
    //  //test = false;
    //}
    if (state == 0) {
      startScreen();
    }
    
    if (state == 1){
      LoginScreen();
    }
    if (state == 2) {
      RegisterScreen();
    }
    if (state == 3) {
      homeScreen();
    }
    
    if (state == 4) {
      joinClassScreen();
    }
  }
}
