import java.util.LinkedList;
import java.util.Iterator;

boolean[] keysPressed = new boolean[128];
Player player = new Player();
AttackSequence currentSequence = new SequenceB(300, 300);
Sidebar sidebar;
int playerHP = 5;
int invulnerability = 60;
Menu menu = new MainMenu();
Menu pausemenu = new PauseMenu();
GameState state = GameState.MENU;

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
    case MENU:
      menu.display();
      break;
    case PLAY:
      background(255);
      player.display();
      player.move();
      currentSequence.update();
      sidebar.display();
      if (--invulnerability < 0) { invulnerability = 0; }
      break;
    case OVER:
      background(255);
      fill(0);
      text("GAME OVER", 300, 300);
      break;
    case PAUSED:
      keysPressed = new boolean[128];
      pausemenu.display();
      break;
  }
  text(frameRate, 20, height - 20);
}

void keyPressed() {
  switch (state) {
    case PLAY:
      if (keyCode == TAB) {
        state = GameState.PAUSED;
      }
      if (keyCode < keysPressed.length) {
        keysPressed[keyCode] = true;
      } else {
        println("warning: key is not within accepted range: " + keyCode);
      }
      break;
    case MENU:
      if (keyCode == UP) {
        menu.prev();
      }
      if (keyCode == DOWN) {
        menu.next();
      }
      if (keyCode == 'Z' || keyCode == ENTER) {
        menu.executeCurrent();
      }
      break;
    case PAUSED:
      if (keyCode == UP) {
        pausemenu.prev();
      }
      if (keyCode == DOWN) {
        pausemenu.next();
      }
      if (keyCode == 'Z' || keyCode == ENTER) {
        pausemenu.executeCurrent();
      }
      break;
    default:
      break;
  }
}

void keyReleased() {
  switch (state) {
    case PLAY:
      if (keyCode < keysPressed.length) {
        keysPressed[keyCode] = false;
      } else {
        println("warning: key is not within accepted range: " + keyCode);
      }
     default:
       break;
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
  if (playerHP == 0) {
    state = GameState.OVER;
  }
}
