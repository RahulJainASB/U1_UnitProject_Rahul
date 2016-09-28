//    This is class Ball.                                 
//    It draws and moves the ball.

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

  // Restart the ball position
  void restart()
  {
    x               = 500;
    y               = 500;
    xDirection      = 1;
    yDirection      = -1;
  }


  // Calculates the intersection of a rectangle with this ball
  int rectCollision(float x1, float y1, float x2, float y2)
  {
    if ( (x < (x1 - r)) || 
      (x > (x2 + r)) || 
      (y < (y1 - r)) ||
      (y > (y2 + r)) )
    {
      return 0;    // No collision
    } else
    {
      if ( pointLineDistance( x1, y1, x1, y2, x, y) <= r )
        return 1;            // hit the left side of the rectangle
      else if ( pointLineDistance( x1, y1, x2, y1, x, y) <= r )
        return 2;            // hit the top side of the rectangle
      else if ( pointLineDistance( x2, y1, x2, y2, x, y) <= r )
        return 3;            // hit the right side of the rectangle
      else if ( pointLineDistance( x1, y2, x2, y2, x, y) <= r )
        return 4;            // hit the bottom side of the rectangle
    }
    return 0;
  }
} //end of class Ball