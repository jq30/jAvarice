//each stage will have 1 dialogue in beginnning, 1 enemy with 1 attack sequence, 1 diagloue in end.

public interface Event {
  public boolean finished();
}

public abstract class Stage {
  Deque<Event> eventQueue;
  
  AttackSequence sequence;
  Enemy enemy;
  DialogueEngine dialogue1;
  DialogueEngine dialogue2;
  
  abstract void tick();
  
}

public class Stage1 {
  
}
