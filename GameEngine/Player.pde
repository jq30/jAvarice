public class Player {
  float x, y;
  float speed = 3;
  static final float hitboxRadius = 5f;
  
  public void move() {
    if (keysPressed[UP]) {
      y -= speed;
    }
    if (keysPressed[DOWN]) {
      y += speed;
    }
    if (keysPressed[LEFT]) {
      x -= speed;
    }
    if (keysPressed[RIGHT]) {
      x += speed;
    }
  }
  
  public void display() {
    circle(x, y, hitboxRadius); //placeholder
  }
}
