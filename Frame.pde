//    This is class Frame.                                  //<>// //<>// //<>// //<>//
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
}