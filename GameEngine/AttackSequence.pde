public abstract class AttackSequence implements Event {
  //this linkedlist serves as both list and queue.
  //loop through the list, executing attackpatterns, and if the next one isn't ready, end early.
  LinkedList<AttackPattern> attacks = new LinkedList<AttackPattern>();

  public void update() {    
    Iterator<AttackPattern> it = attacks.iterator();
    while (it.hasNext()) {
      AttackPattern a = it.next();
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
  
  public boolean finished() {
    return attacks.size() == 0;
  }
  
  public void start() {
    currentSequence = this;
    state = GameState.PLAY;
  }
}

/////

public class SequenceB extends AttackSequence {
  public SequenceB() {
    attacks.add(new SpinnyThing(0, 0));
    attacks.add(new SpinnyThing(600, 0));
    attacks.add(new Wait(200));
    attacks.add(new SpinnyThing(300, 100));
    attacks.add(new Wait(200));
    attacks.add(new SpinnyThing(259, 253));
    attacks.add(new SpinnyThing(65, 46));
    attacks.add(new SpinnyThing(269, 175));
  }
}
