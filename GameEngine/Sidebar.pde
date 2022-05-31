public class Sidebar {
  static final int barWidth = 200;
  int startDrawPos;
  
  public Sidebar() {
    startDrawPos = width - barWidth;
  }
  
  public void display() {
    fill(255);
    stroke(0);
    rect(startDrawPos, 0, barWidth, height);
    noStroke();
    fill(0);
    text("HP", startDrawPos + 20, 20);
    text(playerHP, startDrawPos + 20, 40);
  }
  
  DemoButton[] buttons = {
    new DialogueDemo("start dialogue", 600, 200, 100, 30),
    new AttackDemo("start attack", 600, 240, 100, 30)
  };
}
