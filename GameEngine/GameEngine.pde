boolean[] keysPressed = new boolean[128];
Player player = new Player();
GameState state = GameState.PLAY;
List<Bullet> currentBullets = new LinkedList<Bullet>(); //replace this with custom linkedlist later maybe
AttackSequence currentSequence = new SequenceB(300, 300);
Sidebar sidebar;
int playerHP = 5;
int invulnerability = 60;

enum GameState {
  MENU, PLAY, PAUSED, DIALOGUE, OVER
}

void setup() {
  size(600, 600);
  sidebar = new Sidebar();
  noStroke();
}

void draw() {
  switch (state) {
    case PLAY:
      background(255);
      player.display();
      player.move();
      
      for (Bullet b : currentBullets) {
        if (b.hit()) {
          triggerHit();
          background(0);
        }
        b.display();
      }
      
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

void clearAllBullets() {
  currentBullets = new LinkedList<Bullet>();
}

void triggerHit() {
  if (invulnerability == 0) {
    playerHP--;
    invulnerability = 60;
  }
}
