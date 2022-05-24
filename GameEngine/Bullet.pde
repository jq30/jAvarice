public class Bullet {  
  float radius;
  float x, y;
  float xVel, yVel;
  
  public Bullet(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
    radius = 10;
  }
  
  public Bullet(float x, float y, float targetX, float targetY, float speed) {
    this(x, y, speed * (targetX - x) / dist(x, y, targetX, targetY), speed * (targetY - y) / dist(x, y, targetX, targetY));
  }

  public void move() {
    x += xVel;
    y += yVel;
  }
  
  public void display() {
    circle(x, y, radius);
  }
  
  public boolean hit() {
    println("HIT!");
    return dist(player.x, player.y, x, y) < (Player.hitboxRadius + radius);
  }
}

class AngledBullet extends Bullet {
  public AngledBullet(float x, float y, float speed, float angle) {
    super(x, y, speed * (float)Math.cos(angle), speed * (float)Math.sin(angle));
  }
}
