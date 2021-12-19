class Controller extends Init {
  int state;
  int rykNedaf=150;
  HashMap<String, String> elever = new HashMap<String, String>();
  String userName;
  int userType;
  Button Login, Register, StartupPage, JoinClass, SeeTestAnswers, CreateClass, ViewClasses, Continue, Home;
  AnswerFunction test;

  Controller(int state_) {
    state = state_;
    JoinClass = new Button(width/10, 2*height/10, 150, 50, "Join Class");
    CreateClass = new Button(width/10, 2*height/10, 150, 50, "Create Class");
    SeeTestAnswers = new Button(width/10, 2*height/5, 150, 50, "View Results");
    ViewClasses = new Button(width/10, 2*height/7.5, 150, 50, "View Classes");
    Continue = new Button(width-200, height-200, 150, 50, "Continue");
    test = new AnswerFunction();
  }

  void startScreen() {
    //background(0,0,107);
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("Dit test univers", width/2,120);
    //stroke(0,0,140);
    line(200,130,800,130);
    fill(0,0,209);
    strokeWeight(2);
    rect(width/2,height/2+50,350,400);
    strokeWeight(1);
  }
  void homeScreen() {
    if (userType == 1) {
      //background(0,0,139);
      textSize(50);
      text("Hej " + userName, width/2, height/10);
      CreateClass.display();
      SeeTestAnswers.display();
      ViewClasses.display();
    } else {
      //background(0,0,139);
      textSize(50);
      text("Hej " + userName, width/2, height/10);
      JoinClass.display();
      ViewClasses.display();
    }
  }

  void answerScreen() {
    background(0,0,139);
    test.display();
  }
  void joinClassScreen() {
    background(0,0,139);
  }

  void SeeTestAnswersScreen() {
    background(0,0,139);
    Continue.display();
  }

  void update() {
    //background(0,0,139);
    if (state == 0) {
      startScreen();
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
      if (selectedClass!=null) {
        StringList testliste = c.getTestsPerClass((int)selectedClass);
        for (int i=0; i<testliste.size(); i++) {
          teacherTests.addItem(testliste.get(i), getTestID(testliste.get(i)));
        }
      }
    }
    if (state==6) {
      rectMode(CORNER);
      textAlign(CORNER);
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
      text(DinValgteTestNavn, 30, 70);
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
      textAlign(CENTER);
    }
    if (state==7){
     background(0,0,139);
     c.test.display();
    }
  }
}

void udregnProcentRigtigt(PVector point) {
  //Her skal point PVector bestå af antal rigtige spg på x-koordinaten og antal forkerte skal være på y-koordinaten.
  String procent = (int)((point.x/(point.x+point.y))*100)+"%";
  println(procent);
}
