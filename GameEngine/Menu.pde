public class Menu {
  MenuItem[] menuItems = {
    new StartItem("START", 40, 40),
    new ExitItem("EXIT", 60, 60)
  };
  int currentItem = 0;
  
  public void display() {
    background(255);
    fill(0);
    text("WELCOME TO jAvarice", 20, 20);
    drawMenuItems();
  }
  
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

public class PauseMenu extends Menu {
  MenuItem[] menuItems = {
    new StartItem("Resume", 40, 40),
    new TitleItem("Quit to Title", 60, 60),
    new ExitItem("Quit to Desktop", 80, 80)
  };
  
  public void display() {
    background(255, 200);
    fill(0);
    text("PAUSED", 20, 20);
    drawMenuItems();
  }
}

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
    state = GameState.PLAY;
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
