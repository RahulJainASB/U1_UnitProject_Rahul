
// This function calculates the prependicular distance of a point from a line
float pointLineDistance( float x1, float y1, float x2, float y2, float x0, float y0)
{
  // Distance of point (x0, y0) from line defined by (x1, y1) and (x2, y2)
  float d = 0;

  if ( (x1 == x2) && (y1 == y2) )
  {
    float b1 = ((x2-x0)*(x2-x0)) + ((y2-y0)*(y2-y0)); // Case when points on the line are the same. Calculate point-to-point distance
    d = sqrt(b1);
  } else
  {
    float a1 = (x2 - x1) * (y1 - y0);
    float a2 = (x1 - x0) * (y2 - y1);
    float b1 = ((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1));
    d = abs(a1 - a2) / sqrt(b1);
  }
  return d;
}