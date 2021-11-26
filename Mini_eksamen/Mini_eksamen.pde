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
  
  //SQL sql = new SQL();
  //println(sql.getUser("hello"));
  //println(sql.getUserType("hello"));
  //println(sql.getPassword("hello"));
  //println(sql.login("hello", "123"));
  //println(sql.getUserId("hello"));
  ////sql.userJoinClass(sql.getUserId("hello"), (sql.getClassID("3.b1")));
  //println(sql.getClassID("3.b1"));
  ////sql.createClass("3.b1", 5);
  
  cp5 = new ControlP5(this);
  c = new Controller(0);
  size(1000, 800);
  
  c.load();
}


void draw(){
  c.update();
}
