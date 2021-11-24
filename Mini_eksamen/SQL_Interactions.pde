SQLite db = new SQLite(this, "users.db" );
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

  //String getUserType() {
  //}

  //String getPassword() {
  //}

  //void createUser() {
  //}

  //String getQuestionName() {
  //}

  //String getQuestionAnswer() {
  //}
}
