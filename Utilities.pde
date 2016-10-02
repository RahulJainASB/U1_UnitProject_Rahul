

//
// Checks if the ball (x, y, r) collides with a rectangle (x1, y1, x2, y2)
//
boolean checkRectCircleCollision(float x1, float y1, float x2, float y2, float x, float y, int r)
{
  boolean collide = true;  
  if ( (x < (x1 - r)) || 
    (x > (x2 + r)) || 
    (y < (y1 - r)) ||
    (y > (y2 + r)) )
  {
    collide = false;    // No collision
  }
  return collide;
}



//
// Checks if a rect(x3, y3, x4, y4) collides with a rectangle (x1, y1, x2, y2)
//
boolean checkRectRectCollision(  float x1, float y1, float x2, float y2, 
  float x3, float y3, float x4, float y4)
{
  boolean collide = true;

  if ( (x2 < x3) || 
    (x1 > x4) || 
    (y2 < y3) ||
    (y1 > y4) )
  {
    collide = false;    // No collision
  }
  return collide;
}


// This function checks which side or corner of the rectangle the ball has hit
int getRectCircleSideCollided(float x1, float y1, float x2, float y2, float x, float y, int r)
{
  // 1:  hit the left side of the rectangle
  // 2:  hit the top side of the rectangle
  // 3:  hit the right side of the rectangle
  // 4:  hit the bottom side of the rectangle
  // 5:  hit the top left edge of the rectangle
  // 6:  hit the top right edge of the rectangle
  // 7:  hit the bottom right edge of the reactangle
  // 8:  hit the bottom left edge of the rectangle

  float r1 = r/sqrt(2);

  if (       pointInsideRect( (x1-r1), (y1-r1), x1, y1, x, y) == true )      return 5;
  else if (  pointInsideRect( x2, (y1-r1), (x2 + r1), y1, x, y) == true )      return 6;
  else if (  pointInsideRect( x2, y2, (x2 + r1), (y2 + r1), x, y) == true )      return 7;
  else if (  pointInsideRect( (x1-r1), y2, x1, (y2 + r1), x, y) == true )      return 8;
  else if (  pointInsideRect( (x1-r), y1, x1, y2, x, y) == true )      return 1;
  else if (  pointInsideRect( x1, (y1-r), x2, y1, x, y) == true )      return 2;
  else if (  pointInsideRect( x2, y1, (x2+r), y2, x, y) == true )      return 3;
  else if (  pointInsideRect( x1, y2, x2, (y2+r), x, y) == true )      return 4;
  else                                                                                          return 0;            // Failure condition
}


// This function calculates the distance between two points
float pointPointDistance( float x1, float y1, float x0, float y0)
{
  // Distance of point (x0, y0) from point (x1, y1)
  float dX = x1 - x0;
  float dY = y1 - y0;
  float b1 = (dX * dX) + (dY * dY);
  float d = sqrt(b1);
  return d;
}


// This function calculates the prependicular distance of a point from a line
float pointLineDistance( float x1, float y1, float x2, float y2, float x0, float y0)
{
  // Distance of point (x0, y0) from line defined by (x1, y1) and (x2, y2)
  float d = 0;

  if ( (x1 == x2) && (y1 == y2) )
  {
    d = pointPointDistance(x1, y1, x0, y0); // Case when points on the line are the same. Calculate point-to-point distance
  } else
  {
    float a1 = (x2 - x1) * (y1 - y0);
    float a2 = (x1 - x0) * (y2 - y1);
    float b1 = ((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1));
    d = abs(a1 - a2) / sqrt(b1);
  }
  return d;
}



// This function checks if the point is inside the rectangle.
// It returns true if the point is inside. 
// It returns false if the point is outside or on the rectanle boundary
boolean  pointInsideRect(float x1, float y1, float x2, float y2, float x, float y)
{
  float  xa = x1;
  float  ya = y1;
  float  xb = x2;
  float  yb = y2;  // Point A & B are two diagonal points of rect.

  if ( x2 < x1)
  {
    xa = x2; 
    xb = x1;
  }

  if ( y2 < y1 )
  {
    ya = y2; 
    yb = y1;
  }

  if ( (x > xa) && (x < xb) && (y > ya) && (y < yb) )    
    return true;
  else
    return false;
}