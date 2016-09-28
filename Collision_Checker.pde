// This is class Collision_Checker
// It checks if the ball collides with the bat, bricks or any of the walls

class Collision_Checker
{
  Collision_Checker()
  {
  }

  // Checks if the ball collides with the bat, bricks or any of the walls
  boolean check()
  {
    boolean collide = false;

    if ( checkWallCollisions() == true)
    {
      collide = true;
    } else if ( CheckBrickCollision() == true)
    {
      collide = true;
    } else if ( checkBatCollision() == true)
    {
      collide = true;
    }
    return collide;
  }

  boolean checkWallCollisions()
  {
    boolean collide     = false;
    float wallLeftX     = frame.getLeftX();
    float wallRightX    = frame.getRightX(); 
    float wallTopY      = frame.getTopY();
    float wallBottomY   = frame.getBottomY();
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();


    if ( ((wallRightX - ballX) < r) || ((ballX - wallLeftX) < r ))  // checking collision with left and right wall
    {
      ball.xDirection = -ball.xDirection;
      collide = true;
    } else if ( (ballY - wallTopY) < r )  // checking collision with top wall
    {
      ball.yDirection = -ball.yDirection;
      collide = true;
    } else if ( (wallBottomY - ballY) < r)  // checking collision with bottom wall i.e. the ball did not hit the bat and fell down
    {
      player.lives--;
      resetGame();
    }
    return collide;
  }

  boolean CheckBrickCollision()
  {
    boolean collide = false;
    collide = brickManager.checkBallCollision();
    return collide;
  }

  boolean checkBatCollision()
  {

    boolean collide = false;
    float batLeftX      = bat.getTopLeftX();
    float batRightX     = bat.getBottomRightX();
    float batY          = bat.getTopLeftY();
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();


    int sideCollided = ball.rectCollision( bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY() );

    if ( sideCollided == 0 )
    {
      return false;
    } else if ( sideCollided == 1 )
    {
      ball.xDirection = -ball.xDirection;
      //println("Left of bat");
    } else if ( sideCollided == 2 )
    {
      ball.yDirection = -ball.yDirection;
      //println("Top of bat");
    } else if ( sideCollided == 3 )
    {
      ball.xDirection = -ball.xDirection;
      //println("Right of bat");
    } else if ( sideCollided == 4 )
    {
      ball.yDirection = -ball.yDirection;
      //println("Bottom of bat");
    }
    return true;
  }
} // end of class