Object selectedClass, selectedTest;
String DinValgteTest;

void mouseReleased() {
  if (c.state == 0 && c.Login.hasClicked() == true) {
    c.ToggleLogin(true);
    c.state = 1;
  }

  if (c.state == 0 && c.Register.hasClicked() == true) {
    c.ToggleRegister(true);
    c.state = 1;
  }

  if (c.StartupPage.hasClicked() == true && c.state == 1 || c.StartupPage.hasClicked() == true && c.state == 2) {
    c.ToggleAll(false);
    c.state = 0;
  }

  if (c.state == 3 && c.JoinClass.hasClicked() && c.userType == 0) {
    background(0);
    c.ToggleAll(false);
    c.ToggleClass(true);
    c.state = 4;
  }

  if (c.state == 3 && c.SeeTestAnswers.hasClicked() && c.userType == 1) {
    background(0);
    c.ToggleAll(false);
  }
  if (c.state == 3 && c.SeeTestAnswers.hasClicked()) {
    c.ToggleTeacherTests(true);
    StringList klasseliste = c.getTeacherClasses(5);
    for (int i =0; i<klasseliste.size(); i++) {
      teacherClass.addItem(klasseliste.get(i), c.getClassCode(klasseliste.get(i)));
    }
    c.state = 5;
  }
  if (c.state == 3 && c.CreateClass.hasClicked() && c.userType == 1) {
    background(0);
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
  if (c.state == 3 && c.ViewClasses.hasClicked() && c.userType == 0) {
    StringList k = c.getUserClasses(c.getUserId(c.userName));
    println(k);
    for (int i=0; i<k.size(); i++) {
      try {
        text(k.get(i), width/2, height/20*(i+1)+150);
      }
      catch (Exception e) {
      }
    }
  }

  if (c.state==5 && c.Continue.hasClicked() && selectedTest!=null) {
    DinValgteTest = (String)selectedTest;
    c.ToggleTeacherTests(false);
    c.state=6;
  }
}



void DineKlasser (int index) {
  selectedClass = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("value");
  println(selectedClass);
}

void DinKlassesTests (int index) {
  selectedTest = cp5.get(ScrollableList.class, "DinKlassesTests").getItem(index).get("name");
  println(selectedTest);
}
