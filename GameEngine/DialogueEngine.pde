//this is responsible for all dialogue
public class DialogueEngine {
  Deque<DialogueBox> dialogues; //we want fifo with this.
  DialogueBox currentDialogue;
  
  public DialogueEngine() {
    dialogues = new LinkedList<DialogueBox>(); //woefully unapologetic for using linkedlist for everything
  }
  
  public void display() {
    currentDialogue.display();
  }
  
  public void next() {
    currentDialogue = dialogues.remove();
  }
  
  public boolean hasNext() {
    return !(dialogues.size() == 0);
  }
}

public class Dialogue implements Event {
  public Dialogue(DialogueBox[] D) {
    for (DialogueBox d : D) {
      dialogueEngine.dialogues.add(d);
    }
  }
  
  public boolean finished() {
    return ! dialogueEngine.hasNext();
  }
  
  public void start() {
    state = GameState.DIALOGUE;
  }
}
