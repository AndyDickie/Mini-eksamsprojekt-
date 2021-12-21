Bang create_user, join_class;
Button show_password, login, nestespg;
Textfield username_field, pass_field, class_id, forstspg, andetspg, tredjespg, fjerdespg, spg, KlasseNavn, SpgNR,TestNavn, RigtigeSvar, skabklasse;
Toggle type;
ScrollableList teacherTests, teacherClass, teacherTestsID;

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
    class_id = cp5.addTextfield("Klasse kode").setPosition(width/2, height/3).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(false);
    cp5.addButton("Tilslut klasse").setPosition(width/2+220, height/3).setSize(80, 40).setVisible(false);

    //login bangs
    cp5.addButton("Vis kodeord").setPosition(width/2+78, height/2+30).setSize(80, 40).setVisible(true);
    cp5.addButton("Login").setPosition(width/2+78, height/2+190).setSize(80, 40).setVisible(true);
    cp5.setColorBackground(color(128)); 
    cp5.setColorForeground(color(105));
    cp5.setColorActive(color(36));

    //textfields
    username_field = cp5.addTextfield("Brugernavn").setPosition(width/2-150, height/2-50).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(true);
    username_field.setFocus(false);
    username_field.setColorBackground(color(255)); 
    username_field.setColorValueLabel(0);
    pass_field = cp5.addTextfield("Kodeord").setPosition(width/2-150, height/2+30).setSize(200, 40).setAutoClear(false).setFont(f).setVisible(true);
    pass_field.setFocus(false);
    pass_field.setColorBackground(color(255)); 
    pass_field.setColorValueLabel(0);
    pass_field.setPasswordMode(passMode);
    
    forstspg = cp5.addTextfield("1 svar").setPosition(629.1, 365).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    forstspg.setFocus(false);
    forstspg.setColorBackground(color(255)); 
    forstspg.setColorValueLabel(0);
    andetspg = cp5.addTextfield("2 svar").setPosition(629.1, 450).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    andetspg.setFocus(false);
    andetspg.setColorBackground(color(255));
    andetspg.setColorValueLabel(0);
    tredjespg = cp5.addTextfield("3 svar").setPosition(629.1, 535).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    tredjespg.setFocus(false);
    tredjespg.setColorBackground(color(255));
    tredjespg.setColorValueLabel(0);
    fjerdespg = cp5.addTextfield("4 svar").setPosition(629.1, 620).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    fjerdespg.setFocus(false);
    fjerdespg.setColorBackground(color(255));
    fjerdespg.setColorValueLabel(0);
    spg = cp5.addTextfield("Spørgsmål").setPosition(75, 365).setSize(500, 50).setAutoClear(false).setFont(f).setVisible(false);
    spg.setFocus(false);
    spg.setColorBackground(color(255));
    spg.setColorValueLabel(0);
    KlasseNavn = cp5.addTextfield("").setPosition(width/2-125, height/2-45).setSize(250, 40).setAutoClear(false).setFont(f).setVisible(false);
    KlasseNavn.setFocus(false);
    KlasseNavn.setColorBackground(color(255)); 
    KlasseNavn.setColorValueLabel(0);
    TestNavn = cp5.addTextfield(" ").setPosition(250, 140).setSize(250, 40).setAutoClear(false).setFont(f).setVisible(false);
    TestNavn.setFocus(false);
    TestNavn.setColorBackground(color(255)); 
    TestNavn.setColorValueLabel(0);
    SpgNR = cp5.addTextfield("Spørgsmål NR").setPosition(629.1, 280).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    SpgNR.setFocus(false);
    SpgNR.setColorBackground(color(255)); 
    SpgNR.setColorValueLabel(0);
    RigtigeSvar = cp5.addTextfield("Det rigtige svar skriv 1-4").setPosition(75, 450).setSize(250, 50).setAutoClear(false).setFont(f).setVisible(false);
    RigtigeSvar.setFocus(false);
    RigtigeSvar.setColorBackground(color(255)); 
    RigtigeSvar.setColorValueLabel(0);
    
    //Scrollable list
    teacherTests = cp5.addScrollableList("DinKlassesTests").setPosition(width/2, 190).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);
    teacherClass = cp5.addScrollableList("DineKlasser").setPosition(90, 190).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);
    teacherTestsID = cp5.addScrollableList("DineTest").setPosition(width/2, 190).setSize(400, 300).setFont(f).setBarHeight(40).setItemHeight(30).setVisible(false);
    
    //create user bangs
    cp5.addButton("Skab bruger").setPosition(width/2+78, height/2+140).setSize(80, 40).setVisible(true);
    type = cp5.addToggle("Laerer/Elev").setPosition(width/2-165, height/2-140).setSize(80, 40).setValue(false).setMode(ControlP5.SWITCH).setVisible(true);
    
    //Create class textfield
    skabklasse =cp5.addTextfield("Klasse navn").setPosition(width/2-100, height/2).setSize(200,40).setFont(f).setVisible(false);
    skabklasse.setColorBackground(color(255)); 
    skabklasse.setColorValueLabel(0);
    cp5.addButton("Skab klasse").setPosition(width/2+110, height/2).setSize(80,40).setVisible(false);
    println("load");      
  }

  void ToggleLogin(boolean vis) {
    toggle("Brugernavn", vis);
    toggle("Kodeord", vis);
    toggle("Vis kodeord", vis);
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
    toggle("Skab bruger", vis);
    toggle("Laerer/Elev", vis);
    toggle("Brugernavn", vis);
    toggle("Kodeord", vis);
  }

  void ToggleClass(boolean vis) {
    toggle("Tilslut klasse", vis);
    toggle("Klasse kode", vis);
  }
  
  void ToggleCreateClass(boolean vis){
    toggle("Klasse navn", vis);
    toggle("Skab klasse", vis);
  }

  void ToggleAll(boolean vis) {
    toggle("Klasse navn", vis);
    toggle("Skab klasse", vis);
    toggle("DineKlasser", vis);
    toggle("DinKlassesTests", vis);
    toggle("DineTest", vis);
    toggle("Brugernavn", vis);
    toggle("Kodeord", vis);
    toggle("Vis kodeord", vis);
    toggle("Login", vis);
    toggle("Skab bruger", vis);
    toggle("Laerer/Elev", vis);
    toggle("Tilslut klasse", vis);
    toggle("Klasse kode", vis);
    toggle("Skab klasse", vis);
    toggle("1 svar",vis);
    toggle("2 svar", vis);
    toggle("3 svar", vis);
    toggle("4 svar", vis);
    toggle("Spørgsmål",vis);
    toggle("Spørgsmål NR",vis);
    toggle("Det rigtige svar skriv 1-4",vis);
    toggle("",vis);
  }
  
  void ToggleCreateQuestion(boolean vis){
    toggle("1 svar",vis);
    toggle("2 svar", vis);
    toggle("3 svar", vis);
    toggle("4 svar", vis);
    toggle("Spørgsmål",vis);
    toggle("Det rigtige svar skriv 1-4",vis);
  }
  void ToggleCreateNewTest(boolean vis){   
    toggle("",vis);
  }
}
