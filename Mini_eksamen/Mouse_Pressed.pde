Object selectedClass, selectedTest, selectedTestName, selectedClassName;
String DinValgteTestNavn;
String DinValgteKlasseNavn;
int DinValgteTest;
int procentKorrekt;

void mouseReleased() {
  if ((c.state == 3 || c.state == 2 || c.state == 4) && c.JoinClass.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    c.ToggleAll(false);
    c.ToggleClass(true);
    c.state = 4;
  }
  
  if ((c.state == 3 || c.state == 2 || c.state == 4) && c.viewResults.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    cp5.getController("DineKlasser").show();
    StringList klasseliste = c.getTeacherClasses(c.getUserId(c.userName));
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    c.state = 15;
  }
  
  if(c.state==15 && c.Continue.hasClicked() && c.userType==0 && selectedClass!=null){
    c.testsProcent.put("Algebra","30%");
    DinValgteKlasseNavn = (String)selectedClassName;
    c.ToggleTeacherTests(false);
    c.state=14;
  }

  if (c.state == 3 && c.SeeTestAnswers.hasClicked() && c.userType == 1) {
    background(0, 0, 139);
    c.ToggleAll(false);
  }
  if (c.state == 3 && c.SeeTestAnswers.hasClicked()) {
    c.ToggleTeacherTests(true);
    
    StringList klasseliste = c.getTeacherClasses(c.getUserId(c.userName));
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    c.state = 5;
  }
  if (c.state == 3 && c.CreateClass.hasClicked() && c.userType == 1) {
    background(0, 0, 139);
    c.ToggleAll(false);
    c.ToggleCreateClass(true);
    println("createclass tryk");
  }
  if (c.state == 3 && c.ViewClasses.hasClicked() && c.userType == 1) {
    println("vievClass tryk");
    StringList k = c.getTeacherClasses(c.getUserId(c.userName));
    println(k);
    for (int i=0; i<k.size(); i++) {
      println("sss");
      text(k.get(i), width/2, height/20*i+150);
      text(c.getClassCode(k.get(i)), width/2+200, height/20*i+150);
    }
  }
  if ((c.state == 3 || c.state == 2 || c.state == 4) && c.ViewClasses.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    textSize(50);
    //text("Hej " + c.userName, width/2, height/10);
    c.ToggleAll(false);
    StringList k = c.getUserClasses(c.getUserId(c.userName));
    println(k);
    for (int i=0; i<k.size(); i++) {
      try {
        textSize(20);
        text(k.get(i), width/2, height/20*(i+1)+150);
      }
      catch (Exception e) {
      }
      c.state = 3;
    }
  }

  if ((c.state == 2 || c.state==3|| c.state == 4) && c.viewTests.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    textSize(50);
    //text("Hej " + c.userName, width/2, height/10);
    c.AssignedTests();
    c.state = 2;
  }
  if (c.state == 9 && (c.next.hasClicked() || c.previous.hasClicked())) {
    if (c.next.hasClicked() && c.CurrentQID<c.a.size()-1) {
      c.CurrentQID += 1;
    }
    if (c.previous.hasClicked() && c.CurrentQID>0) {
      c.CurrentQID -= 1;
    }
    
  }
  if (c.state == 9){
    if (c.CurrentQID == c.a.size()-1) {
      c.next.text = "Finish";
    } else {
      c.next.text = "Next";
    }
  }
  if (c.state == 9 && c.question.mousepressed()) {
    String userAns = c.question.mousePress();
    if (userAns != null) {
      c.question.userAns = userAns;
      c.besvaredeTest.add(c.question);
      //c.insertUserAnswer(userAns, int(c.question.id), c.userID);
    }
    if (c.CurrentQID<c.a.size() && userAns != null) {
      c.CurrentQID += 1;
    } if (c.CurrentQID == c.a.size()) {
    float antalKorrekt = 0;
    println(c.besvaredeTest.size());
    for (int i=0; i<c.besvaredeTest.size(); i++) {
      spg l = c.besvaredeTest.get(i);
      //println("bruger: " + l.userAns);
      //println("rigtigt " + l.correctAns);
      if (l.userAns.equals(l.correctAns) == true) {
        //println("rigtigt");
        antalKorrekt += 1;
      }
    }
    procentKorrekt = int((antalKorrekt/c.besvaredeTest.size())*100);
    c.state = 10;
    }
  }

  if (c.state == 2) {
    for (int i=0; i<c.test_knapper.size(); i++) {
      Button b = c.test_knapper.get(i);
      if (b.hasClicked()) {
        //question = new testAns)
        println("okokok");
        println(c.getTestID(b.text));
        c.getTestAnswer(c.getTestID(b.text));
        background(0, 0, 139);
        c.state = 9;
      }
    }
  }

  if (c.state==5 && c.Continue.hasClicked() && selectedTest!=null) {
    DinValgteTestNavn = (String)selectedTestName;
    DinValgteTest = (int)selectedTest;
    c.elever.put("Aske","90%");

    c.ToggleTeacherTests(false);
    c.state=6;
  }


  //if (c.state==7 && c.test.first.hasClicked()){
  //  db.query("INSERT INTO Elevsvar VALUES(null,'"+questionID+"','"+c.getUserId(c.userName)+"','"+forstsvar+"')");
  //}
  //if (c.state==7 && c.test.second.hasClicked()){
  //  db.query("INSERT INTO Elevsvar VALUES(null,'"+questionID+"','"+c.getUserId(c.userName)+"','"+Andetsvar+"')");
  //}
  //if (c.state==7 && c.test.third.hasClicked()){
  //  db.query("INSERT INTO Elevsvar VALUES(null,'"+questionID+"','"+c.getUserId(c.userName)+"','"+Tredjesvar+"')");
  //}
  //if (c.state==7 && c.test.fourth.hasClicked()){
  //  db.query("INSERT INTO Elevsvar VALUES(null,'"+questionID+"','"+c.getUserId(c.userName)+"','"+Fjerdesvar+"')");
  //}

  if (c.state==3 && c.CreateTest.hasClicked()) {
    c.state=8;
  }

  if (c.state==8 && c.NytSpg.hasClicked()) {
    String testNavn = cp5.get(Textfield.class, " ").getText();
    String className = cp5.get(Textfield.class, "").getText();
    String question = cp5.get(Textfield.class, "Spørgsmål").getText();
    String forstsporgsmal = cp5.get(Textfield.class, "1 svar").getText();
    String Andetsporgsmal = cp5.get(Textfield.class, "2 svar").getText();
    String Tredjesporgsmal = cp5.get(Textfield.class, "3 svar").getText();
    String Fjerdesporgsmal = cp5.get(Textfield.class, "4 svar").getText();
    int status = int(cp5.get(Textfield.class, "Det rigtige svar skriv 1-4").getText());
    int questionNR = int(cp5.get(Textfield.class, "Spørgsmål NR").getText());
    c.createQuestionAnswer(question, forstsporgsmal, Andetsporgsmal, Tredjesporgsmal, Fjerdesporgsmal, questionNR, status, className);
  }
}

void DineKlasser (int index) {
  selectedClass = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("value");
  selectedClassName = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("name");
  println(selectedClass);
}

void DinKlassesTests (int index) {
  selectedTest = cp5.get(ScrollableList.class, "DinKlassesTests").getItem(index).get("value");
  selectedTestName = cp5.get(ScrollableList.class, "DinKlassesTests").getItem(index).get("name");
  println(selectedTest);
}
