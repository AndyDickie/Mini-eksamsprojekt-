Bang show_password, create_user, login;
Textfield username_field, pass_field;
Toggle type;

class Init extends SQL {
  void load() {
    show_password = cp5.addBang("Show_Password").setPosition(width/2+110, height/2-80).setSize(80, 40);
    create_user = cp5.addBang("Create_User").setPosition(width/2+110, height/2-140).setSize(80, 40);
    login = cp5.addBang("Login").setPosition(width/2+110, height/2-200).setSize(80, 40);

    username_field = cp5.addTextfield("Username").setPosition(width/2-100, height/2-200).setSize(200, 40).setAutoClear(false).setFont(f);
    pass_field = cp5.addTextfield("Password").setPosition(width/2-100, height/2-120).setSize(200, 40).setAutoClear(false).setFont(f);
    pass_field.setPasswordMode(passMode);
    type = cp5.addToggle("Teacher/Student").setPosition(40,250).setSize(50,20).setValue(false).setMode(ControlP5.SWITCH);
  }
  void ToggleLogin(boolean vis) {
    username_field.setVisible(vis);
    pass_field.setVisible(vis);
    login.setVisible(vis);
    show_password.setVisible(vis);
    create_user.setVisible(vis);
    type.setVisible(vis);
  }

  
}
