import java.util.LinkedList;
import java.util.Iterator;

boolean[] keysPressed = new boolean[128];
Player player = new Player();
GameState state = GameState.PLAY;
AttackSequence currentSequence = new SequenceB(300, 300);
Sidebar sidebar;
int playerHP = 5;
int invulnerability = 60;

enum GameState {
  MENU, PLAY, PAUSED, DIALOGUE, OVER
}

void setup() {
  size(750, 750);
  sidebar = new Sidebar();
  noStroke();
}

void draw() {
  switch (state) {
    case PLAY:
      background(255);
      player.display();
      player.move();
      currentSequence.update();
      sidebar.display();
      if (--invulnerability < 0) { invulnerability = 0; }
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
  currentSequence.attacks.add(new SpinnyThing(mouseX, mouseY));
}

void triggerHit() {
  if (invulnerability == 0) {
    playerHP--;
    invulnerability = 60;
  }
}
