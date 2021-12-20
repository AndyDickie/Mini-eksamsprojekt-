class Controller extends Init {
  int state;
  int rykNedaf=150;
  HashMap<String, String> elever = new HashMap<String, String>();
  String userName;
  int userType, userID;
  Button Login, Register, StartupPage, JoinClass, SeeTestAnswers, CreateClass, ViewClasses, Continue, Home, viewTests, CreateTest, next, previous;
  AnswerFunction test;
  ArrayList<Button> test_knapper = new ArrayList<Button>();
  spg question;
  int CurrentQID = 0;
  ArrayList<testAns> a;

  Controller(int state_) {
    state = state_;
    JoinClass = new Button(425, 110, 150, 40, "Tilslut klasse");
    CreateClass = new Button(575, 110, 150, 40, "Lav klasse");
    SeeTestAnswers = new Button(425, 110, 150, 40, "Se resultater");
    ViewClasses = new Button(125, 110, 150, 40, "Se klasser");
    Continue = new Button(width-200, height-200, 150, 50, "Continue");
    test = new AnswerFunction();

    viewTests = new Button(275, 110, 150, 40, "Dine tests");
    CreateTest = new Button(275, 110, 150, 40, "Lav test");
    
    next = new Button(9*width/10, 8*height/10, 150, 40, "Næste");
    previous = new Button(2*width/10, 8*height/10, 150, 40, "Tilbage");
  }

  void startScreen() {
    //background(0,0,107);
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("Dit test univers", width/2, 120);
    //stroke(0,0,140);
    line(200, 130, 800, 130);
    fill(0, 0, 209);
    strokeWeight(2);
    rect(width/2, height/2+50, 350, 400);
    strokeWeight(1);
  }
  void homeScreen() {
    if (userType == 1) {
      //background(0,0,139);
      textSize(50);
      textAlign(LEFT);
      text(userType+userName+"", 50, 65);
      CreateTest.display();
      CreateClass.display();
      SeeTestAnswers.display();
      ViewClasses.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
    } else {
      //background(0,0,139);
      textSize(50);
      textAlign(LEFT);
      text(userType+userName+"", 50, 65);
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
    }
  }

  void answerScreen() {
    background(0, 0, 139);
    test.display();
  }
  void joinClassScreen() {
    //background(0, 0, 139);
  }

  void SeeTestAnswersScreen() {
    background(0, 0, 139);
    fill(192);
    rectMode(CORNER);
    rect(50, 125, 900, 650);
    rectMode(CENTER);
    Continue.display();
    ViewClasses.display();
    SeeTestAnswers.display();
    CreateTest.display();
    CreateClass.display();
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
      //text("Hej " + userName, width/2, height/10);
      textSize(50);
      textAlign(LEFT);
      text(userType+userName+"", 50, 65);
      joinClassScreen();
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
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
    if (state==7) {
      background(0, 0, 139);
      c.test.display();
    }
    if (state==8) {
      c.ToggleAll(false);
      background(0, 0, 107);
      fill(255);
      c.ToggleCreateQuestion(true);
      ViewClasses.display();
      SeeTestAnswers.display();
      CreateTest.display();
      CreateClass.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      textAlign(LEFT);
      fill(255);
      textSize(30);
      fill(255);
      text(userType+userName+"", 50, 65);
      text("Producere spørgsmål:", 75, 270);
      // skal tilføje +testName efter "String"
      text("Test navn:", 75, 220);
      // skal tilføje +className efter "String"
      text("Klasse navn:", 75, 170);
      fill(0);
      rectMode(CENTER);
    }

    if (state == 2) {
      //text("Hej " + userName, width/2, height/10);
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      textSize(50);
      textAlign(LEFT);
      text(userType+userName+"", 50, 65);
      println(test_knapper.size());
      for (int i=0; i<test_knapper.size(); i++) {
        Button b = test_knapper.get(i);
        b.display();
      }
    }
    if (state == 9) {
      next.display();
      previous.display();
      if (a.size() >0) {
        try {
          question = new spg(a.get(CurrentQID));
          question.display();
        }
        catch(Exception e) {
        }
      } else {
        state = 2;
      }
    }
  }
}

  void udregnProcentRigtigt(PVector point) {
    //Her skal point PVector bestå af antal rigtige spg på x-koordinaten og antal forkerte skal være på y-koordinaten.
    String procent = (int)((point.x/(point.x+point.y))*100)+"%";
    println(procent);
  }
