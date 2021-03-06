public class Bullet {  
  float radius;
  float x, y;
  float xVel, yVel;
  
  public Bullet(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
    radius = 5f;
  }

  public void move() {
    x += xVel;
    y += yVel;
  }
  
  public void display() {
    fill(255, 200, 200);
    circle(x, y, radius * 2);
  }
  
  public boolean hit() {
    return dist(player.x, player.y, x, y) < (Player.hitboxRadius + radius);
  }
  
  public boolean offScreen() {
    return x < -5 || y < -5 || x > width + 5 || y > width + 5;
  }
}

public class AimedBullet extends Bullet {
  public AimedBullet(float x, float y, float targetX, float targetY, float speed) {
    super(x, y,
      speed * (targetX - x) / dist(x, y, targetX, targetY),
      speed * (targetY - y) / dist(x, y, targetX, targetY)
    );
  }
}

//angled bullets, note that java.lang.Math's trig functions take radian values
class DegreeBullet extends Bullet {
  public DegreeBullet(float x, float y, float speed, float angle) {
    super(x, y, speed * (float)Math.cos(Math.toRadians(angle)), speed * (float)Math.sin(Math.toRadians(angle)));
  }
}

class RadianBullet extends Bullet {
  public RadianBullet(float x, float y, float speed, float angle) {
    super(x, y, speed * (float)Math.cos(angle), speed * (float)Math.sin(angle));
  }
}
