public class Menu {
  MenuItem[] menuItems = {
    new MenuItem("START", 40, 40),
    new MenuItem("EXIT", 60, 60),
    new MenuItem("idk this might do something", 300, 300)
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
}

public class MenuItem {
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
}
