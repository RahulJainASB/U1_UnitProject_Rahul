// This class drops gifts and bombs which the player must catch

class Gift
{
  int    giftType;    // 1: Life,  2: Bomb, 3: ScoreBonus
  float  x, y;
  int    r;
  
  Gift(int j)
  {
    giftType = j;
    if( (giftType < 1) || (giftType > 3) )
      giftType = 1;
      
    x = random(frame.getLeftX(), frame.getRightX());
    y = frame.getTopY();
    r = 40;

  }
  
  void draw()
  {
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
  }
  
  void dropLife()
  {
    stroke(255,50);
    fill(64);
//    sphere(28);  
    ellipse(x, y, r, r);
    
    y = y+10;
  }
  
  void dropBomb()
  {
  }
  
  void dropScoreBonus()
  {
  }
}