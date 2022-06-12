public class DialogueBox {
  static final int xPos = 20;
  static final int yPos = 500;
  static final int boxWidth = 500;
  static final int boxHeight = 200;
  
  PImage icon; //should be a 120px square
  String header;
  String text;
  
  public DialogueBox(PImage icon, String header, String text) {
    this.icon = icon;
    this.header = header;
    this.text = text;
  }
  
  public void display() {
    stroke(0);
    fill(255);
    rect(xPos, yPos, boxWidth, boxHeight);
    image(icon, xPos - 10, yPos - 10);
    noStroke();
    fill(0);
    text(header, xPos + 120, yPos + 20);
    text(text, xPos + 120, yPos + 40);
  }
}

public class HeadlessDialogueBox extends DialogueBox {
  public HeadlessDialogueBox(String header, String text) {
    super(null, header, text);
  }
  
  public void display() {
    stroke(0);
    fill(255);
    rect(xPos, yPos, boxWidth, boxHeight);
    noStroke();
    fill(0);
    text(header, xPos + 120, yPos + 20);
    text(text, xPos + 120, yPos + 40);
  }
}
