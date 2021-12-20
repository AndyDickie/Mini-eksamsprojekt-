import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
import java.util.Map;
SQLite db;
ControlP5 cp5;
boolean passMode;
PFont f;
Controller c;
String user;

void setup() {
  f = createFont("Arial", 20);
  passMode = true;
  rectMode(CENTER);
  db = new SQLite(this, "users.sqlite" );
  db.connect();
  cp5 = new ControlP5(this);
  c = new Controller(0);
  println(c.getClassName(622050));
  println(c.getUserClasses(1));
  size(1000, 800);
  background(0,0,107);
  c.load();
//hej

  //c.test.display();
  //c.createQuestionAnswer(c.getTestID("matProveTest2"),"Antalplaneter","7");

}

void draw() {
  c.update();
}
