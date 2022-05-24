import java.util.*;

public abstract class AttackSequence {
  LinkedList<AttackPattern> currentPatterns = new LinkedList<AttackPattern>();
  Deque<AttackPattern> attacks = new ArrayDeque<AttackPattern>();

  public void update() {
    if (attacks.size() > 0 && attacks.element().ready()) { //short circuiting please dont fail me now
      currentPatterns.add(attacks.remove());
    }
    
    for (AttackPattern a : currentPatterns) {
      if (! a.finished) {
        Bullet[] bulletsToAdd = a.getBullets();
        for (Bullet b : bulletsToAdd) {
          currentBullets.add(b);
        }
      }
    }
  }
}

public class SequenceA extends AttackSequence {
  public SequenceA(float x, float y) {
    AttackPattern[] patterns = {
        new SingleAimedBullet(298, 256),
        new SingleAimedBullet(283, 275),
        new SingleAimedBullet(311, 276),
        new SingleAimedBullet(269, 300),
        new SingleAimedBullet(323, 298),
        new SingleAimedBullet(254, 321),
        new SingleAimedBullet(335, 321),
        new SingleAimedBullet(299, 302)
    };
    
    for (AttackPattern p : patterns) {
      attacks.add(p);
    }
  }
}
