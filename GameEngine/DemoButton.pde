//this is a button placed on the sidebar for demo purposes
public abstract class DemoButton {
  String text;
  int x, y;
  int buttonWidth, buttonHeight;
  
  public DemoButton(String t, int a, int b, int c, int d) {
    text = t;
    x = a;
    y = b;
    buttonWidth = c;
    buttonHeight = d;
  }
  
  public boolean mouseHovering() {
    return mouseX > x && mouseX < (x + buttonWidth) && mouseY > y && mouseY < (y + buttonHeight);
  }
  
  public void display() {
    stroke(0);
    fill(255);
    rect(x, y, buttonWidth, buttonHeight);
    fill(0);
    noStroke();
    text(text, x + 10, y + 20);
  }
  
  public abstract void execute();
}

/////

class DialogueDemo extends DemoButton {
  public DialogueDemo(String t, int a, int b, int c, int d) {
    super(t, a, b, c, d);
  }
  
  public void execute() {
    state = GameState.DIALOGUE;
  }
}
