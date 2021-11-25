import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
SQLite db;

void setup(){
  db = new SQLite(this, "users.sqlite" );
  db.connect();
  SQL sql = new SQL();
  println(sql.getUser("hello"));
  println(sql.getUserType("hello"));
  println(sql.getPassword("hello"));
  println(sql.login("hello", "1234"));
  println(sql.getUserId("hello"));
  sql.userJoinClass(3, "622050");
}


void draw(){
  
}
