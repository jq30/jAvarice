//this is responsible for all dialogue
public class DialogueEngine {
  Deque<DialogueBox> dialogues = new LinkedList<DialogueBox>(); //woefully unapologetic for using linkedlist for everything
  //we want fifo with this.
  
  DialogueBox[] dialogueOrder = {
    new DialogueBox(null, "header", "text")
  };
  
  DialogueBox currentDialogue;
  
  public DialogueEngine() {
    for (DialogueBox D : dialogueOrder) {
      dialogues.add(D);
    }
    nextDialogue();
  }
  
  public void display() {
    currentDialogue.display();
  }
  
  public void nextDialogue() {
    currentDialogue = dialogues.remove();
  }
  
  public boolean hasNext() {
    return !(dialogues.size() == 0);
  }
}
