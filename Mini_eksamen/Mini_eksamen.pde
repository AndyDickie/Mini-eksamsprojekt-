import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
SQLite db_users,db_tests;
ControlP5 cp5;
boolean passMode;
PFont f;
Controller c;
String user;

void setup(){
  f = createFont("Arial", 20);
  passMode = true;

  db_users = new SQLite(this, "users.sqlite" );
  db_tests = new SQLite(this,"tests.sqlite");
  db_tests.connect();
  db_users.connect();
 


  cp5 = new ControlP5(this);
  c = new Controller(0);
  println(c.getClassName(622050));
  println(c.getUserClasses(1));
  
  size(1000, 800);
  c.load();
  c.createQuestionAnswer(c.getTestID("matPrøveTest2"),"Antalplaneter","7");
}


void draw(){
  c.update();
  
}
