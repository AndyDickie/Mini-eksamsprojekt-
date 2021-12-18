class CheckAnswer {
  int correct = 0;
  int wrong = 0;
  String CorrectAnswer;
  String StudentAnswer;
  
  void AnswerSame(){
    if (StudentAnswer=CorrectAnswer){
    correct = +1;
    
    } else{
     wrong = +1; 
    }
  }
  
  ifT (wrong >= 1){
    println("answerwrong");
    
  }
  
  if (correct >= 1){
   println("answercorrect"); 
    
  }
  
}
