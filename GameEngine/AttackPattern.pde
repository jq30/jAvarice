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

  public boolean ready() {
    return true;
  }

  public void update() {
    for (Bullet b : currentBullets) {
      b.move();
    }
  }

  public abstract Bullet[] getBullets();
}

//////

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
}

class SpinnyThing extends AttackPattern {
  int i;
  
  public SpinnyThing(float x, float y) {
    super(x, y);
    i = 0;
  }
  
  public Bullet[] getBullets() {
    i++;
    Bullet[] B = {
      new AngledBullet(x, y, 3, 60 + i),
      new AngledBullet(x, y, 3, 120 + i),
      new AngledBullet(x, y, 3, 180 + i),
      new AngledBullet(x, y, 3, 240 + i),
      new AngledBullet(x, y, 3, 300 + i),
      new AngledBullet(x, y, 3, 360 + i)
    };
    if (i == 60) {
      finished = true;
    }
    for (Bullet b : B) {
      currentBullets.add(b);
    }
    return B;
  }
}
