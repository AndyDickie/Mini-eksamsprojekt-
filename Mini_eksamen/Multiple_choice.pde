
class AnswerFunction {
  
  Button first, second, third, fourth;   
  String forstsporgsmal; 
  String Andetsporgsmal; 
  String Tredjesporgsmal;
  String Fjerdesporgsmal;

  AnswerFunction() {

    first = new Button(187.5, height-height/4, 175, 100, forstsporgsmal);
    second = new Button(187.5+175+33.3, height-height/4, 175, 100, Andetsporgsmal);
    third = new Button(187.5+175+33.3+175+33.3, height-height/4, 175, 100, Tredjesporgsmal);
    fourth = new Button(187.5+175+33.3+175+33.3+175+33.3, height-height/4, 175, 100, Fjerdesporgsmal);
  }
  
  void display() {
    first.display();
    second.display();
    third.display();
    fourth.display();
  }
}
