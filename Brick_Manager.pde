// This is class Brick_Manager.
// It creates all the brick lines, draws them and checks if the ball hits any brick lines.

class Brick_Manager
{
  int             maxNumberOfBrickLines;
  Brick_Line[]    brickLine;


  // This is the constructer to build all the Bricks
  Brick_Manager()
  {
    maxNumberOfBrickLines = 5;
    brickLine = new Brick_Line[maxNumberOfBrickLines];
    for (int i = 0; i < brickLine.length; i++)
    {
      brickLine[i] = new Brick_Line();
    }
    setBrickLinesPositions();
    setBrickLinesColor();
    reset();
  }

  void reset()
  {
    setBrickLinesVisibility();
  }

  void draw()
  {
    for (int i = 0; i < brickLine.length; i++)
    {
      if ( brickLine[i].amIVisible == true)
        brickLine[i].draw();
    }
  }


  void setBrickLinesPositions()
  {
    float  brickLineX  = frame.getLeftX();
    float frameY       = frame.getTopY();
    float brickLineY   = frameY;

    for (int i = 0; i < brickLine.length; i++)
    {
      brickLineY = frameY + (i * brickHeight);
      brickLine[i].setPosition(brickLineX, brickLineY); // This programm is stoping at this line.
    }
  }

  void setBrickLinesColor()
  {
    for (int i = 0; i < brickLine.length; i++)
    {
      if ( i == 0)          brickLine[i].setColor(255, 0, 0);
      else if ( i == 1)     brickLine[i].setColor(246, 31, 160);
      else if ( i == 2)     brickLine[i].setColor(295, 95, 227);
      else if ( i == 3)     brickLine[i].setColor(122, 186, 221);
      else if ( i == 4)     brickLine[i].setColor(170, 210, 170);
      else                  brickLine[i].setColor(114, 168, 224);
    }
  }

  void setBrickLinesVisibility()
  {
    // set how many brick lines will be visible depending on the level
    for (int i = 0; i < brickLine.length; i++)
    {
      if ( i < scoreboard.level )
        brickLine[i].setVisibility(true);
      else
        brickLine[i].setVisibility(false);
    }

    // Set how many hits it will take to break the brick
    int hitCount = scoreboard.level - 4;
    if ( hitCount < 1 )
      hitCount = 1;

    for (int i = 0; i < brickLine.length; i++)
    {
      brickLine[i].setBricksStrength(hitCount);
    }
  }


  // Checks if the ball collides with the bricks and updates the scoreboard
  boolean checkBallCollision()
  {
    boolean collide = false;

    for (int i = 0; i < brickLine.length; i++)
    {
      if ( brickLine[i].getVisibility() == true )        // check BrickLine only if it is visible
      {
        collide = brickLine[i].checkBallCollision();
        if ( collide == true )                      // do not check with other brick lines if collided with this brick line. Can only collide with one at a time
          break;
      }
    }
    return collide;
  }


  void checkAndUpdateGameLevel()
  {
    boolean increaseLevel = true;    // initialized value

    int numberOfBrickLines = scoreboard.level;        // check the lines based on the level
    if ( numberOfBrickLines > brickLine.length)        // if level is more than brickline, then reset j to brickline's length
    {
      numberOfBrickLines = brickLine.length;
    }

    for (int i = 0; i < numberOfBrickLines; i++)
    {
      if ( brickLine[i].getVisibility() == true)
      {
        increaseLevel = false;
        break;
      }
    }

    if ( increaseLevel == true )
    {
      scoreboard.level++;
      reset();
    }
  }
} // end of class