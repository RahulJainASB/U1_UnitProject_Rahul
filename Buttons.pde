// This is the Button class.
// It is used to draw button and take action when pressed

class Button {

  float   rectX, rectY;        // Position of square button
  int     rectHeight;
  int     rectWidth;
  String  str;                 // String to display
  color   rectColor, baseColor;
  color   rectHighlight;
  color   currentColor;
  boolean rectOver = false;

  Button(String s, float x, float y, int w, int h) 
  {
    rectColor       = color(0);
    rectHighlight   = color(51);
    baseColor       = color(102);
    currentColor    = baseColor;
    rectX           = x;
    rectY           = y;
    rectWidth       = w;
    rectHeight      = h;
    str             = new String(s);
    rectOver        = false;
  }

  void draw() 
  {
    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(225);
    strokeWeight(4); 
    rect(rectX, rectY, rectWidth, rectHeight);

    writeText();
  }

  // Writes the button text
  void writeText()
  {
    if ( rectOver) 
      fill(128);
    else
      fill(255);
    textSize(18);
    text (str, (rectX+50), (rectY+30));
  }

  // Checks if the mouse is over the button and sets the flag rectOver
  void update(int x, int y) {
    if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }

  boolean respondMousePressed(int x, int y) 
  {
    update(x, y);
    return rectOver;
  }

  boolean respondMouseReleased(int x, int y)
  {
    if (rectOver) {
      if (str.equals("Exit") ) 
      {
        exit();
      } else if (str.equals("Start"))
      {
        restartGame();
        gameOn = true;
      } else if (str.equals("Auto Off"))
      {
        autoPilot = true;
        str = "Auto On";
      } else if (str.equals("Auto On"))
      {
        autoPilot = false;
        str = "Auto Off";
      } else
      {
        // Testing Bat Edge conditions
        String s =str.substring(0, 7);
        if (s.equals("Bat Pos"))
          bat.testBat++;
        if ( bat.testBat > 3)
          bat.testBat = 1;
        switch(bat.testBat) 
        {
        case 1: 
          str = "Bat Pos: Left";
          break;
        case 2: 
          str = "Bat Pos: Middle";
          break;
        case 3: 
          str = "Bat Pos: Right";
          break;
        }
      }
    }

    rectOver = false;
    return rectOver;
  }


  boolean overRect(float x, float y, int width, int height)
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height)
    {
      return true;
    } else
    {
      return false;
    }
  }
} // end of class