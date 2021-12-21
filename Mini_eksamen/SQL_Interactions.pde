class SQL {
  String signingSalt = "sQLLlerkk4221€€))";

  String getUser(String userName) {
    db.query("SELECT userName FROM Users WHERE userName='"+ userName + "'");
    String username = db.getString("userName");
    if (username != null) {
      return username;
    } else {
      return "";
    }
  }

  String getUserName(int userID) {
    db.query("SELECT userName FROM Users WHERE ID='"+ userID + "'");
    String username = db.getString("Username");
    return username;
  }


  int getUserType(String userName) {
    db.query("SELECT Stilling FROM users WHERE userName='"+ userName + "'");
    int userType = db.getInt("Stilling");
    return userType;
  }

  int getUserId(String userName) {
    db.query("SELECT ID FROM users WHERE userName='"+ userName + "'");
    int userId = db.getInt("ID");
    return userId;
  }

  String getPassword(String userName) {
    db.query("SELECT password FROM users WHERE Username='"+ userName + "'");
    String userPassword = db.getString("Password");
    return userPassword;
  }

  void createUser(String userName, String password, int type) {
    password = hash(password);
    db.query("INSERT INTO users VALUES ('"+ userName + "', '"+ password + "'," + type +", null)");
  }

  void userJoinClass(int userId, String classID) {
    if (getClassName(int(classID)) != null) {
      db.query("INSERT INTO 'Elev-tilknytning' VALUES ('"+classID+"', " + userId + ")");
    } else {
      println("FEJL");
    }
  }

  boolean login(String userName, String password) {
    password = hash(password);
    if (getUser(userName) == "") return false;
    if (password.equals(getPassword(userName))) return true;
    else return false;
  }

  void createClass(String className, int teacherId) {
    int classId = int(random(100000, 999999+1));
    db.query("INSERT INTO Klasser VALUES ('" + className + "', " + classId + ", null, " + teacherId + ")");
  }

  int getClassCode(String className) {
    db.query("SELECT Klassekode FROM Klasser WHERE Klassenavn='" + className + "'");
    int classCode = db.getInt("Klassekode");
    return classCode;
  }


  int getClassID(String className) {
    db.query("SELECT ID FROM Klasser WHERE Klassenavn='" + className + "'");
    int classId = db.getInt("ID");
    return classId;
  }

  String getClassName(int classId) {
    db.query("SELECT Klassenavn FROM Klasser WHERE Klassekode=" + classId);
    return db.getString("Klassenavn");
  }

  StringList getUserClasses(int userID) {
    StringList KlasseListe = new StringList();
    IntList KlasseKListe = new IntList();
    String s = "SELECT Klassecode FROM \"Elev-tilknytning\" WHERE UsernameID='" + userID + "'";
    String kc = "Klassecode";
    db.query(s);
    while (db.next()) {
      int ting = db.getInt(kc);
      KlasseKListe.append(ting);
    }
    for (int i=0; i < KlasseKListe.size(); i++) {
      KlasseListe.append(getClassName(KlasseKListe.get(i)));
    }
    return KlasseListe;
  }


  StringList getTests() {
    String s = "SELECT ID FROM Test WHERE IDkey='" + c.userID + "'";
    db.query(s);
    StringList o = new StringList();
    while (db.next()) {
      String ting = str(db.getInt("ID"));
      o.append(ting);
    }
    for (int i=0; i<o.size(); i++) {
      for (int j=i+1; j<o.size(); j++) {
        if (o.get(i).equals(o.get(j))==true) {
          o.remove(j);
          j--;
        }
      }
    }
    return o;
  }
  StringList getTestName() {
    String s = "SELECT Navn FROM Test WHERE IDkey='" + c.userID + "'";
    db.query(s);
    StringList o = new StringList();

    while (db.next()) {
      String ting = db.getString("Navn");
      o.append(ting);
    }
    for (int i=0; i<o.size(); i++) {
      for (int j=i+1; j<o.size(); j++) {
        if (o.get(i).equals(o.get(j))==true) {
          o.remove(j);
          j--;
        }
      }
    }
    return o;
  }

  StringList getUsersFromClass(int classID) {
    String s = "SELECT UsernameID FROM \"Elev-tilknytning\" WHERE Klassecode='" + classID + "'";
    db.query(s);
    StringList o = new StringList();
    while (db.next()) {
      String ting = db.getString("UsernameID");
      o.append(ting);
    }
    return o;
  }

  void createTest(String testName) {
    db.query("INSERT INTO Test VALUES('"+c.userID+"', '" + testName + "', null, " + int(random(0, 100000)) + ")");
  }
  void assignTest(String testID, int classCode, String testName) {
    db.query("INSERT INTO Test VALUES("+c.userID+", '" + testName + "', '"+ classCode + "', " + testID + ")");
  }

  void createQuestionAnswer(String question, String forstsporgsmal, String Andetsporgsmal, String Tredjesporgsmal, String Fjerdesporgsmal, int status, int questionNR, String testName) {
    db.query("INSERT INTO Sporgsmal VALUES ('" + question + "','" + forstsporgsmal + "','" + Andetsporgsmal + "','" + Tredjesporgsmal + "','" + Fjerdesporgsmal + "','"+questionNR+"','"+status+"', null,'"+c.getTestID(testName)+"')");
  }


  int getTestID(String testName) {
    db.query("SELECT ID FROM Test WHERE Navn='" + testName + "'");
    int testID = db.getInt("ID");
    return testID;
  }
  int getTestID(int SpgID) {
    db.query("SELECT TestID FROM Sporgsmal WHERE ID='" + SpgID + "'");
    int testID = db.getInt("TestID");
    return testID;
  }

  StringList getTeacherClasses(int userID) {
    StringList KlasseListe = new StringList();
    String s = "SELECT Klassenavn FROM Klasser WHERE LærerID="+ userID;
    db.query(s);
    while (db.next()) {
      KlasseListe.append(db.getString("Klassenavn"));
    }
    return KlasseListe;
  }

  StringList getTestsPerClass(int Klassekode) {
    StringList TestListe = new StringList();
    String s = "SELECT Navn FROM Test WHERE Klassekode="+ Klassekode;
    db.query(s);
    while (db.next()) {
      TestListe.append(db.getString("Navn"));
    }
    for (int i=0; i<TestListe.size(); i++) {
      for (int j=i+1; j<TestListe.size(); j++) {
        if (TestListe.get(i).equals(TestListe.get(j))==true) {
          TestListe.remove(j);
          j--;
        }
      }
    }
    return TestListe;
  }

  void insertUserAnswer(String UserAnswer, int questionID, int userID ) {
    db.query("INSERT INTO Elevsvar VALUES (null, '"+ questionID +"', '"+userID+"', '"+ UserAnswer+ "')");
  }

  void insertUserResults(String results, int TestID) {
    db.query("INSERT INTO Resultater VALUES ("+ TestID + ", " + c.userID + ", '"+ results+"')");
  }

  void getuserAnswer(int userID) {
    db.query("SELECT * FROM Elevsvar Where UsernameID = " + userID);
  }

  String getUserResults(int testID, int userID) {
    db.query("SELECT Resultat FROM Resultater WHERE testID="+testID+" AND UsernameID="+userID);
    return db.getString("Resultat");
  }

  ArrayList getTestAnswer(int testID) {
    db.query("SELECT Svar1, Svar2, Svar3, Svar4, Status, ID, Sporgsmal FROM Sporgsmal WHERE TestID =" +testID);
    StringList k = new StringList();
    c.a = new ArrayList<testAns>();
    testAns h;
    while (db.next()) {
      k.append(db.getString("Svar1"));
      k.append(db.getString("Svar2"));
      k.append(db.getString("Svar3"));
      k.append(db.getString("Svar4"));
      k.append(db.getString("Status"));
      k.append(db.getString("ID"));
      k.append(db.getString("Sporgsmal"));
      h = new testAns(k.get(0), k.get(1), k.get(2), k.get(3), k.get(4), k.get(5), k.get(6));
      c.a.add(h);
      k.clear();
    }
    return c.a;
  }

  void getQuestionAnswer(int questionID) {
    db.query("SELECT * FROM Elevsvar Where SporgsmalID = " + questionID );
  }

  void AssignedTests() {
    c.test_knapper.clear();
    StringList o = c.getUserClasses(c.userID);
    for (int i=0; i<o.size(); i++) {
      StringList m = c.getTestsPerClass(c.getClassCode(o.get(i)));
      for (int j=0; j<m.size(); j++) {
        String s = m.get(j);
        Button b = new Button(width/2, 2*height/10+50*j, 150, 50, s);
        c.test_knapper.add(b);
      }
    }
  }

  String hash(String input) {
    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      String inputText = input + signingSalt;
      md.update(inputText.getBytes());
      byte[] byteList = md.digest();

      StringBuffer hashedValueBuffer = new StringBuffer();
      for (byte b : byteList)hashedValueBuffer.append(hex(b));
      return hashedValueBuffer.toString();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
    return null;
  }

  Boolean answerCorrect(int questionID, int userID) {
    db.query("SELECT Svar,Elevsvar,UsernameID FROM Sporgsmal,Elevsvar Where Sporgsmal.ID=" +questionID+ " AND Elevsvar.SporgsmalID="+questionID+" AND Elevsvar.UsernameID="+userID);
    String rigtigtSvar = db.getString("Svar");
    String elevSvar = db.getString("Elevsvar");
    if (rigtigtSvar==elevSvar)return true;
    else return false;
  }
}
