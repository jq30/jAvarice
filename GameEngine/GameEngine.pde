import java.util.LinkedList;
import java.util.Iterator;
import java.util.Deque;

boolean[] keysPressed = new boolean[128];
Player player;
AttackSequence currentSequence;
Sidebar sidebar;
int playerHP, invulnerability;
Menu menu, pausemenu, cheatmenu;
GameState state;
GraphicsEngine sprites;
DialogueEngine dialogueEngine;
int attackFrame; //keeps track of how many frames of attacking-ness has gone by
Enemy enemy;
BackgroundEngine bgEngine;
EventManager events;
int delayedAttackTimer;
boolean invulnerabilityCheat;
boolean keyProtection;

enum GameState {
  MENU, PLAY, PAUSED, DIALOGUE, OVER, CHEAT, END
}

void setup() {
  attackFrame = 0;
  delayedAttackTimer = 0;
  sprites = new GraphicsEngine();
  player = new Player();
  playerHP = 5;
  invulnerability = 60;
  menu = new MainMenu();
  pausemenu = new PauseMenu();
  cheatmenu = new CheatMenu();
  state = GameState.MENU;
  dialogueEngine = new DialogueEngine();
  enemy = null;
  bgEngine = new BackgroundEngine();
  events = new EventManager();
  invulnerabilityCheat = false;
  
  size(750, 750);
  sidebar = new Sidebar();
  noStroke();
}

void draw() {
  events.update();
  switch (state) {
    case MENU:
      menu.display();
      break;
    case PLAY:
      bgEngine.display(); //background(255);
      player.display();
      player.move();
      if (enemy != null) {
        enemy.display();
        enemy.move();
      }
      if (currentSequence != null) { currentSequence.update(); }
      sidebar.display();
      if (--invulnerability < 0) { invulnerability = 0; }
      attackFrame++;
      break;
    case OVER:
      background(255);
      fill(0);
      text("GAME OVER", 300, 300);
      break;
    case PAUSED:
      pausemenu.display();
      break;
    case DIALOGUE:
      bgEngine.display();
      if (enemy != null) {
        enemy.display();
        enemy.move();
      }
      player.display();
      sidebar.display();
      dialogueEngine.display();
      break;
    case CHEAT:
      cheatmenu.display();
      break;
    case END:
      background(255);
      fill(0);
      text("THE END (or something...)", 300, 300);
      break;
  }
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
    case OVER:
      //if any key pressed, reset (and return to title)
      setup();
      break;
    case DIALOGUE:
      //if any key pressed:
      if (dialogueEngine.hasNext()) {
        dialogueEngine.next(); //advance the dialogue
      } else {
        keysPressed = new boolean[128]; //clear keystrokes
        state = GameState.PLAY; //return to playing mode
      }
      break;
    case CHEAT:
      if (keyCode == UP) {
        cheatmenu.prev();
      }
      if (keyCode == DOWN) {
        cheatmenu.next();
      }
      if (keyCode == 'Z' || keyCode == ENTER) {
        cheatmenu.executeCurrent();
      }
      break;
    case END:
      setup();
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

void mouseClicked() {
  println("mouse clicked @ " + mouseX + ", " + mouseY);
}

void triggerHit() {
  if (invulnerabilityCheat) {
    return;
  }
  if (invulnerability == 0) {
    playerHP--;
    invulnerability = 60;
  }
  if (playerHP == 0) {
    state = GameState.OVER;
  }
}
