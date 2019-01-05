int turn;
Game mor;

void setup() {
  size(400, 600);
  mor = new Game();
  mor.reinit();
  turn = 1;
}

void draw() {
  background(255);
  mor.disp();
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(0, 0, 0);
  int win = mor.checkWin();
  switch(win) {
  case 0:
    if (turn == 1) {
      fill(255, 0, 0);
      text("Au tour du joueur 1\nCliquer pour jouer", 200, 500);
    } else {
      fill(0, 0, 255);
      text("Au tour du joueur 2\nCliquer pour jouer", 200, 500);
    }
    break;
  case 1:
    text("Le joueur 1 à gagné\nCliquer pour rejouer", 200, 500);
    break;
    
  case 2:
    text("Le joueur 2 à gagné\nCliquer pour rejouer", 200, 500);
    break;
    
  case 3:
    text("Match nul\nCliquer pour rejouer", 200, 500);
    break;
  
  default:
    break;
  }
  noFill();
}

void mousePressed() {
  if (mor.checkWin() != 0) {
    mor.reinit();
    turn = 1;
    return;
  }
  if (mouseY > 400) {
    return;
  }

  if (10 < mouseX && mouseX <= 380 / 3 && 10 < mouseY && mouseY <= 380 / 3) {
    int a = mor.play(0, 0, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (380 / 3 < mouseX && mouseX <= 760 / 3 && 10 < mouseY && mouseY <= 380 / 3) {
    int a = mor.play(0, 1, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (760 / 3 < mouseX && mouseX <= 390 && 10 < mouseY && mouseY <= 380 / 3) {
    int a = mor.play(0, 2, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (10 < mouseX && mouseX <= 380 / 3 && 380 / 3 < mouseY && mouseY <= 760 / 3) {
    int a = mor.play(1, 0, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (380 / 3 < mouseX && mouseX <= 760 / 3 && 380 / 3 < mouseY && mouseY <= 760 / 3) {
    int a = mor.play(1, 1, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (760 / 3 < mouseX && mouseX <= 390 && 380 / 3 < mouseY && mouseY <= 760 / 3) {
    int a = mor.play(1, 2, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (10 < mouseX && mouseX <= 380 / 3 && 760 / 3 < mouseY && mouseY <= 390) {
    int a = mor.play(2, 0, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (380 / 3 < mouseX && mouseX <= 760 / 3 && 760 / 3 < mouseY && mouseY <= 390) {
    int a = mor.play(2, 1, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  } else if (760 / 3 < mouseX && mouseX <= 390 && 760 / 3 < mouseY && mouseY <= 390) {
    int a = mor.play(2, 2, turn);
    if (a == 0) {
      if (turn == 1) {
        turn = 2;
      } else {
        turn = 1;
      }
    }
  }
}
