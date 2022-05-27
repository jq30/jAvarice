public abstract class AttackPattern {
  LinkedList<Bullet> currentBullets;
  float x, y; //point of origin of attack
  boolean finished;
  boolean empty;
  
  public AttackPattern(float x, float y) {
    this.x = x;
    this.y = y;
    finished = false;
    empty = false;
    currentBullets = new LinkedList<Bullet>();
  }

  public boolean ready() {
    return true;
  }

  public void update() {
    if (finished && currentBullets.size() == 0) {
      empty = true;
    }
    Iterator bulletIterator = currentBullets.iterator();
    
    while (bulletIterator.hasNext()) {
      Bullet b = (Bullet)bulletIterator.next();
      if (b.offScreen()) {
        bulletIterator.remove();
      } else {
        b.move();
        b.display();
        if (b.hit()) {
          triggerHit();
          fill(255, 50, 50, 10);
          rect(0, 0, width, height);
        }
      }
    }
  }

  public abstract Bullet[] initBullets();
}

public abstract class DelayedAttack extends AttackPattern {
  int frameToWaitUntil;
  
  public DelayedAttack(float x, float y, int framesToWait) {
    super(x, y);
    frameToWaitUntil = frameCount + framesToWait;
  }
  
  @Override
  public boolean ready() {
    return frameCount > frameToWaitUntil;
  }
}

//////

public class SingleAimedBullet extends AttackPattern {
  public SingleAimedBullet(float x, float y) {
    super(x, y);
  }
  
  public Bullet[] initBullets() {
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

public class SpinnyThing extends AttackPattern {
  int i;
  
  public SpinnyThing(float x, float y) {
    super(x, y);
    i = 0;
  }
  
  public Bullet[] initBullets() {
    i++;
    if (i % 2 == 0) {
      Bullet[] B = {
        new AngledBullet(x, y, 2, 60 + i),
        new AngledBullet(x, y, 2, 120 + i),
        new AngledBullet(x, y, 2, 180 + i),
        new AngledBullet(x, y, 2, 240 + i),
        new AngledBullet(x, y, 2, 300 + i),
        new AngledBullet(x, y, 2, 360 + i)
      };
      if (i == 60) {
        finished = true;
      }
      for (Bullet b : B) {
        currentBullets.add(b);
      }
      return B;
    } else {
      return new Bullet[0];
    }
  }
}
