public interface Event {
  public boolean finished();
  public void start();
}

public class EventManager {
  Deque<Event> eventQueue = new LinkedList<Event>();
  
  Event[] events = {
    new WaitEvent(200),
    new SequenceB(),
    new EndEvent()
  };
  
  public EventManager() {
    init(events);
  }
  
  public void init(Event[] events) {
    for (Event e : events) {
      eventQueue.add(e);
    }
  }
  
  public void next() {
    eventQueue.remove();
    eventQueue.peek().start();
  }
  
  public void update() {
    if (eventQueue.peek().finished()) {
      next();
    }
  }
}

public class EndEvent implements Event {
  public void start() {
    state = GameState.OVER;
  }
  
  public boolean finished() {
    return false;
  }
}

public class WaitEvent extends AttackSequence {
  //is actually just an empty attack under the hood
  public WaitEvent(int frames) {
    attacks.add(new Wait(frames));
  }
}
