//    This is class Frame.                              //<>//
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
    frameWidth   = width-20;
    frameHeight  = height-110;
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
    if ( ballX <= getLeftX())                    // checking collision with left wall
    {
      ball.xDirection = -ball.xDirection;
      collide = true;

      if ( ballY < ( getTopY()) + r)           // Check if the ball hit the Top Left Edge
      {
        ball.xDirection = +1;
        ball.yDirection = +1;
      } 

      ball.move();
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
    if ( ballX >= getRightX())                    // checking collision with right wall
    {
      ball.xDirection = -ball.xDirection;
      collide = true;

      if ( ballY < ( getTopY()) + r)           // Check if the ball hit the Top Right Edge
      {
        ball.xDirection = -1;
        ball.yDirection = +1;
      }

      ball.move();
    }
    return collide;
  }
}