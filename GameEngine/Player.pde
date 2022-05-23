public class Player {
  float x, y;
  float speed = 5;
  
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
    circle(x, y, 10); //placeholder
  }
}
