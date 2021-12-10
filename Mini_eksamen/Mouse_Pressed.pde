void mouseReleased() {
  println("ttt");
  println(c.state);
  if (c.state == 0 && c.Login.hasClicked() == true) {
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
}
