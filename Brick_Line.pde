//    This is class Brick_Line                                 
//    It contains all the bricks in a line, draws the line and checks if the ball hits this line.

class Brick_Line
{
  Brick[]         bricks;
  int             maxNumberOfBricks;
  boolean         amIVisible;
  float           x;
  float           y;
  int             rColor, gColor, bColor;


  // This is the constructer to build the brick line
  Brick_Line()
  {
    maxNumberOfBricks  = 20;
    amIVisible         = false;
    x                  = 100;
    y                  = 200;
    rColor = gColor = bColor = 150;              

    bricks             = new Brick[maxNumberOfBricks];
    for ( int i = 0; i < bricks.length; i++)
    {
      bricks[i] = new Brick();
    }
  }


  void draw()
  {
    fill(rColor, gColor, bColor);              // Set the color for the bricks in this brickLine
    for (int i = 0; i < maxNumberOfBricks; i++)
    {
      bricks[i].draw();
    }
  }


  void setPosition(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
    setBricksPositions();
  }


  void setBricksPositions()
  {    
    float brickY     = y;
    int brickWidth   = frame.getFrameWidth()/maxNumberOfBricks;

    for ( int i = 0; i < bricks.length; i++)
    {
      float brickX =  x + (i*brickWidth) + 2;      
      bricks[i].setBrickPosition(brickX, brickY, brickWidth);
    }
  }

  void setBricksStrength(int brickStrength)
  {    
    for ( int i = 0; i < bricks.length; i++)
    {
      bricks[i].setStrength(brickStrength);
    }
  }

  void  setVisibility(boolean showBrick)
  {
    amIVisible = showBrick;
    for (int i = 0; i < bricks.length; i++)
    {
      bricks[i].setVisibility(showBrick);
    }
  }


  void setColor(int r, int g, int b)
  {
    rColor = r;
    gColor = g;
    bColor = b;
  }

  boolean checkBallCollision()
  {
    boolean collide     = false;
    int radius          = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();

    if ( amIVisible == false )          // do not check for collision if this brick line is not visible.
      return collide;

    // check if ball is above or below the brick line. If so, ignore.
    if ( (abs(y - ballY) > radius ) || ((abs( ballY - (y+brickHeight)) > radius )) )
    {
      collide = false;
    } else
    {      
      for (int i = 0; i < bricks.length; i++)
      {
        if ( bricks[i].amIVisible() == true )
        {
          collide = bricks[i].checkBallCollision();
          if ( collide == true )                      // do not check with other brick lines if collided with this brick line. Can only collide with one at a time
            break;
        }
      }
    }
    checkAndResetVisibility();
    return collide;
  }


  void checkAndResetVisibility()
  {
    if (amIVisible == true )    // if brickLine is not visible, then don't check
    {
      amIVisible = false;
      for (int i = 0; i < bricks.length; i++)
      {
        if ( bricks[i].amIVisible() == true )
        {      
          amIVisible = true;                // Brick line is visible if any of the brick is visible
          break;
        }
      }
    }
  }

  boolean  getVisibility()
  {
    return amIVisible;
  }
} // End of class