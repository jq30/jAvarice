public class BackgroundEngine {
  Deque<PImage> imageQueue;
  PImage overlay; //nullable
  PImage currentImage; //bottom image
  PImage nextImage; //top image
  int n; //scroll variable
  boolean repeating;
  boolean scrolling;
  
  public BackgroundEngine() {
    imageQueue = new LinkedList<PImage>();
    currentImage = sprites.adamzzz;
    nextImage = sprites.adamyyy;
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
    image(currentImage, 0, n);
    image(nextImage, 0, n - 800); //800 represents image height
  }
  
  public void scroll() {
    n += 2;
    if (n >= 800) { //800 = image height
      //reached end
      if (repeating) {
        n = 0; //this resets the position of the two images
        imageQueue.add(currentImage); //recycle this image
        currentImage = nextImage; //top image has now replaced the bottom image
        nextImage = imageQueue.remove();
      } else {
        n = 0;
        currentImage = nextImage;
        if (imageQueue.size() == 0) {
          scrolling = false; //stop scroll
        } else {
          nextImage = imageQueue.remove();
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
