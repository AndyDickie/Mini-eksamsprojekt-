void mouseReleased() {
  if (c.state == 0 && c.Login1.hasClicked() == true) {
    c.ToggleLogin(true);
    c.state = 1;
  }
  
  if (c.state == 0 && c.Register.hasClicked() == true) {
    c.ToggleRegister(true);
    c.state = 1;
  }
  
  if (c.Home.hasClicked() == true) {
    c.ToggleAll(false);
    c.state = 0;
  }

  if (c.state == 3 && c.JoinClass.hasClicked()) {
    //c.ToggleLogin(false);
    c.ToggleClass(true); 
    //c.ToggleAll(true);
    //c.ToggleLogin(false);
    //c.ToggleRegister(false);
    
    //class_id = cp5.addTextfield("ClassID").setPosition(width/2, height/3).setSize(200, 40).setAutoClear(false).setFont(f);
    //join_class = cp5.addBang("Join_Class").setPosition(width/2+210, height/3).setSize(80, 40);
    c.state = 4;
  }
}
