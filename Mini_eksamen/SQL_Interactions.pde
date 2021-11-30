
class SQL {
  String signingSalt = "sQLLlerkk4221€€))";
  String getUser(String userName) {
    db_users.query("SELECT userName FROM Users WHERE userName='"+ userName + "'");
    String username = db_users.getString("userName");
    if (username != null) {
      return username;
    } else {
      return "";
    }
  }

  String getUserType(String userName) {
    db_users.query("SELECT Stilling FROM users WHERE userName='"+ userName + "'");
    int userType = db_users.getInt("Stilling");
    if (userType == 0)return "Elev";
    else return "Lærer";
  }

  int getUserId(String userName) {
    db_users.query("SELECT ID FROM users WHERE userName='"+ userName + "'");
    int userId = db_users.getInt("ID");
    return userId;
  }

  String getPassword(String userName) {
    db_users.query("SELECT password FROM users WHERE Username='"+ userName + "'");
    String userPassword = db_users.getString("Password");
    return userPassword;
  }

  void createUser(String userName, String password, int type) {
    password = hash(password);
    db_users.query("INSERT INTO users VALUES ('"+ userName + "', '"+ password + "'," + type +", null)");
  }

  void userJoinClass(int userId, String classID) {
    db_users.query("INSERT INTO 'Elev-tilknytning' VALUES ('"+classID+"', " + userId + ")");
  }

  boolean login(String userName, String password) {
    password = hash(password);
    if (getUser(userName) == "") return false;
    //text("user does not exist", width/2, height/10);
    if (password.equals(getPassword(userName))) return true;
    else return false;
  }

  void createClass(String className, int techerId) {
    int classId = int(random(100000, 999999+1));
    db_users.query("INSERT INTO Klasser VALUES ('" + className + "', " + classId + ", null, " + techerId + ")");
  }

  String getClassID(String className) {
    db_users.query("SELECT ID FROM Klasser WHERE Klassenavn='" + className + "'");
    String classId = str(db_users.getInt("ID"));
    return classId;
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
