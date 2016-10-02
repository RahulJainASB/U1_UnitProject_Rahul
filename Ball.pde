//    This is class Ball.                                 
//    It draws and moves the ball.
//
//    Ball direction:
//        Ball going down towards Right:    X: +ve,    Y: +ve
//        Ball going up   towards Right:    X: +ve,    Y: -ve
//        Ball going up   towards Left:     X: -ve,    Y: -ve
//        Ball going down towards Left:     X: -ve,    Y: +ve
//


class Ball
{
  float   x;
  float   y;
  int     r;
  float   xSpeed;
  float   ySpeed;
  float   xDirection;
  float   yDirection;

  // This is the constructer to build the brick
  Ball()
  {
    reset();
  }
  // Reset the ball position
  void reset()
  {
    x               = 500;
    y               = 500;
    r               = 30;
    xSpeed          = 5;
    ySpeed          = 5; 
    xDirection      = 1;
    yDirection      = -1;
  }


  void draw()
  {
    fill(255);
    ellipse(x, y, r, r);
  }

  // Move the ball
  void move()
  {
    x += xSpeed * xDirection;
    y += ySpeed * yDirection;
  }

  float getX()
  {
    return x;
  }
  float getY()
  {
    return y;
  }
  int getRadius()
  {
    return r;
  }
} //end of class Ball