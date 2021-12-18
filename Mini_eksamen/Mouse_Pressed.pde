Object selected;

void mouseReleased() {
  if (c.state == 0 && c.Login.hasClicked() == true) {
    c.ToggleLogin(true);
    c.state = 1;
  }
  
  if (c.state == 0 && c.Register.hasClicked() == true) {
    c.ToggleRegister(true);
    c.state = 1;
  }
  
  if (c.StartupPage.hasClicked() == true && c.state == 1 || c.StartupPage.hasClicked() == true && c.state == 2) {
    c.ToggleAll(false);
    c.state = 0;
  }

  if (c.state == 3 && c.JoinClass.hasClicked()) {
    c.ToggleClass(true); 
    c.state = 4;
  }
  
  if(c.state == 3 && c.SeeTestAnswers.hasClicked()){
    c.ToggleTeacherTests(true);
    StringList klasseliste = c.getTeacherClasses(5);
    for (int i =0; i<klasseliste.size();i++){
      teacherClass.addItem(klasseliste.get(i),c.getClassCode(klasseliste.get(i)));
    }
    
   
    c.state = 5;
    
  }
}


void DineKlasser (int index){
  selected = cp5.get(ScrollableList.class, "DineKlasser").getItem(index).get("value");
  println(selected);
}
