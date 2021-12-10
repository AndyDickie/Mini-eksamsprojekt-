class Button {
  float x, y, w, h;
  String text;
  PImage pic;
  boolean show = true;

  Button(float x_, float y_, float w_, float h_, String text_h) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_h;
  }

  void display() {
    if (show) {
      fill(100);
      rect(x, y, w, h);
      fill(255);
      textSize(20);
      text(text, x-w/2, y);
    }
  }

  boolean hasClicked() {
    if (mouseX > x - (w/2) && mouseX < x + (w/2) && mouseY > y - (h/2) && mouseY < y + (h/2) && show == true) {
      return true;
    } else {
      return false;
    }
  }
}