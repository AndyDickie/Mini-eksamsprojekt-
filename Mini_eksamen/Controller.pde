class Controller extends Init {
  int state;
  int rykNedaf=150;
  HashMap<String, String> elever = new HashMap<String, String>();
  String userName;
<<<<<<< Updated upstream
  int userType;
  Button Login, Register, StartupPage, JoinClass, SeeTestAnswers, CreateClass, ViewClasses;
=======
  Button Login, Register, Home, JoinClass, SeeTestAnswers, Continue;
>>>>>>> Stashed changes
  AnswerFunction test;

  Controller(int state_) {
    state = state_;
    Login = new Button(width/3-50, height/3-50, 100, 100, "Login");
    Register = new Button(2*(width/3)-50, (height/3)-50, 100, 100, "Register");
    StartupPage = new Button(width/10, height/10, 100, 100, "Home");
    JoinClass = new Button(width/10, 2*height/10, 100, 50, "Join Class");
    CreateClass = new Button(width/10, 2*height/10, 100, 50, "Create Class");
    SeeTestAnswers = new Button(width/10, 2*height/5, 100, 50, "See Answers From Tests");
<<<<<<< Updated upstream
    ViewClasses = new Button(width/10, 2*height/7.5, 100, 50, "View Your Classes");
=======
    Continue = new Button(width-200, height-200, 100, 50, "Continue");
>>>>>>> Stashed changes

    test = new AnswerFunction();
  }

  void startScreen() {
    //background(0);
    Login.display();
    Register.display();
  }
  void LoginScreen() {
<<<<<<< Updated upstream
    background(0);
    StartupPage.display();
=======
    //background(0);
    Home.display();
>>>>>>> Stashed changes
    //ToggleLogin(true);
  }

  void RegisterScreen() {
<<<<<<< Updated upstream
    background(0);
    StartupPage.display();
  }
  void homeScreen() {
    if (userType == 1) {
      //background(0);
      textSize(50);
      text("Hej " + userName, width/2, height/10);
      CreateClass.display();
      SeeTestAnswers.display();
      ViewClasses.display();
    } else {
      //background(0);
      textSize(50);
      text("Hej " + userName, width/2, height/10);
      JoinClass.display();
    }
  }

  void answerScreen() {
    background(0);
    test.display();
  }
  void joinClassScreen() {
    background(0);
  }

  void SeeTestAnswersScreen() {
    background(0);
=======
    //background(0);
    Home.display();
  }
  void homeScreen() {
    //background(0);
    textSize(50);
    text("Hej " + userName, width/2, height/10);
    JoinClass.display();
    SeeTestAnswers.display();
  }

  void answerScreen() {
    //background(0);
    test.display();
  }
  void joinClassScreen() {
    //background(0);
  }

  void SeeTestAnswersScreen() {
    //background(0);
    Continue.display();
>>>>>>> Stashed changes

    // teacherClass.addItems(klasseliste);

    //Her skal gøres så man kan vælge hvilken klasse man skal se resultater for
  }
  void update() {
    background(0,0,139);
    if (state == 0) {
      startScreen();
    }

    if (state == 1) {
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
    if (state == 5) {
      SeeTestAnswersScreen();
      teacherTests.clear();
<<<<<<< Updated upstream
      if (selected!=null) {
        StringList testliste = c.getTestsPerClass((int)selected);
        for (int i=0; i<testliste.size(); i++) {
          teacherTests.addItem(testliste.get(i), i);
        }
      }
=======
      if (selectedClass!=null) {
        StringList testliste = c.getTestsPerClass((int)selectedClass);
        for (int i=0; i<testliste.size(); i++) {
          teacherTests.addItem(testliste.get(i), getTestID(testliste.get(i)));
        }
      }
    }
    if (state==6) {
      rectMode(CORNER);
      rykNedaf=150;
      background(0, 0, 139);
      fill(255);
      rect(width-300, 20, 280, 100);
      fill(0);
      text("Se hvordan elevernes svar", width-290, 50);
      text("fordeler sig ved at trykke", width-285, 80);
      text("på elevens navn", width-240, 110);
      fill(255);
      textSize(50);
      text(DinValgteTest, 30, 70);
      textSize(20);
      text("Procent korrekt", 30, 110);
      for (Map.Entry me : elever.entrySet()) {
        String nuvarendeNavn = (String)me.getKey();
        String nuvarendeProcent = (String)me.getValue();
        rykNedaf+=40;
        fill(255);
        rect(250, rykNedaf, 400, 40);
        rect(250+400, rykNedaf, 70, 40);
        fill(0);
        text(nuvarendeNavn, 250+5, rykNedaf+30);
        text(nuvarendeProcent, 250+400+5, rykNedaf+30);
      }
      rectMode(CENTER);
>>>>>>> Stashed changes
    }
  }
}



void udregnProcentRigtigt(float point, float maxPoint){
  String procent = (int)((point/maxPoint)*100)+"%";
  println(procent);
}
