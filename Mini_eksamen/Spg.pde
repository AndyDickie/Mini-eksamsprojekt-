class spg {
  String ans1, ans2, ans3, ans4, question;
  String userAns;
  Button ansb1, ansb2, ansb3, ansb4;
  String correctAns;
  String id;
  boolean answered = false;

  spg(testAns spg) {
    ans1 = spg.ans1;
    ans2 = spg.ans2;
    ans3 = spg.ans3;
    ans4 = spg.ans4;
    correctAns = spg.correctAns;
    id = spg.id;
    question = spg.question;
    ansb1 = new Button(width/4, height/3, 150, 50, ans1);
    ansb2 = new Button(3*width/4, height/3, 150, 50, ans2);
    ansb3 = new Button(width/4, height/3*2, 150, 50, ans3);
    ansb4 = new Button(3*width/4, height/3*2, 150, 50, ans4);

    if (int(correctAns) == 1) {
      correctAns = ans1;
    }
    if (int(correctAns) == 2) {
      correctAns = ans2;
    }
    if (int(correctAns) == 3) {
      correctAns = ans3;
    }
    if (int(correctAns) == 4) {
      correctAns = ans4;
    }
  }

  void display() {
    text(question, width/2, height/10);
    //println(question);
    ansb1.display();
    ansb2.display();
    ansb3.display();
    ansb4.display();
  }

  String mousePress() {
    if (ansb1.hasClicked()) {
      return ans1;
    }
    if (ansb2.hasClicked()) {
      return ans2;
    }
    if (ansb3.hasClicked()) {
      return ans3;
    }
    if (ansb4.hasClicked()) {
      return ans4;
    } else {
      return null;
    }
  }

  boolean mousepressed() {
    if (ansb1.hasClicked() || ansb2.hasClicked() || ansb3.hasClicked() || ansb4.hasClicked()) {
      return true;
    } else {
      return false;
    }
  }
}
