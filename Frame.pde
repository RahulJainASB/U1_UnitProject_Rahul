//    This is class Frame.                                  //<>// //<>// //<>//
//    It draws the frame and allows it to hit the ball.

class Frame
{
  float x;
  float y;
  int frameWidth;
  int frameHeight;



  // This is the constructer to build the frame
  Frame()
  {
    x          = 10;
    y          = 100;
    frameWidth = 100;
    frameHeight = 100;
  }

  void draw()
  {
    fill(0);
    rect(x, y, frameWidth, frameHeight);
  }

  void initialize()
  {
    fullScreen();
    frameWidth = width-20;
    frameHeight = height-110;
  }

  int getFrameWidth()
  {
    return frameWidth;
  }
  int getFrameHeight()
  {
    return frameHeight;
  }

  float getLeftX()
  {
    return x;
  }
  float getRightX()
  {
    return x+frameWidth;
  }
  float getTopY()
  {
    return y;
  }
  float getBottomY()
  {
    return y + frameHeight;
  }


  boolean checkWallCollisions()
  {
    boolean collide     = false;

    /*
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
     
     */


    collide = checkTopWallCollision();
    if ( collide == false )
    {
      collide = checkLeftWallCollision();
    }
    if ( collide == false )
    {
      collide = checkRighttWallCollision();
    }
    if ( collide == false )
    {
      collide = checkBottomWallCollision();
    } 
    return collide;
  }



  boolean checkBottomWallCollision()
  {
    boolean collide     = false;

    // Bottom floor
    if ( ball.getY() >= getBottomY())  // checking collision with bottom wall i.e. the ball did not hit the bat and fell down
    {
      scoreboard.lives--;
      playAgain();
      collide = true;
    }
    return collide;
  }

  boolean checkTopWallCollision()
  {
    boolean collide     = false;
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();


    // Bottom floor
    //if ( (ballY - r) <= getTopY())                    // checking collision with top wall
    if ( ballY <= getTopY())                    // checking collision with top wall
    {
      ball.yDirection = +1;
      collide = true;

      if ( ballX < ( getLeftX()) + r)           // Check if the ball hit the Top Left Edge
      {
        ball.xDirection = +1;
      } else if ( ballX > ( getRightX()) - r)     // Check if the ball hit the Top Right Edge
      {
        ball.xDirection = -1;
      }
    }
    return collide;
  }



  boolean checkLeftWallCollision()
  {
    boolean collide     = false;
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();

    // Left wall
    //if ( (ballX - r) <= getLeftX())                    // checking collision with left wall
    if ( ballX <= getLeftX())                    // checking collision with left wall
    {
      ball.xDirection = -ball.xDirection;
      collide = true;

      if ( ballY < ( getTopY()) + r)           // Check if the ball hit the Top Left Edge
      {
        ball.xDirection = +1;
        ball.yDirection = +1;
      } else if ( ballY > ( getBottomY()) - r)     // Check if the ball hit the Bottom Edge
      {
        ball.xDirection = +1;
        ball.yDirection = -1;
      }
    }
    return collide;
  }



  boolean checkRighttWallCollision()
  {
    boolean collide     = false;
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();

    // Right wall
    //if ( (ballX + r) >= getRightX())                    // checking collision with right wall
    if ( ballX >= getRightX())                    // checking collision with right wall
    {
      ball.xDirection = -ball.xDirection;
      collide = true;

      if ( ballY < ( getTopY()) + r)           // Check if the ball hit the Top Right Edge
      {
        ball.xDirection = -1;
        ball.yDirection = +1;
      } else if ( ballY > ( getBottomY()) - r)     // Check if the ball hit the Bottom Edge
      {
        ball.xDirection = -1;
        ball.yDirection = -1;
      }
    }
    return collide;
  }









/***************************************

  float d = 1;

  // Left Wall
  int sideCollided = 0;

  // Check Left Wall Collision
  if ( checkRectCircleCollision( wallLeftX, wallTopY, (wallLeftX+d), wallBottomY, ballX, ballY, r) == true )
  {
    sideCollided = getRectCircleSideCollided( wallLeftX, wallTopY, (wallLeftX+d), wallBottomY, ballX, ballY, r);
    collide = true;
  }
  if ( (sideCollided == 6) ||  (sideCollided == 7) )
  {
    ball.xDirection = -ball.xDirection;
    ball.yDirection = -ball.yDirection;
  }
  if ( sideCollided == 3) 
  {
    ball.xDirection = -ball.xDirection;
  }



  // Right Wall
  if ( collide == false )
  {
    sideCollided = 0;

    // Check Right Wall Collision
    if ( checkRectCircleCollision( (wallRightX - d), wallTopY, wallRightX, wallBottomY, ballX, ballY, r) == true )
    {
      sideCollided = getRectCircleSideCollided( (wallRightX - d), wallTopY, wallRightX, wallBottomY, ballX, ballY, r);
      collide = true;
    }
    if ( (sideCollided == 5) ||  (sideCollided == 8) )
    {
      ball.xDirection = -ball.xDirection;
      ball.yDirection = -ball.yDirection;
    }
    if ( sideCollided == 1) 
    {
      ball.xDirection = -ball.xDirection;
    }
  }



  
    // Top Wall
    if ( collide == false )
    {
      sideCollided = 0;
  
      // Check Top Wall Collision
      if ( checkRectCircleCollision( wallLeftX, wallTopY, wallRightX, (wallTopY + d), ballX, ballY, r) == true )
      {
        sideCollided = getRectCircleSideCollided( wallLeftX, wallTopY, wallRightX, (wallTopY + d), ballX, ballY, r);
        collide = true;
      }
      if ( (sideCollided == 7) ||  (sideCollided == 8) )
      {
        ball.xDirection = -ball.xDirection;
        ball.yDirection = -ball.yDirection;
      }
      if ( sideCollided == 4) 
      {
        ball.yDirection = -ball.yDirection;
      }
    }
  
  
  
  
    return collide;
  }
*************************************/



}