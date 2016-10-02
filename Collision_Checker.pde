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

    if ( checkBatCollision() == true)    // Checks collision with the bat
    {
      collide = true;
    }
    else if ( checkBrickCollision() == true)    // Checks collision with the bricks
    {
      collide = true;
    }
    else if ( checkWallCollisions() == true)          // Checks collision with all the 4 walls
    {
      collide = true;
    }
    
    checkGiftsCollision();            // Check collision with Bat or the floor
    
    if( collide == true)
    {
      brickManager.checkAndUpdateGameLevel();
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
      scoreboard.lives--;
      playAgain();
    }
    return collide;
  }

  boolean checkBrickCollision()
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
  
  
  void checkGiftsCollision()
  {
    // As we may have to delete gifts that have hit the bat or floor, loop backwards so items can be removed.
    for (int i = giftsList.size() - 1; i >= 0; i--) 
    {
      Gift g = giftsList.get(i);
      boolean collide = g.checkCollisionWithBat();
      
      if( collide == true)
      {
         giftsList.remove(i);
      }
      else
      {
        collide = g.checkCollisionWithFloor();
        if( collide == true)
        {
         giftsList.remove(i);
        }
      }
    }
  }

  
} // end of class