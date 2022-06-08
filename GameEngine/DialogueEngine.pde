//this is responsible for all dialogue
public class DialogueEngine {
  Deque<DialogueBox> dialogues; //we want fifo with this.
  
  public DialogueEngine() {
    dialogues = new LinkedList<DialogueBox>(); //woefully unapologetic for using linkedlist for everything
  }
  
  public void display() {
    if (hasNext()) {
      dialogues.peek().display();
    }
  }
  
  public void next() {
    dialogues.remove();
  }
  
  public boolean hasNext() {
    return !(dialogues.size() == 0);
  }
}

public class Dialogue implements Event {
  boolean enqueued;
  DialogueBox[] D;
  
  public Dialogue(DialogueBox[] _D) {
    D = _D;
    enqueued = false;
  }
  
  public boolean finished() {
    return enqueued && ! dialogueEngine.hasNext();
  }
  
  public void start() {
    for (DialogueBox d : D) {
      dialogueEngine.dialogues.add(d);
    }
    enqueued = true;
    state = GameState.DIALOGUE;
  }
}
