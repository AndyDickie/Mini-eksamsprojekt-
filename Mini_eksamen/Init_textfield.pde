Bang show_password, create_user, login;
Textfield username_field, pass_field;
Toggle type;

class Init extends SQL {
  void load() {
    //login bangs
    show_password = cp5.addBang("Show_Password").setPosition(width/2+110, height/2-80).setSize(80, 40).setVisible(false);
    login = cp5.addBang("Login").setPosition(width/2+110, height/2-200).setSize(80, 40).setVisible(false);

    //textfields
    username_field = cp5.addTextfield("Username").setPosition(width/2-100, height/2-200).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    pass_field = cp5.addTextfield("Password").setPosition(width/2-100, height/2-120).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);

    //create user bangs
    create_user = cp5.addBang("Create_User").setPosition(width/2+110, height/2-140).setSize(80, 40).setVisible(false);
    type = cp5.addToggle("Teacher/Student").setPosition(width/2+110, height/2-240).setSize(50, 20).setValue(false).setMode(ControlP5.SWITCH).setVisible(false);
    pass_field.setPasswordMode(passMode);
  }
  void ToggleLogin(boolean vis) {
    username_field.setVisible(vis);
    pass_field.setVisible(vis);
    login.setVisible(vis);
    show_password.setVisible(vis);
  }

  void ToggleRegister(boolean vis) {
    create_user.setVisible(vis);
    type.setVisible(vis);
    username_field.setVisible(vis);
    pass_field.setVisible(vis);
  }

  void ToggleAll(boolean vis) {
    username_field.setVisible(vis);
    pass_field.setVisible(vis);
    login.setVisible(vis);
    show_password.setVisible(vis);
    create_user.setVisible(vis);
    type.setVisible(vis);
  }
}
