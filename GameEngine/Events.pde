public interface Event {
  public boolean finished();
  public void start();
}

public class EventManager {
  Deque<Event> eventQueue = new LinkedList<Event>();
  
  Event[] events = {
    new WaitEvent(200),
    new Confetti(),
    new IntroduceEnemy(),
    new Dialogue(new DialogueBox[] {
      new HeadlessDialogueBox("Unnamed Protagonist", "Huh? Who's there?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "..."),
      new HeadlessDialogueBox("Unnamed Protagonist", "And what exactly are you supposed to be?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "This world's creator."),
      new HeadlessDialogueBox("Unnamed Protagonist", "The wha--"),
    }),
    new SequenceB(),
    new Dialogue(new DialogueBox[] {
      new HeadlessDialogueBox("Unnamed Protagonist", "So why exactly are you shooting at me?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "I don't like you."),
      new HeadlessDialogueBox("Unnamed Protagonist", "Eeeeeh? Why? What did I ever do to you?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "You were unplanned."),
      new DialogueBox(sprites.orb, "Glowing Orb", "And never meant to be anything more than a placeholder"),
      new HeadlessDialogueBox("Unnamed Protagonist", "Thats... hurtful...")
    }),
    new Explosion(),
    new Dialogue(new DialogueBox[] {
      new HeadlessDialogueBox("Unnamed Protagonist", "Is that why I have no name then?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "Affirmative."),
      new HeadlessDialogueBox("Unnamed Protagonist", "If I may ask, why do you appear as a glowing ball?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "Because this form is only temporary.")
    }),
    new Sprrr(),
    new Dialogue(new DialogueBox[] {
      new HeadlessDialogueBox("Unnamed Protagonist", "Oh so then..."),
      new HeadlessDialogueBox("Unnamed Protagonist", "Aren't you a placeholder too?"),
      new HeadlessDialogueBox("Unnamed Protagonist", "Shouldn't you be destroying yourself then?"),
      new DialogueBox(sprites.orb, "Glowing Orb", "...")
    }),
    new EnemyGoByeBye(),
    new Dialogue(new DialogueBox[] {
      new DialogueBox(sprites.orb, "Glowing Orb", "*poof*"),
      new HeadlessDialogueBox("Unnamed Protagonist", "Um... wasn't expecting that..."),
      new HeadlessDialogueBox("Unnamed Protagonist", "Wait what do I do now--")
    }),
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
    state = GameState.END;
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

public class IntroduceEnemy implements Event {
  public void start() {
    enemy = new Enemy();
  }
  
  public boolean finished() {
    return true; //finishes instantly
  }
}

public class EnemyGoByeBye implements Event {
  public void start() {
    enemy = null;
  }
  
  public boolean finished() {
    return true;
  }
}
