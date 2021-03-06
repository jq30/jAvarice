public abstract class Menu {
  MenuItem[] menuItems;
  int currentItem;
  
  public void next() {
    if (! (currentItem >= menuItems.length - 1)) {
      currentItem++;
    }
  }
  
  public void prev() {
    if (currentItem > 0) {
      currentItem--;
    }
  }
  
  public void executeCurrent() {
    menuItems[currentItem].execute();
  }
  
  public abstract void display();
  public abstract void drawMenuItems();
}

public class MainMenu extends Menu {
  public MainMenu() {
    init();
  }
  
  private void init() {
    MenuItem[] mainMenuItems = {
      new StartItem("START", 40, 40),
      new CheatMenuItem("CHEATS", 40, 60),
      new ExitItem("EXIT", 40, 80)
    };
    menuItems = mainMenuItems;
  }
  
  public void drawMenuItems() {
    for (MenuItem M : menuItems) {
      if (M == menuItems[currentItem]) {
        fill(20, 20, 255);
      } else {
        fill(0);
      }
      M.display();
    }
  }
  
  public void display() {
    background(255);
    fill(0);
    text("WELCOME TO jAvarice", 20, 20);
    drawMenuItems();
  }
}

public class PauseMenu extends Menu {
  public PauseMenu() {
    init();
  }
  
  private void init() {
     MenuItem[] pauseMenuItems = {
      new StartItem("RESUME", 40, 40),
      new TitleItem("SAVE AND QUIT", 40, 60),
      new ResetItem("QUIT TO TITLE", 40, 80)
    };
    menuItems = pauseMenuItems;
  }
  
  public void display() {
    fill(255, 50);
    rect(0, 0, width, height);
    fill(0);
    text("PAUSED", 20, 20);
    drawMenuItems();
  }
  
  public void drawMenuItems() {
    for (MenuItem M : menuItems) {
      if (M == menuItems[currentItem]) {
        fill(20, 20, 255);
      } else {
        fill(0);
      }
      M.display();
    }
  }
}

public class CheatMenu extends Menu {
  public CheatMenu() {
    init();
  }
  
  private void init() {
    MenuItem[] cheatMenuItems = {
      new InvunerabilityItem("INVULNERABILITY", 20, 40),
      new TitleItem("BACK", 20, 60)
    };
    menuItems = cheatMenuItems;
  }
  
  public void display() {
    background(255);
    fill(0);
    text("CHEATS", 20, 20);
    drawMenuItems();
  }
  
  public void drawMenuItems() {
    for (MenuItem M : menuItems) {
      if (M == menuItems[currentItem]) {
        fill(20, 20, 255);
      } else {
        fill(0);
      }
      M.display();
    }
    
    fill(0);
    text(invulnerabilityCheat ? "ON" : "OFF", 175, 40);
  }
}

/////


public abstract class MenuItem {
  String displayText;
  float x, y;
  boolean selected;
  
  public MenuItem(String t, float a, float b) {
    displayText = t;
    x = a;
    y = b;
    selected = false;
  }
  
  public void display() {
    text(displayText, x, y);
  }
  
  public abstract void execute();
}

/////

public class StartItem extends MenuItem {
  public StartItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    keysPressed = new boolean[128];
    state = GameState.PLAY;
    events.eventQueue.peek().start();
  }
}

public class ExitItem extends MenuItem {
  public ExitItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    exit();
  }
}

public class TitleItem extends MenuItem {
  public TitleItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    state = GameState.MENU;
  }
}

public class ResetItem extends MenuItem {
  public ResetItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    setup();
  }
}

public class CheatMenuItem extends MenuItem {
  public CheatMenuItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    state = GameState.CHEAT;
  }
}

public class InvunerabilityItem extends MenuItem {
  public InvunerabilityItem(String a, float b, float c) {
    super(a, b, c);
  }
  
  public void execute() {
    invulnerabilityCheat = ! invulnerabilityCheat;
  }
}
