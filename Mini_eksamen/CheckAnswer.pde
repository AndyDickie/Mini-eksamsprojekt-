class CheckAnswer {
  int correct = 0;
  int wrong = 0;
  String CorrectAnswer;
  String StudentAnswer;

  Boolean answerStatus(String StudentAnswer, String CorrectAnswer) {
    if (StudentAnswer==CorrectAnswer) return true;
    if (StudentAnswer!=CorrectAnswer) return false;
    else return false;
  }

  String StudentAnswer(int questionID, int userID) {
    db.query("SELECT Svar,Elevsvar,UsernameID FROM Sporgsmal,Elevsvar Where Sporgsmal.ID=" +questionID+ " AND Elevsvar.SporgsmalID="+questionID+" AND Elevsvar.UsernameID="+userID);
    return db.getString("Elevsvar");
  }

  String CorrectAnswer(int questionID, int userID) {
    db.query("SELECT Svar,Elevsvar,UsernameID FROM Sporgsmal,Elevsvar Where Sporgsmal.ID=" +questionID+ " AND Elevsvar.SporgsmalID="+questionID+" AND Elevsvar.UsernameID="+userID);
    return db.getString("Svar");
  }
