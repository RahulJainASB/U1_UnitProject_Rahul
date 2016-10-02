//    This is class Brick.                                 
//    It draws the brick and checks if the ball has hit a brick.

static int brickHeight = 25;

class Brick
{
  float   x;
  float   y;
  int     brickWidth;
  int     counter;
  boolean amIVisible;

  // This is the constructer to build the brick
  Brick()
  {
    x               = 100;
    y               = 200;
    brickWidth      = 150;
    counter         = 1;
    amIVisible      = false;
  }

  void draw()
  {
    if ( amIVisible() == true)
    {
      switch(counter) {
      case 1: 
        stroke(100);
        strokeWeight(1); 
        break;
      case 2: 
        stroke(200);
        strokeWeight(4); 
        break;
      case 3:
      default:
        stroke(150);
        strokeWeight(7); 
        break;
      }
      rect(x, y, brickWidth, brickHeight);
    }
  }

  void setBrickPosition(float xPos, float yPos, int w)
  {
    x = xPos;
    y = yPos;
    brickWidth = w;
  }
  void  setVisibility(boolean f)
  {
    amIVisible = f;
  }
  void  setStrength(int j)
  {
    counter = j;
  }



  boolean checkBallCollision()
  {
    boolean collide     = false;
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();

//println("Checking ball collision");

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
   
   //println("Counter before hit (", x, ", ", y, ") :", counter);
    counter--;        // this brick has been hit. Count the hit.
   //println("Counter after hit (", x, ", ", y, ") :", counter);
    //println("Hit a brick");
    resetVisibility();     // reset the brick visibility
    
    scoreboard.score++;   // Increment player score.  
    return collide;
  }

  // Returns true if this brick is visible, if not, false
  boolean amIVisible()
  {
    return amIVisible;
  }
  
  // Returns true if this brick is visible, if not, false
  void resetVisibility()
  {
    if( amIVisible == true )
    {
      if( counter < 1)
        amIVisible = false;
    }
  }
  

  
} //end of class