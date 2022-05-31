//this is a button placed on the sidebar for demo purposes
public abstract class DemoButton {
  int x, y;
  int buttonWidth, buttonHeight;
  
  public DemoButton(int a, int b, int c, int d) {
    x = a;
    y = b;
    buttonWidth = c;
    buttonHeight = d;
  }
  
  public abstract void execute();
}
