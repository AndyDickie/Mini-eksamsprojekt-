import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
SQLite db;

void setup(){
  db = new SQLite(this, "users.sqlite" );
  db.connect();
  SQL sql = new SQL();
  
  println(sql.getUser("hello"));
}


void draw(){
  
}
