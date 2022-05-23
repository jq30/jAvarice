boolean[] keysPressed = new boolean[128];
Player player = new Player();
GameState state = GameState.PLAY;

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
