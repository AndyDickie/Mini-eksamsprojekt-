
class AnswerFunction {
  
  Button first, second, third, fourth;   
  String forstsvar; 
  String Andetsvar; 
  String Tredjesvar;
  String Fjerdesvar;

  AnswerFunction() {

    first = new Button(187.5, height-height/4, 175, 100, forstsvar);
    second = new Button(187.5+175+33.3, height-height/4, 175, 100, Andetsvar);
    third = new Button(187.5+175+33.3+175+33.3, height-height/4, 175, 100, Tredjesvar);
    fourth = new Button(187.5+175+33.3+175+33.3+175+33.3, height-height/4, 175, 100, Fjerdesvar);
  }
  
  void display() {
    first.display();
    second.display();
    third.display();
    fourth.display();
  }
}
