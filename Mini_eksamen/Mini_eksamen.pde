import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
SQLite db;
ControlP5 cp5;
boolean passMode;
PFont f;
Controller c;
String user;

void setup(){
  f = createFont("Arial", 20);
  passMode = true;
  db = new SQLite(this, "users.sqlite" );
  db.connect();

  cp5 = new ControlP5(this);
  c = new Controller(0);
  println(c.getClassName(622050));
  size(1000, 800);
  
  c.load();
}


void draw(){
  c.update();
}
