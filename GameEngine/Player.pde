public class Player {
  float x = (width - Sidebar.barWidth) / 2;
  float y = height * 3 / 4;
  float speed = 3;
  static final float hitboxRadius = 5f/2f;
  int xDirection = 0;
  PImage sprite;
  
  public void move() {
    xDirection = 0;
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
      xDirection = -1;
      if (x < 0) {
        x = 0;
      }
    }
    if (keysPressed[RIGHT]) {
      x += speed;
      xDirection = 1;
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
    switch (xDirection) {
      case -1:
        sprite = sprites.playerLeft;
        break;
      case 0:
        sprite = sprites.playerModel;
        break;
      case 1:
        sprite = sprites.playerRight;
        break;
    }
    image(sprite, x - sprite.width / 2, y - sprite.height / 2);
    fill(150, 200, 160);
    circle(x, y, hitboxRadius * 2); //hitbox
  }
}
