//    This is class Brick.                                 
//    It draws the brick and checks if the ball has hit a brick.

static int brickHeight = 25;

class Brick
{
  float   x;
  float   y;
  int     brickWidth;
  int     counter;

  // This is the constructer to build the brick
  Brick()
  {
    x               = 100;
    y               = 200;
    brickWidth      = 150;
    counter         = 1;
  }

  void draw()
  {
    if ( amIVisible() == true)
    {
      rect(x, y, brickWidth, brickHeight);
    }
  }

  void setBrickPosition(float xPos, float yPos, int w)
  {
    x = xPos;
    y = yPos;
    brickWidth = w;
  }


  boolean checkBallCollision()
  {
    boolean collide     = false;
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();

    if ( amIVisible() == false )
    {
      return collide;
    }


    int sideCollided = ball.rectCollision( x, y, (x+ brickWidth), (y + brickHeight) );

    if ( sideCollided == 0 )
    {
      return false;
    } else if ( sideCollided == 1 )
    {
      ball.xDirection = -ball.xDirection;
    } else if ( sideCollided == 2 )
    {
      ball.yDirection = -ball.yDirection;
    } else if ( sideCollided == 3 )
    {
      ball.xDirection = -ball.xDirection;
    } else if ( sideCollided == 4 )
    {
      ball.yDirection = -ball.yDirection;
    }

    collide = true;
    counter--;        // this brick has been hit. Count the hit.
    player.score++;   // Increment player score.  
    return collide;
  }

  // Returns true if this brick is visible, if not, false
  boolean amIVisible()
  {
    if ( counter == 0 )
    {
      return false;
    } else 
    {
      return true;
    }
  }
} //end of class