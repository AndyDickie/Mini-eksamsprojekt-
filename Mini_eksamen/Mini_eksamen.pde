import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;
import java.util.Map;
import java.util.*;
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
  size(1000, 800);
  background(0, 0, 107);
  c.load();
}

void draw() {
  c.update();
}
