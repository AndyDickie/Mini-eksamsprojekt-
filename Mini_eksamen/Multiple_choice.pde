
class AnswerFunction {
Button first, second, third, fourth;   
 String Førstspørgsmål = "Diller"; 
 String Andetspørgsmål = "Tissemand"; 
 String Tredjespørgsmål = "Jeiner";
 String Fjerdespørgsmål = "Pullermand";
 
 AnswerFunction(){
  
  first = new Button(187.5,height-height/4,175,100, Førstspørgsmål);
  second = new Button(187.5+175+33.3,height-height/4,175,100,Andetspørgsmål);
  third = new Button(187.5+175+33.3+175+33.3,height-height/4,175,100,Tredjespørgsmål);
  fourth = new Button(187.5+175+33.3+175+33.3+175+33.3,height-height/4,175,100,Fjerdespørgsmål);
 }
  
  
  
void display(){
  first.display();
  second.display();
  third.display();
  fourth.display();
  
}

}
