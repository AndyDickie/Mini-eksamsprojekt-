void Show_Password() {
    if (passMode == true) {
      passMode = false;
      pass_field.setPasswordMode(passMode);
    } else {
      passMode = true;
      pass_field.setPasswordMode(passMode);
    }
  }

  void Create_User() {
    String userName = cp5.get(Textfield.class, "Username").getText();
    String password = cp5.get(Textfield.class, "Password").getText();
    int type = int(cp5.get(Toggle.class, "Teacher/Student").getValue());
    println(type);
    c.createUser(userName, password, type);
  }

  void Login() {
    String userName = cp5.get(Textfield.class, "Username").getText();
    String password = cp5.get(Textfield.class, "Password").getText();
    println(" textInput 1 = " + userName);
    println(" textInput 2 = " + password);
    println();
    if (c.login(userName, password)) {
      user = c.getUser(userName);
      c.ToggleLogin(false);
      c.state = 1;
    } else {
      println("Something went wrong, try again!");
    }
  }
