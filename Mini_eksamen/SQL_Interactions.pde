
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

  int getUserType(String userName) {
    db.query("SELECT Stilling FROM users WHERE userName='"+ userName + "'");
    int userType = db.getInt("Stilling");
    //if (userType == 0)return "Elev";
    //else return "Lærer";
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
    if (getClassName(int(classID)) != null){
    db.query("INSERT INTO 'Elev-tilknytning' VALUES ('"+classID+"', " + userId + ")");
    }
    else {
      println("FEJL");
    }
  }

  boolean login(String userName, String password) {
    password = hash(password);
    if (getUser(userName) == "") return false;
    //text("user does not exist", width/2, height/10);
    if (password.equals(getPassword(userName))) return true;
    else return false;
  }

  void createClass(String className, int teacherId) {
    int classId = int(random(100000, 999999+1));
    db.query("INSERT INTO Klasser VALUES ('" + className + "', " + classId + ", null, " + teacherId + ")");
  }
  
  int getClassCode(String className){
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
      println(ting);
    }
    for (int i=0; i < KlasseKListe.size(); i++) {
      println(i);
      KlasseListe.append(getClassName(KlasseKListe.get(i)));
    }

    return KlasseListe;
  }

  void createTest(String testName) {
    db.query("INSERT INTO Test VALUES(null, '" + testName + "', )");
  }

  void createQuestionAnswer(int testID, String question, String answer) {
    db.query("INSERT INTO Sporgsmal VALUES ('" + testID + "','" + question + "','" + answer + "', null)");
  }

  int getTestID(String testName) {
    db.query("SELECT ID FROM Test WHERE Navn='" + testName + "'");
    int testID = db.getInt("ID");
    return testID;
  }
 
  StringList getTeacherClasses(int userID){
    StringList KlasseListe = new StringList();
    String s = "SELECT Klassenavn FROM Klasser WHERE LærerID="+ userID;
    db.query(s);
    while (db.next()){
      KlasseListe.append(db.getString("Klassenavn"));
    }
    return KlasseListe;
  }
 
  StringList getTestsPerClass(int Klassekode){
    StringList TestListe = new StringList();
    String s = "SELECT Navn FROM Test WHERE Klassekode="+ Klassekode;
    db.query(s);
    while(db.next()){
      TestListe.append(db.getString("Navn"));
    }
    return TestListe;
  }

  void insertUserAnswer(String UserAnswer, int questionID, int userID ){
    db.query("INSERT INTO Elevsvar VALUES (null, '"+ questionID +"', '"+userID+"', '"+ UserAnswer+ "')");
  }
  
  void getuserAnswer(int questionID, int userID){
    db.query("SELECT * FROM Elevsvar Where SporgsmalID = "+ questionID + " AND UsernameID = " + userID);
  }
  
  //Kan gøres nemmer ved at fjerne * og gøre det specifikt 
  void getTestAnswer(int testID){
    db.query("SELECT * FROM Elevsvar,Sporgsmal,Test Where Elevsvar.SporgsmalID=Sporgsmal.ID AND Sporgsmal.TestID=Test.ID AND Test.ID =" +testID);
  }
  
  void getQuestionAnswer(int questionID){
    db.query("SELECT * FROM Elevsvar Where SporgsmalID = " + questionID );
  }
  
  
  //String getQuestionName() {
  //}

  //String getQuestionAnswer() {
  //}

  //void addQuestion()


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
}
