public class BackgroundEngine {
  Deque<PImage> imageQueue;
  PImage overlay; //nullable
  PImage image0; //lower image
  PImage image1; //upper image
  int n; //scroll variable
  boolean repeating;
  boolean scrolling;
  
  public BackgroundEngine() {
    imageQueue = new LinkedList<PImage>();
    imageQueue.add(sprites.tempBackground);
    image0 = sprites.tempBackground;
    image1 = sprites.tempBackground;
    n = 0;
    repeating = true;
    scrolling = true;
  }
  
  public void display() {
    if (scrolling) {
      scroll();
    }
    if (overlay != null) {
      image(overlay, 0, 0);
    }
    image(image0, 0, n);
    image(image1, 0, n - 800); //800 represents image height
  }
  
  public void scroll() {
    n++;
    if (n > 800) { //800 = image height
      //reached end
      if (repeating) {
        n = 0; //this resets the position of the two images
        imageQueue.add(image0); //recycle this image
        image0 = image1; //top image has now replaced the bottom image
        image1 = imageQueue.remove();
      } else {
        n = 0;
        image0 = image1;
        if (imageQueue.size() == 0) {
          scrolling = false; //stop scroll
        } else {
          image1 = imageQueue.remove();
        }
      }
    }
  }
  
  public void addOverlay(PImage overlayImage) {
    overlay = overlayImage;
  }
  
  public void removeOverlay() {
    overlay = null;
  }
}
