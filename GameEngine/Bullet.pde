public class Bullet {  
  float x, y;
  float xVel, yVel;
  
  public Bullet(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }
  
  public Bullet(float x, float y, float targetX, float targetY, float speed) {
    this(x, y, targetX - x, targetY - y);
  }

  public void move() {
    x += xVel;
    y += yVel;
  }
  
  public void display() {
    circle(x, y, 10);
  }
}
