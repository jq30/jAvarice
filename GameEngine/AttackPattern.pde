public abstract class AttackPattern {
  LinkedList<Bullet> currentBullets;
  float x, y; //point of origin of attack
  boolean finished;
  
  public AttackPattern(float x, float y) {
    this.x = x;
    this.y = y;
    finished = false;
    currentBullets = new LinkedList<Bullet>();
  }

  public abstract Bullet[] getBullets();
  public abstract boolean ready();
  public abstract void update();
}

class SingleAimedBullet extends AttackPattern {
  public SingleAimedBullet(float x, float y) {
    super(x, y);
  }
  
  public Bullet[] getBullets() {
    Bullet[] B = {
      new Bullet(x, y, player.x, player.y, 1)
    };
    
    finished = true;
    for (Bullet b : B) {
      currentBullets.add(b);
    }
    return B;
  }
  
  public boolean ready() {
    return true;
  }
  
  public void update() {
    for (Bullet b : currentBullets) {
      b.move();
    }
  }
}
