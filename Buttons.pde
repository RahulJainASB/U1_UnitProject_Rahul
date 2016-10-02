
class Button {

  float   rectX, rectY;        // Position of square button
  int     rectHeight = 90;     // Diameter of rect
  int     rectWidth  = 150;    // Diameter of rect
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
    str              = new String(s);
  }

  void draw() {
    //background(currentColor);
  
    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(255);
    rect(rectX, rectY, rectWidth, rectHeight);
    
    writeText();
  }

  void writeText()
  {
    if( rectOver) 
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
    }
    else {
      rectOver = false;
    }
  }

  boolean respondMousePressed(int x, int y) {
    //println("Inside  respondMousePressed");
    update(x, y);

/*
    if (rectOver) {
      currentColor = rectColor;      
    }
    */
    return rectOver;
  }

  boolean respondMouseReleased(int x, int y) {
    //println("Inside  respondMouseReleased");

    if (rectOver) {
   //   currentColor = rectColor;
      
      if(str.equals("Exit") ) 
      {
        println("Hit Exit");
        exit();
      }
       else if (str.equals("Start"))
        {
          println("Hit Start");
          restartGame();
          gameOn = true;
        }
       else if (str.equals("Auto Off"))
        {
          println("Hit Auto Off");
          autoPilot = true;
          str = "Auto On";
        }
       else if (str.equals("Auto On"))
        {
          println("Hit Auto On");
          autoPilot = false;
          str = "Auto Off";
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
    }
    else
    {
      return false;
    }
  }


} // end of class