void controlEvent(ControlEvent theEvent) {
  if (theEvent.getName() == "Login") {
    background(0, 0, 139);
    String userName = cp5.get(Textfield.class, "Brugernavn").getText();
    String password = cp5.get(Textfield.class, "Kodeord").getText();
    if (password != null && c.login(userName, password)) {
      user = c.getUser(userName);
      c.userName = userName;
      c.userType = int(c.getUserType(c.userName));
      c.userID = c.getUserId(c.userName);
      c.state = 3;
      c.ToggleLogin(false);
      c.ToggleAll(false);
    } else {
      textSize(20);
      fill(255);
      text("Der skete en fejl, prøv igen", width/2, height-100);
    }
  }
  if (theEvent.getName() == "Skab bruger") {
    background(0, 0, 139);
    String userName = cp5.get(Textfield.class, "Brugernavn").getText();
    String password = cp5.get(Textfield.class, "Kodeord").getText();
    int type = int(cp5.get(Toggle.class, "Laerer/Elev").getValue());
    if (password != "" && userName != "") {
      c.createUser(userName, password, type);
      cp5.get(Textfield.class, "Brugernavn").clear();
      cp5.get(Textfield.class, "Kodeord").clear();
      textSize(20);
      fill(255);
      println("Sucessfuldt");
      text("Bruger oprettet succesfuldt", width/2, height-100);
    } else {
      textSize(20);
      fill(255);
      println("Der skete en fejl, prøv igen");
      text("Der skete en fejl, prøv igen", width/2, height-100);
    }
  }
  if (theEvent.getName() == "Tilslut klasse") {
    background(0, 0, 139);
    String classID = cp5.get(Textfield.class, "Klasse kode").getText();
    try {
      c.userJoinClass(c.getUserId(c.userName), classID);
      c.ToggleClass(false);
      c.state = 3;
    }
    catch(Exception e) {
    }
  }
  if (theEvent.getName() == "Vis kodeord") {
    Textfield pass = cp5.get(Textfield.class, "Kodeord");
    passMode = !passMode;
    pass.setPasswordMode(passMode);
  }

  if (theEvent.getName() == "Skab klasse") {
    background(0, 0, 139);
    String className = cp5.get(Textfield.class, "Klasse navn").getText();
    try {
      c.createClass(className, c.getUserId(c.userName));
      c.ToggleAll(false);
    }
    catch(Exception e) {
    }
    c.state=3;
  }
}
