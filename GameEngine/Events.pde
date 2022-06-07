public interface Event {
  public boolean finished();
  public void start();
}

public class EventManager {
  Deque<Event> eventQueue = new LinkedList<Event>();
  
  DialogueBox[] dialogue1 = {
    new DialogueBox(sprites.ericAdams, "uwu", "thing"),
    new DialogueBox(sprites.ericAdams, "aaaa", "more thing"),
    new DialogueBox(sprites.ericAdams, "sdaogj", "ughhhhh")
  };
  
  Event[] events = {
    new Dialogue(dialogue1),
    new SequenceB(0, 0)
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
    println("removed: " + eventQueue.remove());
    eventQueue.peek().start();
    println(eventQueue.peek());
    println(eventQueue);
  }
  
  public void update() {
    if (eventQueue.peek().finished()) {
      next();
    }
  }
}
