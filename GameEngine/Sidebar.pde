public class Sidebar {
  static final int barWidth = 200;
  int startDrawPos;
  
  public Sidebar() {
    startDrawPos = width - barWidth;
  }
  
  public void display() {
    fill(255);
    rect(startDrawPos, 0, barWidth, height);
    fill(0);
    text("HP", startDrawPos + 20, 20);
    text(playerHP, startDrawPos + 20, 40);
  }
}
