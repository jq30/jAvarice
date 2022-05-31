public class Enemy {
  float x, y;
  float xVel, yVel;
  int n;
  
  public Enemy() {
    x = 300;
    y = -50; //enemy spawns in middle offscreen
    n = 0;
    chartCourse(300, 300, 240);
  }
  
  //move to specified location. we are given n frames to do so.
  public void chartCourse(float x, float y, int n) {
    this.n = n;
    xVel = (x - this.x) / n;
    yVel = (y - this.y) / n;
  }
  
  public void move() {
    if (n > 0) {
      x += xVel;
      y += yVel;
      n--;
    }
  }
  
  public void display() {
    fill(120);
    rect(x - 15, y - 30, 30, 60); //placeholder
  }
}
