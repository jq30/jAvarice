public class Enemy {
  float x, y;
  float xVel, yVel;
  int n;
  
  public Enemy() {
    
  }
  
  //move to specified location. we are given n frames to do so.
  public void chartCourse(float x, float y, int n) {
    
  }
  
  public void move() {
    if (n > 0) {
      x += xVel;
      y += yVel;
      n--;
    }
  }
}
