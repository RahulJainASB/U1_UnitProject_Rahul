//    This is class Bat.                                 
//    It draws the bat and allows it to move to hit the ball.

class Bat
{
  float x;
  float y;
  int   xSpeed;
  int   batWidth;
  int   batHeight;
  
  int  testBat = 1;

  // This is the constructer to build the bat
  Bat()
  {
    batHeight   = 25;
    x           = 500;
    y           = frame.getBottomY() - batHeight - 2; // + 2;
    xSpeed      = 50;
    batWidth    = 150;
  }

  void draw()
  {
    // Check if bat is off the screen before drawing
    float wallLeftX     = frame.getLeftX();
    float wallRightX    = frame.getRightX(); 

    if (  (wallRightX - x) < (batWidth/5) )   // Bat is too far to the right, move it to left side
    {
      x = wallLeftX;
    } else if ( ((x + batWidth) - wallLeftX) < (batWidth/5) )  // Bat is too far to the left side, move it to the right
    {
      x = wallRightX - batWidth;
    }

    fill(255);
    rect(x, y, batWidth, batHeight);
  }

  // Moves the bat left of right depending on the arrow
  void move(boolean moveLeft, boolean moveRight) // move bat left or right
  {
    if (moveLeft == true)
    {
      x -= xSpeed;
    }

    if (moveRight == true)
    {
      x += xSpeed;
    }
  }

  void autoMove()
  {    
    if( testBat == 1)
   {
     x = ball.x + (ball.r/sqrt(2));  // Testing left edge scenario
     println("Testing bat left edge");
   } else if ( testBat == 2)
   {
      float x1 = ball.x;    
      x = x1 - (batWidth/2);
      if( x < 0 )
        x = 0;
     println("Testing bat middle");
   }
   else
   {
     x = ball.x - batWidth - (ball.r/sqrt(2));  // Testing right edge scenario
     println("Testing bat right edge");
   }  
   
  }

  float getTopLeftX()
  {
    return x;
  }
  float getTopLeftY()
  {
    return y;
  }
  float getBottomRightX()
  {
    return (x + batWidth);
  }

  float getBottomRightY()
  {
    return (y + batHeight);
  }
  
  void reset()
  {
    x           = 500;
  }
  
} // End of Bat class