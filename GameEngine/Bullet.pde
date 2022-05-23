public class Bullet {
  float x, y;
  float xVel, yVel;
  
  public Bullet(float x, float y, float speed, float angle) {
    this.x = x;
    this.y = y;
    xVel = speed * (float)Math.cos(angle);
    yVel = speed * (float)Math.sin(angle);
  }
  
  public Bullet(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }
  
  public void move() {
    x += xVel;
    y += yVel;
  }
  
  public void display() {
    circle(x, y, 10);
  }
}
