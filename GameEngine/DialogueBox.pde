public class DialogueBox {
  static final int xPos = ;
  static final int yPos = ;
  static final int boxWidth = ;
  static final int boxHeight = ;
  
  PImage icon;
  String header;
  String text;
  
  public DialogueBox(PImage icon, String header, String text) {
    this.icon = icon;
    this.header = header;
    this.text = text;
  }
  
  public void display() {
    rect(xPos, yPos, boxWidth, boxHeight);
    rect(xPos, yPox, 60, 60); //stand-in for icon
    text(header, xPos + 20, yPos + 20);
    text(text, xPos + 20, yPos + 40);
  }
}
