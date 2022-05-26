public class Player {
  float x, y;
  float speed = 3;
  static final float hitboxRadius = 5f/2f;
  
  public void move() {
    if (keysPressed[UP]) {
      y -= speed;
      if (y < 0) {
        y = 0;
      }
    }
    if (keysPressed[DOWN]) {
      y += speed;
      if (y > height) {
        y = height;
      }
    }
    if (keysPressed[LEFT]) {
      x -= speed;
      if (x < 0) {
        x = 0;
      }
    }
    if (keysPressed[RIGHT]) {
      x += speed;
      if (x > width - Sidebar.barWidth) {
        x = width - Sidebar.barWidth;
      }
    }
    if (keysPressed[SHIFT]) {
      speed = 1;
    } else {
      speed = 3;
    }
  }
  
  public void display() {
    render();
    circle(x, y, hitboxRadius * 2); //placeholder
  }
  
  public void render() {
    PImage playerSprite = loadImage("ImageLibrary/????.png");
    image(playerSprite, x - 15, y - 30);
  }
}
