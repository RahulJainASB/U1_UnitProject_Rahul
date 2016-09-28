/* 
Brick Breaker by Rahul Jain
This project is the brick breaker game in which a ball is hit by a horizontally moving bat to break bricks.
*/


Frame frame;
Bat bat;
Scoreboard scoreboard;
Brick_Manager brickManager;
Ball ball;
Collision_Checker collisionChecker;

void setup()
{
  fullScreen();

  frame = new Frame();
  frame.initialize();

  bat = new Bat();
  scoreboard = new Scoreboard();
  ball = new Ball();

  brickManager = new Brick_Manager();
  collisionChecker = new Collision_Checker();
}

void draw() 
{
  background(124);
  frame.draw();
  bat.draw();
  player.draw();
  brickManager.draw();
  ball.draw();

  ball.move();
  collisionChecker.check();
}


// Responds to key presses
void keyPressed()
{

  if ( key == CODED) {                  // check if key is CODED. This is for special keys
    if ( keyCode == LEFT ) {            // if left key is pressed, move left
      bat.move(true, false);
    } else if ( keyCode == RIGHT ) {    // if right key is pressed, move right
      bat.move(false, true);
    }
  } else if (key == ENTER || key == RETURN)
  {
    //  showInstructions = false;        // This is set to false so that instructions are not showed again
  }
}

void resetGame()
{
  ball.restart();
}

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