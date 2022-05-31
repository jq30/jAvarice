public abstract class AttackSequence {
  //this linkedlist serves as both list and queue.
  //loop through the list, executing attackpatterns, and if the next one isn't ready, end early.
  LinkedList<AttackPattern> attacks = new LinkedList<AttackPattern>();

  public void update() {    
    Iterator it = attacks.iterator();
    while (it.hasNext()) {
      AttackPattern a = (AttackPattern)it.next();
      if (! a.ready()) {
        break;
      }
      if (! a.finished) {
        a.initBullets();
      }
      if (a.empty) {
        it.remove();
      } else {
        a.update();
      }
    }
  }
}

/////

public class SequenceA extends AttackSequence {
  public SequenceA(float x, float y) {
    AttackPattern[] patterns = {
        new SingleAimedBullet(x + 298 - 300, y + 256 - 300),
        new SingleAimedBullet(x + 283 - 300, y + 275 - 300),
        new SingleAimedBullet(x + 311 - 300, y + 276 - 300),
        new SingleAimedBullet(x + 269 - 300, y + 300 - 300),
        new SingleAimedBullet(x + 323 - 300, y + 298 - 300),
        new SingleAimedBullet(x + 254 - 300, y + 321 - 300),
        new SingleAimedBullet(x + 335 - 300, y + 321 - 300),
        new SingleAimedBullet(x + 299 - 300, y + 302 - 300)
    };
    
    for (AttackPattern p : patterns) {
      attacks.add(p);
    }
  }
}

public class SequenceB extends AttackSequence {
  public SequenceB(float x, float y) {
    attacks.add(new SpinnyThing(x, y));
  }
}

public class DemoSequence extends AttackSequence {
  public DemoSequence(float x, float y) {
    AttackPattern[] A = {
      new SpinnyThing(x, y),
      new Pause(200),
      new ABunchOfThreeClusters(20),
      new Pause(300),
      new ABunchOfThreeClusters(50),
      new Pause(500),
      new Popcorn(100),
      new Pause(650),
      new ReversoThing(x, y),
      new Pause(800),
      new ConfusionThing(x, y)
    };
    for (AttackPattern a : A) {
      attacks.add(a);
    }
  }
}
