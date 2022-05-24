public abstract class AttackPattern {
  float x, y; //point of origin of attack
  Bullet[] bullets; //bullets to be spawned
  
  public AttackPattern(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Bullet[] getBullets() {
    return bullets;
  }
}

class SingleAimedBullet extends AttackPattern {
  public SingleAimedBullet(float x, float y) {
    super(x, y);
  }
  
  Bullet[] bullets = {
    new Bullet(x, y, player.x, player.y, 1)
  };
}
