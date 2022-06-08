public interface Event {
  public boolean finished();
  public void start();
}

public class EventManager {
  Deque<Event> eventQueue = new LinkedList<Event>();
  
  Event[] events = {
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
