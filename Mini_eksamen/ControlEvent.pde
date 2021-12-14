void controlEvent(ControlEvent theEvent) {
  if (theEvent.getName() == "Login") {
    println("login er asdasdw");
    String userName = cp5.get(Textfield.class, "Username").getText();
    String password = cp5.get(Textfield.class, "Password").getText();
    println(" textInput 1 = " + userName);
    println(" textInput 2 = " + password);
    println();
    println("test");
    if (password != null && c.login(userName, password)) {
      user = c.getUser(userName);
      c.userName = userName;
      c.state = 3;
      c.ToggleLogin(false);
    } else {
      println("Something went wrong, try again!");
    }
  }
  if (theEvent.getName() == "Create User") {
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
  if (theEvent.getName() == "") {
  }
  if (theEvent.getName() == "") {
  }
}
