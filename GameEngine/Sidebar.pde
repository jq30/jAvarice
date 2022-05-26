public class Sidebar {
  static final int barWidth = 200;
  int startDrawPos;
  
  public Sidebar() {
    startDrawPos = width - barWidth;
  }
  
  public void display() {
    rect(startDrawPos, 0, barWidth, height);
  }
}
