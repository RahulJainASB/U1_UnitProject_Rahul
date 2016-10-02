/* 
Brick Breaker by Rahul Jain
This project is the brick breaker game in which a ball is hit by a horizontally moving bat to break bricks.
*/


Frame              frame;
Bat                bat;
Scoreboard         scoreboard;
Brick_Manager      brickManager;
Ball               ball;
Collision_Checker  collisionChecker;
boolean            autoGame = true;

void setup()
{
  fullScreen();

  frame = new Frame();
  frame.initialize();

  bat              = new Bat();
  scoreboard       = new Scoreboard();
  ball             = new Ball();
  brickManager     = new Brick_Manager();
  collisionChecker = new Collision_Checker();
}

void draw() 
{
  background(124);
  frame.draw();
  bat.draw();
  scoreboard.draw();
  brickManager.draw();
  ball.draw();

  ball.move();
  collisionChecker.check();
  
  if(autoGame == true)
    bat.autoMove();
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
  if (scoreboard.lives < 1 )
  {
    //exit();
  }
  else
  {
    ball.reset();
    brickManager.reset();
  }
}