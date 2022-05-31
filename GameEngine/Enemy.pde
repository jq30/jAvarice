public class Enemy {
  float x, y;
  float xVel, yVel;
  int n;
  
  public Enemy() {
    x = width / 2;
    y = -50; //enemy spawns in middle offscreen
    n = 0;
  }
  
  //move to specified location. we are given n frames to do so.
  public void chartCourse(float x, float y, int n) {
    this.n = n;
    xVel = (x - this.x) / 2;
    yVel = (y - this.y) / 2;
  }
  
  public void move() {
    if (n > 0) {
      x += xVel;
      y += yVel;
      n--;
    }
  }
}
