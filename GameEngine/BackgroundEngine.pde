public class BackgroundEngine {
  PImage backgroundImage;
  PImage overlay; //nullable
  int n; //scroll variable
  
  public BackgroundEngine() {
    backgroundImage = sprites.tempBackground;
    n = 0;
  }
  
  public void display() {
    if (overlay != null) {
      image(overlay, 0, 0);
    }
    image(backgroundImage, 0, n - 800); //800 represents image height
    image(backgroundImage, 0, n);
  }
  
  public void scroll() {
    n++;
    if (n > 800) {
      n = 0;
    }
  }
  
  public void addOverlay(PImage overlayImage) {
    overlay = overlayImage;
  }
  
  public void removeOverlay() {
    overlay = null;
  }
}
