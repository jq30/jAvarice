public class Player {
  float x, y;
  
  public void move() {
    if (keysPressed[UP]) {
      y--;
    }
    if (keysPressed[DOWN]) {
      y++;
    }
    if (keysPressed[LEFT]) {
      x--;
    }
    if (keysPressed[RIGHT]) {
      x++;
    }
  }
  
  public void display() {
    circle(x, y, 10); //placeholder
  }
}
