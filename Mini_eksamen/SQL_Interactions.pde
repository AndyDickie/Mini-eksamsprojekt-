
class SQL {
  String getUser(String userName) {
    db.query("SELECT userName FROM Users WHERE userName='"+ userName + "'");
    String username = db.getString("userName");
    if (username != null) {
      return username;
    } else {
      return "";
    }
  }

  String getUserType(String userName) {
    db.query("SELECT Stilling FROM users WHERE userName='"+ userName + "'");
    int userType = db.getInt("Stilling");
    if (userType == 0)return "Elev";
    else return "Lærer";
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
  
  void userJoinClass(int userId, String classID){
  //Insæt getUserId når funktionen skal kaldes
  db.query("UPDATE Klasser SET 'Username-ID'="+ userId +" WHERE Klassekode=" + classID);
  }

  boolean login(String userName, String password) {
    password = hash(password);
    if (getUser(userName) == "") return false;
      //text("user does not exist", width/2, height/10);
    if (password.equals(getPassword(userName))) return true;
    else return false;
  }
  
  void createClass(String className, int techerId){
    int classId = int(random(100000, 999999+1));
    db.query("INSERT INTO Klasser VALUES ('" + className + "', " + classId + ", null, null, " + techerId + ")");
  }
    
  
  
  //String getQuestionName() {
  //}

  //String getQuestionAnswer() {
  //}
  
  //void addQuestion()
  
  
  
}
