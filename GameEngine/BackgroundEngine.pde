public class BackgroundEngine {
  PImage backgroundImage;
  
  public BackgroundEngine() {
    backgroundImage = sprites.tempBackground;
  }
  
  public void display() {
    image(backgroundImage, 0, 0);
  }
}
