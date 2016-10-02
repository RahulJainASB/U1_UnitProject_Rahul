
/****************
class Button {

  int rectX, rectY;      // Position of square button
  int rectHeight = 90;     // Diameter of rect
  int rectWidth  = 150;     // Diameter of rect
  
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;

  void setupButton() 
  {
    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;
    rectX = 200;
    rectY = 20;
  }

  void draw() {
    update(mouseX, mouseY);
    background(currentColor);
  
    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(255);
    rect(rectX, rectY, rectWidth, rectHeight);  
  }

  void update(int x, int y) {
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    }
  }

  void mousePressed() {
    if (rectOver) {
      currentColor = rectColor;
    }
  }

  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }


}
***************/