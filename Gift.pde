// This class drops gifts and bombs which the player must catch

class Gift
{
  int      giftType;    // 1: Life,  2: Bomb, 3: ScoreBonus
  float    x, y;        // X and Y position
  PImage   im;
  float    giftWidth;
  float    giftHeight;

  Gift(int kindOfGift)
  {
    giftType = kindOfGift;
    if ( (giftType < 1) || (giftType > 3) )
      giftType = 1;

    giftWidth = giftHeight = 75;
    x = random( (frame.getLeftX() + giftWidth), (frame.getRightX() - giftWidth) );
    y = frame.getTopY();

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
    image(im, x, y, giftWidth, giftHeight);
    y = y + 10;
  }



  boolean checkCollisionWithBat()
  {
    boolean collide = checkRectRectCollision(  bat.getTopLeftX(), bat.getTopLeftY(), bat.getBottomRightX(), bat.getBottomRightY(), 
                                               x, y, x+giftWidth, y+giftHeight);

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

    if ( (y+giftHeight) >=  wallBottomY)
    {
      collide = true;
    }
    return collide;
  }
} // end of class