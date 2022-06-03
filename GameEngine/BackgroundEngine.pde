public class BackgroundEngine {
  PImage backgroundImage;
  int n; //scroll variable
  
  public BackgroundEngine() {
    backgroundImage = sprites.tempBackground;
    n = 0;
  }
  
  public void display() {
    image(backgroundImage, 0, n - 800); //800 represents image height
    image(backgroundImage, 0, n);
  }
  
  public void scroll() {
    n++;
    if (n > 800) {
      n = 0;
    }
  }
}
