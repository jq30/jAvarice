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
    for (MenuItem M : menuItems) {
      if (M == menuItems[currentItem]) {
        fill(20, 20, 255);
      } else {
        fill(0);
      }
      M.display();
    }
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
