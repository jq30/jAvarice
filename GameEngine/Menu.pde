public class Menu {
  MenuItem[] menuItems = {
    new MenuItem("START", 40, 40)
  };
  
  public void display() {
    background(255);
    fill(0);
    text("WELCOME TO jAvarice", 20, 20);
    for (MenuItem M : menuItems) {
      M.display();
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
    if (selected) {
      fill(200, 200, 255);
    } else {
      fill(0);
    }
    text(displayText, x, y);
  }
}
