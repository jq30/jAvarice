import java.util.Deque;

public abstract class AttackSequence {
  ArrayList<Bullet> currentBullets = new ArrayList<Bullet>(); //replace this with custom linkedlist later maybe
  ArrayList<AttackPattern> currentPatterns = new ArrayList<AttackPattern>();
  Deque<AttackPattern> attacks;

  public void update() {
    for (Bullet b : currentBullets) {
      b.move();
      b.display();
    }
  }
}

public class SequenceA {
  public SequenceA(float x, float y) {
    
  }
}
