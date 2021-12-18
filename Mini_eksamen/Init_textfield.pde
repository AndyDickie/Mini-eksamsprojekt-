Bang create_user, join_class;
Button show_password, login;
Textfield username_field, pass_field, class_id;
Toggle type;
ScrollableList teacherTests, teacherClass;

class Init extends SQL {
  void toggle(String controller, boolean vis) {
    if (vis) {
      cp5.getController(controller).show();
    } else {
      cp5.getController(controller).hide();
    }
  }
  void load() {
    //Join class bang & textfield
    class_id = cp5.addTextfield("ClassID").setPosition(width/2, height/3).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    cp5.addButton("Join Class").setPosition(width/2+220, height/3).setSize(80, 40).setVisible(false);

    //login bangs
    cp5.addButton("Show Password").setPosition(width/2+110, height/2-80).setSize(80, 40).setVisible(false);
    cp5.addButton("Login").setPosition(width/2+110, height/2-200).setSize(80, 40).setVisible(false);

    //textfields
    username_field = cp5.addTextfield("Username").setPosition(width/2-100, height/2-200).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    username_field.setFocus(false);
    pass_field = cp5.addTextfield("Password").setPosition(width/2-100, height/2-120).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    pass_field.setFocus(false);
    pass_field.setPasswordMode(passMode);

    //Scrollable list
    teacherTests = cp5.addScrollableList("DinKlassesTests").setPosition(width/2+50, 100).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);
    teacherClass = cp5.addScrollableList("DineKlasser").setPosition(50, 100).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);

    //create user bangs
    cp5.addButton("Create User").setPosition(width/2+110, height/2-140).setSize(80, 40).setVisible(false);
    type = cp5.addToggle("Teacher/Student").setPosition(width/2+110, height/2-240).setSize(80, 40).setValue(false).setMode(ControlP5.SWITCH).setVisible(false);
<<<<<<< Updated upstream
    println("load");
    
    //Create class textfield
    cp5.addTextfield("Class Name").setPosition(width/2-100, height/2).setSize(200,40).setFont(f).setVisible(false);
    cp5.addButton("Create Class").setPosition(width/2+110, height/2).setSize(80,40).setVisible(false);
=======
    println("load");    
>>>>>>> Stashed changes
  }

  void ToggleLogin(boolean vis) {
    toggle("Username", vis);
    toggle("Password", vis);
    toggle("Show Password", vis);
    toggle("Login", vis);
  }

  void ToggleTeacherTests(boolean vis) {
    println("Toggle TeacherTestList");
    if (vis) {
      cp5.getController("DinKlassesTests").show();
      cp5.getController("DineKlasser").show();
    } else {
      cp5.getController("DinKlassesTests").hide();
      cp5.getController("DineKlasser").hide();
    }
  }

  void ToggleRegister(boolean vis) {
    toggle("Create User", vis);
    toggle("Teacher/Student", vis);
    toggle("Username", vis);
    toggle("Password", vis);
  }

  void ToggleClass(boolean vis) {
    //cp5.getController("Join Class").setVisible(vis);
    //cp5.getController("ClassID").setVisible(vis);
    toggle("Join Class", vis);
    toggle("ClassID", vis);
  }
  
  void ToggleCreateClass(boolean vis){
    toggle("Class Name", vis);
    toggle("Create Class", vis);
  }

  void ToggleAll(boolean vis) {
    toggle("Username", vis);
    toggle("Password", vis);
    toggle("Show Password", vis);
    toggle("Login", vis);
    toggle("Create User", vis);
    toggle("Teacher/Student", vis);
    toggle("Join Class", vis);
    toggle("ClassID", vis);
    toggle("Class Name", vis);
    toggle("Create Class", vis);
  }
}
