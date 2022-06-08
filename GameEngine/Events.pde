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
  
  DialogueBox[] dialogue2 = {
    new DialogueBox(sprites.ericAdams, "eric adams", "no regents week pour toi."),
    new DialogueBox(sprites.tempPFP, "person", "um what..?")
  };
  
  Event[] events = {
    new Dialogue(dialogue1),
    new SequenceB(),
    new Dialogue(dialogue2)
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
