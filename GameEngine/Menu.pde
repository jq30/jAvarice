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
  
  public MenuItem(String t, float a, float b) {
    displayText = t;
    x = a;
    y = b;
  }
  
  public void display() {
    fill(0);
    text(displayText, x, y);
  }
}
