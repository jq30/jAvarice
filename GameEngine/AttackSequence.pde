public abstract class AttackSequence {
  LinkedList<AttackPattern> attacks = new LinkedList<AttackPattern>();

  public void update() {    
    for (AttackPattern a : attacks) {
      a.update();
      if (! a.finished) {
        a.initBullets();
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
