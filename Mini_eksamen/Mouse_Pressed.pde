Object selectedClass, selectedTest, selectedTestName, selectedClassName, selectedTestID, selectedTestNavn;
String DinValgteTestNavn;
String DinValgteKlasseNavn;
int DinValgteTest, DinValgteKlasse;
int procentCorrect;
String testNavn;
StringList DineTests = new StringList();
StringList testProcent = new StringList();
StringList elevBesvarelse = new StringList();
StringList k, k1;

void mouseReleased() {
  if ((c.state==6||c.state==14||c.state==31)&&c.tilbagetilstart.hasClicked()) {
    c.ToggleAll(false);
    c.state=3;
  }
  if ((c.state == 3 || c.state == 2 || c.state == 4 || c.state==15 || c.state==30) && c.JoinClass.hasClicked() && c.userType == 0) {
    c.ToggleAll(false);
    background(0, 0, 139);
    c.ToggleClass(true);
    cp5.getController("DineKlasser").hide();
    c.state = 4;
  }
  //State 15
  if ((c.state == 3 || c.state == 2 || c.state == 4 || c.state==15|| c.state==30) && c.viewResults.hasClicked() && c.userType == 0) {
    c.ToggleAll(false);
    background(0, 0, 139);
    teacherClass.clear();
    teacherTests.clear();

    StringList klasseliste = c.getUserClasses(c.getUserId(c.userName));
    c.state = 15;
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    cp5.getController("DineKlasser").show();
  }
  //State ved ikke endnu
  if ((c.state == 3 || c.state == 2 || c.state == 4|| c.state==15|| c.state==30) && c.ViewClasses.hasClicked() && c.userType == 0) {
    c.ToggleAll(false);
    cp5.getController("DineKlasser").hide();
    background(0, 0, 139);
    k = c.getUserClasses(c.userID);
    c.state = 30;
  }
  if ((c.state == 3 || c.state == 2 || c.state == 4|| c.state==15|| c.state==30|| c.state ==5|| c.state == 8|| c.state==20) && c.ViewClasses.hasClicked() && c.userType == 1) {
    c.ToggleAll(false);
    k1 = c.getTeacherClasses(c.getUserId(c.userName));
    background(0, 0, 139);
    c.state = 30;
  }
  //State 2
  if ((c.state == 3 || c.state == 2 || c.state == 4|| c.state==15|| c.state==30) && c.viewTests.hasClicked() && c.userType == 0) {
    c.ToggleAll(false);
    cp5.getController("DineKlasser").hide();
    c.state=2;
  }
  if ((c.state == 13 || c.state == 8 || c.state == 5 || c.state==3 || c.state==20|| c.state == 30) && c.SeeTestAnswers.hasClicked() && c.userType == 1) {
    c.ToggleAll(false);
    teacherTests.clear();
    teacherClass.clear();
    c.ToggleTeacherTests(true);
    StringList klasseliste = c.getTeacherClasses(c.getUserId(c.userName));
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    c.state=5;
  }

  if ((c.state == 13) && c.LavTest.hasClicked() && c.userType == 1) {
    c.ToggleAll(false);
    testNavn = cp5.get(Textfield.class, "").getText();
    c.createTest(testNavn);
    c.ToggleAll(false);
    c.ToggleCreateNewTest(false);
    c.ToggleCreateQuestion(true);
    c.state=8;
  }

  if ((c.state == 13 || c.state == 8 || c.state == 5 || c.state==3 || c.state==20|| c.state == 30) && c.AssignClass.hasClicked() && c.userType == 1) {
    c.ToggleAll(false);
    teacherClass.clear();
    teacherTestsID.clear();
    cp5.getController("DineKlasser").show();
    StringList klasseliste = c.getTeacherClasses(c.getUserId(c.userName));
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    cp5.getController("DineTest").show();
    StringList testList = c.getTests();
    StringList testListName = c.getTestName();
    for (int i=0; i<testList.size(); i++) {
      try {
        teacherTestsID.addItem(testListName.get(i), testList.get(i));
      }
      catch(Exception e) {}
    }
    c.state=20;
  }
  if (c.state==15 && c.Continue.hasClicked() && c.userType==0 && selectedClass!=null) {
    c.ToggleAll(false);
    DineTests = c.getTestsPerClass((int)selectedClass);
    for (int i=0; i<DineTests.size(); i++) {
      c.testsProcent.put(DineTests.get(i), c.getUserResults(c.getTestID(DineTests.get(i)), c.userID));
    }
    DinValgteKlasseNavn = (String)selectedClassName;
    c.ToggleTeacherTests(false);
    c.state=14;
  }

  if ((c.state == 3|| c.state==30) && c.SeeTestAnswers.hasClicked() && c.userType == 1) {
    background(0, 0, 139);
    c.ToggleAll(false);
  }

  if ((c.state == 3|| c.state == 30|| c.state==5 || c.state == 20) && c.CreateClass.hasClicked() && c.userType == 1) {
    c.state=31;
    background(0, 0, 139);
    c.ToggleAll(false);
    c.ToggleCreateClass(true);
  }

  if ((c.state == 3 || c.state == 2 || c.state == 4) && c.ViewClasses.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    textSize(50);
    c.state = 3;
  }

  if ((c.state == 2 || c.state==3|| c.state == 4|| c.state==30) && c.viewTests.hasClicked() && c.userType == 0) {
    background(0, 0, 139);
    textSize(50);
    c.AssignedTests();
    c.state = 2;
  }
  if (c.state == 9 && (c.next.hasClicked() || c.previous.hasClicked())) {
    if (c.next.hasClicked() && c.CurrentQID<c.a.size()-1) {
      c.CurrentQID += 1;
      background(0, 0, 159);
    }
    if (c.previous.hasClicked() && c.CurrentQID>0) {
      c.CurrentQID -= 1;
      background(0, 0, 159);
    }
  }
  if (c.state == 9) {
    if (c.CurrentQID == c.a.size()-1) {
      c.next.text = "F??rdig";
    } else {
      c.next.text = "Naeste";
    }
  }
  if (c.state == 9 && c.question.mousepressed()) {
    String userAns = c.question.mousePress();
    if (userAns != null) {
      c.question.userAns = userAns;
      c.besvaredeTest.add(c.question);
    }
    if (c.CurrentQID<c.a.size() && userAns != null) {
      c.CurrentQID += 1;
      background(0, 0, 159);
    }
    if (c.CurrentQID == c.a.size()) {
      float antalKorrekt = 0;
      for (int i=0; i<c.besvaredeTest.size(); i++) {
        spg l = c.besvaredeTest.get(i);
        c.insertUserAnswer(l.userAns, int(l.id), c.userID );
        if (l.userAns.equals(l.correctAns) == true) {
          antalKorrekt += 1;
        }
      }
      procentCorrect = int((antalKorrekt/c.besvaredeTest.size())*100);
      spg y = c.besvaredeTest.get(0);
      c.insertUserResults((str(procentCorrect)+"%"), c.getTestID(int(y.id)));
      c.state = 10;
      c.besvaredeTest.clear();
    }
  }

  if (c.state == 2) {
    for (int i=0; i<c.test_knapper.size(); i++) {
      Button b = c.test_knapper.get(i);
      if (b.hasClicked()) {
        c.getTestAnswer(c.getTestID(b.text));
        background(0, 0, 139);
        c.state = 9;
      }
    }
  }

  if (c.state==5 && c.Continue.hasClicked() && selectedTest!=null) {
    DinValgteTestNavn = (String)selectedTestName;
    DinValgteTest = (int)selectedTest;
    DinValgteKlasse = (int)selectedClass;
    elevBesvarelse = c.getUsersFromClass(DinValgteKlasse);

    for (int i=0; i<elevBesvarelse.size(); i++) {
      try {
        c.elever.put(c.getUserName(int(elevBesvarelse.get(i))), c.getUserResults((int)selectedTest, int(elevBesvarelse.get(i))));
      }
      catch(Exception e) {}
    }

    c.ToggleTeacherTests(false);
    c.state=6;
  }
  if ((c.state==3|| c.state==30|| c.state==5 || c.state==20) && c.CreateTest.hasClicked()) {
    c.ToggleAll(false);
    c.ToggleCreateNewTest(true);
    c.state=13;
  }

  if (c.state==8 && c.NytSpg.hasClicked()) {
    String question = cp5.get(Textfield.class, "Sp??rgsm??l").getText();
    String forstsporgsmal = cp5.get(Textfield.class, "1 svar").getText();
    String Andetsporgsmal = cp5.get(Textfield.class, "2 svar").getText();
    String Tredjesporgsmal = cp5.get(Textfield.class, "3 svar").getText();
    String Fjerdesporgsmal = cp5.get(Textfield.class, "4 svar").getText();
    int status = int(cp5.get(Textfield.class, "Det rigtige svar skriv 1-4").getText());
    int questionNR = int(cp5.get(Textfield.class, "Sp??rgsm??l NR").getText());
    c.createQuestionAnswer(question, forstsporgsmal, Andetsporgsmal, Tredjesporgsmal, Fjerdesporgsmal, questionNR, status, testNavn);
    cp5.get(Textfield.class, "Sp??rgsm??l").clear();
    cp5.get(Textfield.class, "1 svar").clear();
    cp5.get(Textfield.class, "2 svar").clear();
    cp5.get(Textfield.class, "3 svar").clear();
    cp5.get(Textfield.class, "4 svar").clear();
    cp5.get(Textfield.class, "Det rigtige svar skriv 1-4").clear();
    cp5.get(Textfield.class, "Sp??rgsm??l NR").clear();
  }

  if (c.state == 8 && c.done.hasClicked()) {
    c.ToggleAll(false);
    c.ToggleCreateQuestion(false);
    c.state = 3;
  }

  if (c.state == 20 && c.Tildel.hasClicked()) {
    int Klassekode = (int)selectedClass;
    String testID = (String)selectedTestID;
    String testNavn = (String)selectedTestNavn;
    c.assignTest(testID, Klassekode, testNavn);
    c.state = 3;
  }
  if (c.state == 10 && c.tilbage.hasClicked()) {
    c.state = 3;
  }
}

void DineKlasser (int index) {
  selectedClass = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("value");
  selectedClassName = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("name");
}

void DinKlassesTests (int index) {
  selectedTest = cp5.get(ScrollableList.class, "DinKlassesTests").getItem(index).get("value");
  selectedTestName = cp5.get(ScrollableList.class, "DinKlassesTests").getItem(index).get("name");
}

void DineTest (int index) {
  selectedTestID = cp5.get(ScrollableList.class, "DineTest").getItem(index).get("value");
  selectedTestNavn = cp5.get(ScrollableList.class, "DineTest").getItem(index).get("name");
}
