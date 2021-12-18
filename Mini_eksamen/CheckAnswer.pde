class CheckAnswer {
  int correct = 0;
  int wrong = 0;
  String CorrectAnswer;
  String StudentAnswer;
  
  Boolean answerStatus(String StudentAnswer, String CorrectAnswer){
    if (StudentAnswer==CorrectAnswer) return true;
    if (StudentAnswer!=CorrectAnswer) return false; 
    else return false;  
  }
  
  void CorrectAnswer(int questionID){
    db.query("SELECT Svar FROM Sporgsmal where Sporgsmal.ID=" +questionID);
    
  }
  
  void StudentAnswer(int questionID){
   db.query("SELECT Elevsvar FROM Elevsvar where Elevsvar.SporgsmalID=" +questionID); 
    
  }
  
}
