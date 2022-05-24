boolean[] keysPressed = new boolean[128];
Player player = new Player();
GameState state = GameState.PLAY;
List<Bullet> currentBullets = new LinkedList<Bullet>(); //replace this with custom linkedlist later maybe
AttackSequence currentSequence = new SequenceA(300, 300);

enum GameState {
  MENU, PLAY, PAUSED, DIALOGUE, OVER
}

void setup() {
  size(600, 600);
}

void draw() {
  switch (state) {
    case PLAY:
      background(255);
      player.display();
      player.move();
      
      for (Bullet b : currentBullets) {
        b.move();
        b.display();
      }
      
      currentSequence.update();
      break;
  }
}

void keyPressed() {
  if (keyCode < keysPressed.length) {
    keysPressed[keyCode] = true;
  } else {
    println("warning: key is not within accepted range: " + keyCode);
  }
}

void keyReleased() {
  if (keyCode < keysPressed.length) {
    keysPressed[keyCode] = false;
  } else {
    println("warning: key is not within accepted range: " + keyCode);
  }
}

void mousePressed() {
  println(currentBullets.size());
}
