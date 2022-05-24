public abstract class AttackPattern {
  float x, y; //point of origin of attack
  boolean finished;
  
  public AttackPattern(float x, float y) {
    this.x = x;
    this.y = y;
    finished = false;
  }

  public abstract Bullet[] getBullets();
  public abstract boolean ready();
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
    return B;
  }
  
  public boolean ready() {
    return true;
  }
}
