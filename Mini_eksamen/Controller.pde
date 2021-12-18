class Controller extends Init {
  int state;
  String userName;
  Button Login, Register, StartupPage, JoinClass, SeeTestAnswers;
  AnswerFunction test;
  
  Controller(int state_) {
    state = state_;
    Login = new Button(width/3-50, height/3-50, 100, 100, "Login");
    Register = new Button(2*(width/3)-50, (height/3)-50, 100, 100, "Register");
    StartupPage = new Button(width/10, height/10, 100, 100, "Home");
    JoinClass = new Button(width/10, 2*height/10, 100, 50, "Join Class");
    SeeTestAnswers = new Button(width/10, 2*height/5, 100, 50, "See Answers From Tests");
    
    test = new AnswerFunction();
  }

  void startScreen() {
    background(0);
    Login.display();
    Register.display();
  }
  void LoginScreen(){
    background(0);
    StartupPage.display();
    //ToggleLogin(true);
  }
  
  void RegisterScreen(){
    background(0);
    StartupPage.display();
  }
  void homeScreen() {
    background(0);
    textSize(50);
    text("Hej " + userName, width/2, height/10);
    JoinClass.display();
    SeeTestAnswers.display();
  }
  
  void answerScreen(){
   background(0);
   test.display();
  }
    void joinClassScreen() {
    //background(0);
    
  }
  
  void SeeTestAnswersScreen(){
    background(0);
    
   // teacherClass.addItems(klasseliste);
    
    //Her skal gøres så man kan vælge hvilken klasse man skal se resultater for
    
  }
  void update() {
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
    if (state == 5){
      SeeTestAnswersScreen();
      teacherTests.clear();
      if(selected!=null){
    StringList testliste = c.getTestsPerClass((int)selected);
    for (int i=0; i<testliste.size();i++){
      teacherTests.addItem(testliste.get(i),i);
    }
    }
    }
  }
}
