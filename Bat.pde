//    This is class Bat.                                 
//    It draws the bat and allows it to move to hit the ball.

class Bat
{
  float x;
  float y;
  int   xSpeed;
  int   batWidth;
  int   batHeight;

  int  testBat = 2;      // 1: Left Edge,  2: Middle,  3:  Right Edge

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
    stroke(200);
    strokeWeight(4); 
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
    if ( testBat == 1)
    {
      //x = ball.x + (ball.r/sqrt(2));  // Testing left edge scenario
      //x = ball.x + ball.r;  // Testing left edge scenario
      x = ball.x + (ball.r/2);  // Testing left edge scenario
      //println("Testing bat left edge");
    } else if ( testBat == 2)
    {
      float x1 = ball.x;    
      x = x1 - (batWidth/2);
      if ( x < 0 )
        x = 0;
      //println("Testing bat middle");
    } else
    {
      //      x = ball.x - batWidth - (ball.r/sqrt(2));  // Testing right edge scenario
      //x = ball.x - batWidth - ball.r;  // Testing right edge scenario
      x = ball.x - batWidth - (ball.r/2);  // Testing right edge scenario
      //println("Testing bat right edge");
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



  boolean checkBallCollision()
  {

    boolean collide = false;
    float batLeftX      = bat.getTopLeftX();
    float batRightX     = bat.getBottomRightX();
    float batTopY       = bat.getTopLeftY();
    float batBottomY    = bat.getBottomRightY();
    int r               = ball.getRadius();
    float ballX         = ball.getX();
    float ballY         = ball.getY();
    boolean stopChecking = false;


    // Is the ball within striking distance of the bat?
    //collide = pointInsideRect( (batLeftX - (r/2)), (batTopY - (r/2)), (batRightX + (r/2)), batBottomY, ballX, ballY);
    collide = pointInsideRect( (batLeftX - r), (batTopY - r), (batRightX + r), batBottomY, ballX, ballY);  // Commented as ball seems a bit far away

    if ( collide == true )
    {
      // Check the left corner hit 
      if ( (stopChecking == false) && (pointPointDistance(batLeftX, batTopY, ballX, ballY) <= r))
      {
        ball.xDirection = -1;
        ball.yDirection = -1;
        stopChecking = true;
      }

      // Check the right corner hit 
      if (  (stopChecking == false) && (pointPointDistance(batRightX, batTopY, ballX, ballY) <= r))
      {
        ball.xDirection = +1;
        ball.yDirection = -1;
        stopChecking = true;
      }

      // Check if collision is with top part of the bat 
      //if (  (stopChecking == false) && (pointInsideRect( batLeftX, (batTopY - r), batRightX, batBottomY, ballX, ballY) == true) )
      if (  (stopChecking == false) && (pointInsideRect( batLeftX, (batTopY - (r/2)), batRightX, batBottomY, ballX, ballY) == true) )
      {
        ball.yDirection = -ball.yDirection;
        stopChecking = true;
      }

      // Check if collision is with left part of the bat 
      if (  (stopChecking == false) && (pointInsideRect( (batLeftX - (r/2)), batTopY, batRightX, batBottomY, ballX, ballY) == true) )
      {
        ball.xDirection = -1;
        ball.yDirection = -1;
        stopChecking = true;
      }

      // Check if collision is with right part of the bat 
      if (  (stopChecking == false) && (pointInsideRect( batLeftX, batTopY, (batRightX + (r/2)), batBottomY, ballX, ballY) == true) )
      {
        ball.xDirection = +1;
        ball.yDirection = -1;
        stopChecking = true;
      }
      
      if(stopChecking == true)
        ball.move();
    }

    return collide;
  }






  /****
   int sideCollided = 0;
   
   if ( checkRectCircleCollision(  bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY(), ballX, ballY, r) == true )
   {
   sideCollided = getRectCircleSideCollided(bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY(), ballX, ballY, r);
   }
   
   
   // Only check the top and side walls of the bat
   if ( sideCollided == 0 )
   {
   return false;
   } else if ( sideCollided == 1 )
   {
   ball.xDirection = -1;
   ball.yDirection = -1;
   //println("Left of bat");
   } else if ( sideCollided == 2 )
   {
   ball.yDirection = -ball.yDirection;
   //println("Top of bat");
   } else if ( sideCollided == 3 )
   {
   ball.xDirection = +1;
   ball.yDirection = -1;
   //println("Right of bat");
   } else if ( sideCollided == 5 )
   {
   ball.xDirection = -1;
   ball.yDirection = -1;
   println("top Left corner of bat");
   } else if ( sideCollided == 6 )
   {
   ball.xDirection = +1;
   ball.yDirection = -1;
   println("top Right corner of bat");
   }
   ****************/



  /************
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
   } else if ( sideCollided == 5 )
   {
   ball.xDirection = -ball.xDirection;
   ball.yDirection = -ball.yDirection;
   println("top Left corner of bat");
   } else if ( sideCollided == 6 )
   {
   ball.xDirection = -ball.xDirection;
   ball.yDirection = -ball.yDirection;
   println("top Right corner of bat");
   } else if ( sideCollided == 7 )
   {
   ball.xDirection = -ball.xDirection;
   ball.yDirection = -ball.yDirection;
   println("bottom Right corner of bat");
   } else if ( sideCollided == 8 )
   {
   ball.xDirection = -ball.xDirection;
   ball.yDirection = -ball.yDirection;
   println("bottom Left corner of bat");
   }
   
   return true;
   }
   **************/
} // End of Bat class