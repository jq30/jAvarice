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
      return;
    }
    Iterator<Bullet> bulletIterator = currentBullets.iterator();
    
    while (bulletIterator.hasNext()) {
      Bullet b = bulletIterator.next();
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

  public void initBullets() {
    Bullet[] bulletsToInit = getBullets();
    
    if (bulletsToInit == null) {
      return;
    }
    
    for (Bullet B : bulletsToInit) {
      currentBullets.add(B);
    }
  }
  
  public abstract Bullet[] getBullets(); //returns the next set of bullets to add to squence. returns null if none. should only be called when ready.
}

public abstract class DelayedAttack extends AttackPattern {
  int frameToWaitUntil;
  
  public DelayedAttack(float x, float y, int framesToWait) {
    super(x, y);
    delayedAttackTimer += framesToWait;
    frameToWaitUntil = attackFrame + delayedAttackTimer;
  }
  
  @Override
  public boolean ready() {
    if (attackFrame > frameToWaitUntil) {
      empty = true; //mark self for deletion
      return true;
    } else {
      return false;
    }
  }
}

//////

public class SingleAimedBullet extends AttackPattern {
  public SingleAimedBullet(float x, float y) {
    super(x, y);
  }
  
  public Bullet[] getBullets() {
    Bullet[] B = {
      new AimedBullet(x, y, player.x, player.y, 1)
    };
    
    finished = true;
    return B;
  }
}

public class SpinnyThing extends AttackPattern {
  int i;
  
  public SpinnyThing(float x, float y) {
    super(x, y);
    i = 0;
  }
  
  public Bullet[] getBullets() {
    i++;
    if (i % 2 == 0) {
      Bullet[] B = {
        new RadianBullet(x, y, 2, 60 + i),
        new RadianBullet(x, y, 2, 120 + i),
        new RadianBullet(x, y, 2, 180 + i),
        new RadianBullet(x, y, 2, 240 + i),
        new RadianBullet(x, y, 2, 300 + i),
        new RadianBullet(x, y, 2, 360 + i)
      };
      if (i == 60) {
        finished = true;
      }
      return B;
    } else {
      return new Bullet[0];
    }
  }
}

public class ThreeCluster extends AttackPattern {
  int i;
  
  public ThreeCluster(float x, float y) {
    super(x, y);
    i = 0;
  }
  
  public Bullet[] getBullets() {
    i++;
    if (i % 3 == 0) {
      Bullet[] B = {
        new AimedBullet(x, y, player.x, player.y, 2),
        new AimedBullet(x, y, player.x - 20, player.y, 2),
        new AimedBullet(x, y, player.x + 20, player.y, 2)
      };
      if (i == 9) {
        finished = true;
      }
      return B;
    } else {
      return null;
    }
  }
}

public class Wait extends DelayedAttack {
  //this is an "attack pattern" that waits a certain amounts of frames before doing nothing
  //think of a break in a music sheet or something idk
  public Wait(int frames) {
    super(0, 0, frames);
  }
  
  public Bullet[] getBullets() {
    return null;
  }
}
