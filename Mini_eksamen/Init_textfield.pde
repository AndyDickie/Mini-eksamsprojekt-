Bang create_user, join_class;
Button show_password, login, nestespg;
Textfield username_field, pass_field, class_id, forstspg, andetspg, tredjespg, fjerdespg, spg;
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
    cp5.addButton("Nyt spoergsmaal").setPosition(75,300).setSize(150,50).setVisible(false);
    cp5.setColorBackground(color(128));
    cp5.setColorForeground(color(105));
    
    //textfields
    username_field = cp5.addTextfield("Username").setPosition(width/2-100, height/2-200).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    username_field.setFocus(false);
    pass_field = cp5.addTextfield("Password").setPosition(width/2-100, height/2-120).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    pass_field.setFocus(false);
    pass_field.setPasswordMode(passMode);
    
    forstspg = cp5.addTextfield("1 svar").setPosition(629.1, 365).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    forstspg.setFocus(false);
    forstspg.setColorBackground(color(255));
    forstspg.setColorForeground(128);
    forstspg.setColorValueLabel(0);
    andetspg = cp5.addTextfield("2 svar").setPosition(629.1, 450).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    andetspg.setFocus(false);
    andetspg.setColorBackground(color(255));
    andetspg.setColorForeground(128);
    andetspg.setColorValueLabel(0);
    tredjespg = cp5.addTextfield("3 svar").setPosition(629.1, 535).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    tredjespg.setFocus(false);
    tredjespg.setColorBackground(color(255));
    tredjespg.setColorForeground(128);
    tredjespg.setColorValueLabel(0);
    fjerdespg = cp5.addTextfield("4 svar").setPosition(629.1, 620).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    fjerdespg.setFocus(false);
    fjerdespg.setColorBackground(color(255));
    fjerdespg.setColorForeground(128);
    fjerdespg.setColorValueLabel(0);
    spg = cp5.addTextfield("Spørgsmål").setPosition(75, 365).setSize(500, 50).setAutoClear(false).setFont(f).setVisible(false);
    spg.setFocus(false);
    spg.setColorBackground(color(255));
    spg.setColorForeground(128);
    spg.setColorValueLabel(0);
    
    //Scrollable list
    teacherTests = cp5.addScrollableList("DinKlassesTests").setPosition(width/2+50, 100).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);
    teacherClass = cp5.addScrollableList("DineKlasser").setPosition(50, 100).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);

    //create user bangs
    cp5.addButton("Create User").setPosition(width/2+110, height/2-140).setSize(80, 40).setVisible(false);
    type = cp5.addToggle("Teacher/Student").setPosition(width/2+110, height/2-240).setSize(80, 40).setValue(false).setMode(ControlP5.SWITCH).setVisible(false);
    
    //Create class textfield
    cp5.addTextfield("Class Name").setPosition(width/2-100, height/2).setSize(200,40).setFont(f).setVisible(false);
    cp5.addButton("Create Class").setPosition(width/2+110, height/2).setSize(80,40).setVisible(false);
    println("load");    
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
  
  void ToggleCreateQuestion(boolean vis){
    toggle("1 svar",vis);
    toggle("2 svar", vis);
    toggle("3 svar", vis);
    toggle("4 svar", vis);
    toggle("Spørgsmål",vis);
    toggle("Nyt spoergsmaal", vis);
  }
  
  
}
