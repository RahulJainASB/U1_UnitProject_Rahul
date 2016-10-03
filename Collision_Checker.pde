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

    if ( bat.checkBallCollision() == true)    // Checks collision with the bat
    {
      collide = true;
    } else if ( checkBrickCollision() == true)    // Checks collision with the bricks
    {
      collide = true;
    } else if ( frame.checkWallCollisions() == true)          // Checks collision with all the 4 walls
    {
      collide = true;
    }

    checkGiftsCollision();            // Check collision with Bat or the floor

    if ( collide == true)
    {
      brickManager.checkAndUpdateGameLevel();
    }

    return collide;
  }


  boolean checkBrickCollision()
  {
    boolean collide = false;
    collide = brickManager.checkBallCollision();
    return collide;
  }


  void checkGiftsCollision()
  {
    // As we may have to delete gifts that have hit the bat or floor, loop backwards so items can be removed.
    for (int i = giftsList.size() - 1; i >= 0; i--) 
    {
      Gift gift = giftsList.get(i);
      boolean collide = gift.checkCollisionWithBat();

      if ( collide == true)
      {
        giftsList.remove(i);
      } else
      {
        collide = gift.checkCollisionWithFloor();
        if ( collide == true)
        {
          giftsList.remove(i);
        }
      }
    }
  }
} // end of class