//this is responsible for all dialogue
public class DialogueEngine {
  Deque<DialogueBox> dialogues = new LinkedList<DialogueBox>(); //woefully unapologetic for using linkedlist for everything
  //we want fifo with this.
  
  DialogueBox[] dialogueOrder = {
    new DialogueBox(sprites.ericAdams, "Eric Adams", "ayo."),
    new DialogueBox(sprites.ericAdams, "Eric Adams", "I'm cancelling your regents week.")
  };
  
  DialogueBox currentDialogue;
  
  public DialogueEngine() {
    for (DialogueBox D : dialogueOrder) {
      dialogues.add(D);
    }
    next();
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
