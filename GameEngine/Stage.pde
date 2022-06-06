//each stage will have 1 dialogue in beginnning, 1 enemy with 1 attack sequence, 1 diagloue in end.

public interface Event {
  public boolean finished();
  public void start();
}

public abstract class Stage {
  Deque<Event> eventQueue = new LinkedList<Event>();
  Event currentEvent;
  
  AttackSequence sequence;
  Enemy enemy;
  DialogueEngine dialogue1;
  DialogueEngine dialogue2;
  
  //abstract void tick();
  
  public void init(Event[] events) {
    for (Event e : events) {
      eventQueue.add(e);
    }
  }
  
  public void next() {
    currentEvent = eventQueue.remove();
    currentEvent.start();
  }
  
  public void tick() {
    if (currentEvent != null && currentEvent.finished()) {
      next();
    }
  }
}

public class Stage1 extends Stage{
  DialogueBox[] dialogue1 = {
    new DialogueBox(sprites.ericAdams, "uwu", "thing"),
    new DialogueBox(sprites.ericAdams, "aaaa", "more thing"),
    new DialogueBox(sprites.ericAdams, "sdaogj", "ughhhhh")
  };
  
  Event[] events = {
    new Dialogue(dialogue1),
    new SequenceB(0, 0)
  };
  
  public Stage1() {
    init(events);
    next();
  }
}
