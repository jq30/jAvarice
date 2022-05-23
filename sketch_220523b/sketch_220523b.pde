boolean[] keysPressed = new boolean[128];
Player player = new Player();

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  player.display();
  player.move();
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
