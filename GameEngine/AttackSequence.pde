import java.util.*;

public abstract class AttackSequence {
  LinkedList<AttackPattern> currentPatterns = new LinkedList<AttackPattern>();
  Deque<AttackPattern> attacks = new ArrayDeque<AttackPattern>();

  public void update() {
    if (attacks.size() > 0 && attacks.element().ready()) { //short circuiting please dont fail me now
      currentPatterns.add(attacks.remove());
    }
    
    for (AttackPattern a : currentPatterns) {
      a.update();
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
