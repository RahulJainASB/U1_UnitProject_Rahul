// This class drops gifts and bombs which the player must catch

class Gift
{
  int    giftType;    // 1: Life,  2: Bomb, 3: ScoreBonus
  float  x, y;
  //int    r;
  PImage  im;
  float   w, h;

  Gift(int j)
  {
    giftType = j;
    if ( (giftType < 1) || (giftType > 3) )
      giftType = 1;

    w = h = 75;
    x = random((frame.getLeftX()+w), (frame.getRightX()-w));
    y = frame.getTopY();

    //r = 40;

    switch(giftType)
    {
    case 1:
      im = loadImage("life.jpg");
      break;
    case 2:
      im = loadImage("skull.jpg");
      break;
    case 3:
    default:
      im = loadImage("money.png");
      break;
    }
  }

  void draw()
  {
    /*
    switch(giftType)
     {
     case 1:
     dropLife();
     break;
     case 2:
     dropBomb();
     break;
     case 3:
     default:
     dropScoreBonus();
     break;
     }
     */

    image(im, x, y, w, h);
    y = y + 10;
  }

  /*
  void dropLife()
   {
   stroke(255,50);
   fill(128,0,0);
   //    sphere(28);  
   ellipse(x, y, r, r);
   
   y = y+10;
   }
   
   void dropBomb()
   {
   stroke(255,50);
   fill(128,128,0);
   //    sphere(28);  
   ellipse(x, y, r, r);
   
   y = y+10;
   }
   
   void dropScoreBonus()
   {
   stroke(255,50);
   fill(128,128,128);
   //    sphere(28);  
   ellipse(x, y, r, r);
   
   y = y+10;
   }
   */

  boolean checkCollisionWithBat()
  {
    //boolean collide = checkRectCircleCollision(bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY(), x, y, r);
    boolean collide = checkRectRectCollision(  bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY(), 
                                                x, y, x+w, y+h);

    if ( collide == true )
    {
      switch(giftType)
      {
      case 1:
        scoreboard.lives = scoreboard.lives + 1;
        break;
      case 2:
        scoreboard.lives--;
        break;
      case 3:
      default:
        scoreboard.score = scoreboard.score + (10 * scoreboard.level);
        break;
      }
    }
    return collide;
  }

  boolean checkCollisionWithFloor()
  {
    boolean collide     = false;
    float wallBottomY   = frame.getBottomY();
    //    int r               = ball.getRadius();
    //    float ballY         = ball.getY();


    //    if ( ballY >= (wallBottomY - r))  // checking collision with bottom wall i.e. the ball did not hit the bat and fell down

    if ( (y+h) >=  wallBottomY)
    {
      collide = true;
    }
    return collide;
  }
}