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
Button             exitButton;
Button             startButton;
Button             autoPilotButton;
ArrayList<Gift>    giftsList;

boolean            autoPilot = false;
boolean            gameOn    = false;

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
  
  startButton      = new Button("Start", 100, 20, 150, 50);
  exitButton       = new Button("Exit",  300, 20, 150, 50);
  autoPilotButton  = new Button("Auto Off", 500, 20, 150, 50);
}

void draw() 
{
  background(124);
  frame.draw();
  
  startButton.draw();
  exitButton.draw();
  autoPilotButton.draw();
  
  bat.draw();
  scoreboard.draw();
  brickManager.draw();
  
  if( gameOn == true)
  {
    ball.draw();

    ball.move();
    collisionChecker.check();
  
    if(autoPilot == true)
      bat.autoMove();
      
      dropGifts();
  }
  else
  {
    showMessage();
  }
}


// Responds to key presses
void keyPressed()
{
  if( autoPilot == false)
  {
    if ( key == CODED) {                  // check if key is CODED. This is for special keys
      if ( keyCode == LEFT ) {            // if left key is pressed, move left
        bat.move(true, false);
      } else if ( keyCode == RIGHT ) {    // if right key is pressed, move right
        bat.move(false, true);
      }
    }
  }
}

// Responds to mouse pressed
void mousePressed()
{
  //println("Mouse clicked");
  boolean clicked = startButton.respondMousePressed(mouseX, mouseY);
  if( clicked == false)
  {
    clicked = exitButton.respondMousePressed(mouseX, mouseY);
  }
  if( clicked == false)
  {
    clicked = autoPilotButton.respondMousePressed(mouseX, mouseY);
  }

}

// Responds to mouse released
void mouseReleased()
{
  //println("Mouse clicked");
  boolean clicked = startButton.respondMouseReleased(mouseX, mouseY);
  if( clicked == false)
  {
    clicked = exitButton.respondMouseReleased(mouseX, mouseY);
  }
  if( clicked == false)
  {
    clicked = autoPilotButton.respondMouseReleased(mouseX, mouseY);
  }
}





// Continue playing if lives left
void playAgain()
{
  if (scoreboard.lives > 0 )
  {
    ball.reset();
  }
  else
  {
    gameOn = false;
  }
}

// Restart the game
void restartGame()
{
  scoreboard.reset();
  brickManager.reset();
  bat.reset();
  ball.reset();
}

void showMessage()
{
  if( scoreboard.lives > 0 )
  {
    textSize(24);
    text("Welcome to Brick Braker!", 75, 400);
    text("Hit Start button to start the game", 75, 500);
  }
  else
  {
    textSize(24);
    text("Game Over", 75, 400);
    text("Hit Start button to play again", 75, 500);
  }
}

void dropGifts()
{
  if( scoreboard.score == 5)
  {
    GiftDropper gift = new GiftDropper(1);
  }
}