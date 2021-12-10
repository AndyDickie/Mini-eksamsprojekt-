void Create_User() {
  String userName = cp5.get(Textfield.class, "Username").getText();
  String password = cp5.get(Textfield.class, "Password").getText();
  int type = int(cp5.get(Toggle.class, "Teacher/Student").getValue());
  println(type);
  if (password != "" && userName != "") {
    c.createUser(userName, password, type);
    c.ToggleRegister(false);
    c.state = 0;
  } else {
    println("Something went wrong, try again!");
  }
}

void LoginTest() {
  String userName = cp5.get(Textfield.class, "Username").getText();
  String password = cp5.get(Textfield.class, "Password").getText();
  println(" textInput 1 = " + userName);
  println(" textInput 2 = " + password);
  println();
  println("test");
  if (c.login(userName, password)) {
    user = c.getUser(userName);
    c.userName = userName;
    c.state = 3;
    c.ToggleLogin(false);
  } else {
    println("Something went wrong, try again!");
  }
}

void Join_Class() {
  String classID = cp5.get(Textfield.class, "ClassID").getText();
  try {
    c.userJoinClass(c.getUserId(c.userName), classID);
    c.ToggleClass(false);
    c.state = 3;
  }
  catch(Exception e) {
    print(e);
    println("Something went wrong");
  }
}
