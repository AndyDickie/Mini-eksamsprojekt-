class Controller extends Init {
  int state;
  int rykNedaf;
  HashMap<String, String> elever = new HashMap<String, String>();
  HashMap<String, String> testsProcent = new HashMap<String, String>();
  String userName;
  int userType, userID, BT;
  Button Login, Register, StartupPage, JoinClass, SeeTestAnswers, CreateClass, 
    ViewClasses, Continue, Home, viewTests, CreateTest, next, previous, NytSpg, viewResults, LavTest, done, AssignClass, Tildel, tilbage, tilbagetilstart;
  ArrayList<Button> test_knapper = new ArrayList<Button>();
  spg question;
  int CurrentQID = 0;
  ArrayList<testAns> a;
  String procentKorrekt;
  ArrayList<spg> besvaredeTest = new ArrayList<spg>();

  Controller(int state_) {
    state = state_;
    tilbagetilstart = new Button(width-150, height-100, 100, 40, "Gå tilbage");
    JoinClass = new Button(425, 110, 150, 40, "Tilslut klasse");
    CreateClass = new Button(575, 110, 150, 40, "Lav klasse");
    SeeTestAnswers = new Button(425, 110, 150, 40, "Se resultater");
    ViewClasses = new Button(125, 110, 150, 40, "Se klasser");
    Continue = new Button(width-200, height-100, 150, 50, "Continue");
    Tildel = new Button(width-200, height-100, 150, 50, "Tildel klasse");
    viewTests = new Button(275, 110, 150, 40, "Dine tests");
    viewResults = new Button(580, 110, 160, 40, "Dine Resultater");
    CreateTest = new Button(275, 110, 150, 40, "Lav test");
    next = new Button(8*width/10, 8*height/10, 150, 40, "Næste");
    previous = new Button(2*width/10, 8*height/10, 150, 40, "Tilbage");
    NytSpg = new Button(150, 325, 150, 50, "Indsæt spg.");
    LavTest = new Button(width/2, height/2+40, 150, 40, "Lav Test");
    done = new Button(150, 700, 150, 40, "Færdig");
    AssignClass = new Button(725, 110, 150, 40, "Tildel Klasse");
    tilbage = new Button(width/2-75, 8*height/10, 150, 40, "Gå tilbage");
  }

  void startScreen() {
    textAlign(CENTER);
    fill(255);
    textSize(80);
    text("Dit test univers", width/2, 120);
    line(200, 130, 800, 130);
    fill(0, 0, 209);
    strokeWeight(2);
    rect(width/2, height/2+50, 350, 400);
    strokeWeight(1);
  }

  void navnElev() {
    textSize(50);
    textAlign(LEFT);
    text("Elev: "+userName, 50, 65);
  }

  void navnLaere() {
    textSize(50);
    textAlign(LEFT);
    text("Lærer: "+userName, 50, 65);
    textAlign(CENTER);
  }
  void homeScreen() {
    if (userType == 1) {
      background(0, 0, 139);
      navnLaere();
      CreateTest.display();
      CreateClass.display();
      SeeTestAnswers.display();
      ViewClasses.display();
      AssignClass.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
    } else {
      background(0, 0, 139);
      navnElev();
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      viewResults.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
    }
  }

  void SeeTestAnswersScreen() {
    background(0, 0, 139);
    ViewClasses.display();
    SeeTestAnswers.display();
    CreateTest.display();
    CreateClass.display();
    AssignClass.display();
    fill(192);
    rectMode(CORNER);
    rect(50, 125, 900, 650);
    rectMode(CENTER);
    Continue.display();
  }

  void update() {
    if (state == 0) {
      startScreen();
    }
    if (state == 3) {
      homeScreen();
    }
    if (state == 4) {
      navnElev();
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      viewResults.display();
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
      navnLaere();
    }

    if (state==6) {
      rectMode(CORNER);
      textAlign(CORNER);
      rykNedaf=130;
      background(0, 0, 139);
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      fill(255);
      textSize(40);
      text("Din valgte test er: "+DinValgteTestNavn, 30, 70);
      textSize(20);
      for (Map.Entry me : elever.entrySet()) {
        try {
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
        catch(Exception e) {
        }
      }
      rectMode(CENTER);
      textAlign(CENTER);
      tilbagetilstart.display();
    }
    if (state==8) {
      ViewClasses.display();
      SeeTestAnswers.display();
      CreateTest.display();
      CreateClass.display();
      AssignClass.display();
      navnLaere();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      textAlign(LEFT);
      fill(255);
      textSize(30);
      fill(255);
      text("Producer spørgsmål:", 75, 270);
      text("Test navn:", 75, 220);
      text("Klasse navn:", 75, 170);
      textAlign(CENTER);
      rectMode(CENTER);
      NytSpg.display();
      done.display();
      textSize(30);
      textAlign(LEFT);
      text(testNavn, 300, 220);
      textAlign(CENTER);
      fill(0);
    }
    if (state==15) {
      background(0, 0, 139);
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      viewResults.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      c.navnElev();
      Continue.display();
      teacherTests.clear();
    }
    if (state==14) {
      rectMode(CORNER);
      textAlign(CORNER);
      rykNedaf=150;
      background(0, 0, 139);
      fill(192);
      rect(50, 125, 900, 650);
      fill(255);
      textSize(50);
      text("Din valgte klasse er: "+DinValgteKlasseNavn, 30, 70);
      textSize(20);
      fill(255);
      text("Testens Navn:", 250, 170);
      text("% Rigtigt", 650, 170);
      for (Map.Entry me : testsProcent.entrySet()) {
        try {
          String nuvarendeTestNavn = (String)me.getKey();
          String nuvarendeProcent = (String)me.getValue();
          rykNedaf+=40;
          fill(255);
          rect(250, rykNedaf, 400, 40);
          rect(250+400, rykNedaf, 70, 40);
          fill(0);
          text(nuvarendeTestNavn, 250+5, rykNedaf+30);
          text(nuvarendeProcent, 250+400+5, rykNedaf+30);
        }
        catch(Exception e) {
        }
      }
      rectMode(CENTER);
      textAlign(CENTER);
      tilbagetilstart.display();
    }
    if (state == 2) {
      c.ToggleAll(false);
      JoinClass.display();
      ViewClasses.display();
      viewTests.display();
      viewResults.display();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      navnElev();
      for (int i=0; i<test_knapper.size(); i++) {
        Button b = test_knapper.get(i);
        b.display();
      }
    }
    if (state == 9) {
      background(0, 0, 139);
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      navnElev();
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
    if (state == 13) {
      background(0, 0, 139);
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      navnLaere();
      fill(255);
      textSize(35);
      text("Test navn:", width/2-250, height/2-15);
      LavTest.display();
    }
    if (state == 10) {
      background(0);
      text("Du fik: "+procentCorrect+"% korrekt", width/2, height/2);
      tilbage.display();
    }
    if (state == 20) {
      background(0, 0, 139);
      ViewClasses.display();
      SeeTestAnswers.display();
      CreateTest.display();
      CreateClass.display();
      AssignClass.display();
      navnLaere();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      Tildel.display();
    }
    if (state == 30) {
      if (userType == 0) {
        fill(192);
        navnElev();
        JoinClass.display();
        ViewClasses.display();
        viewTests.display();
        viewResults.display();
        fill(192);
        rectMode(CORNER);
        rect(50, 125, 900, 650);
        rectMode(CENTER); 
        for (int i=0; i<k.size(); i++) {
          try {
            fill(0);
            textSize(35);
            text("Klassenavn", width/3, height/20+200);
            textSize(20);
            text(k.get(i), width/3, height/20*i+270);
          }
          catch (Exception e) {
          }
        }
      }

      if (userType == 1) {

        fill(192);
        navnLaere();
        ViewClasses.display();
        SeeTestAnswers.display();
        CreateTest.display();
        CreateClass.display();
        AssignClass.display();
        fill(192);
        rectMode(CORNER);
        rect(50, 125, 900, 650);
        rectMode(CENTER);
        for (int i=0; i<k1.size(); i++) {
          fill(0);
          textSize(35);
          text("Klassenavn", width/3, height/20+200);
          text("Klassekode", width-width/3, height/20+200);
          textSize(20);
          text(k1.get(i), width/3, height/20*i+270);
          text(c.getClassCode(k1.get(i)), width-width/3, height/20*i+270);
        }
      }
    }
    if (c.state == 31) {
      background(0, 0, 139);
      fill(192);
      navnLaere();
      fill(192);
      rectMode(CORNER);
      rect(50, 125, 900, 650);
      rectMode(CENTER);
      tilbagetilstart.display();
    }
  }
}
