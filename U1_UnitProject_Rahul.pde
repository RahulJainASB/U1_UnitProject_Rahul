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
Button             testBatButton;

ArrayList<Gift>    giftsList;
int                giftCounter = 0;

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
  giftsList        = new ArrayList<Gift>();
  
  startButton      = new Button("Start", 100, 20, 150, 50);
  exitButton       = new Button("Exit",  300, 20, 150, 50);
  autoPilotButton  = new Button("Auto Off", 500, 20, 150, 50);
  testBatButton    = new Button("Bat Pos: Middle", 700, 20, 200, 50);
  
}

void draw() 
{
  background(124);
  frame.draw();
  
  startButton.draw();
  exitButton.draw();
  autoPilotButton.draw();
  testBatButton.draw();
  
  bat.draw();
  scoreboard.draw();
  brickManager.draw();
  
  if( gameOn == true)
  {
    ball.move();
    ball.draw();

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
  if( clicked == false)
  {
    clicked = testBatButton.respondMousePressed(mouseX, mouseY);
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
  if( clicked == false)
  {
    clicked = testBatButton.respondMouseReleased(mouseX, mouseY);
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
  if( giftCounter == 0)
  {
    int giftType = int(random(1,4));
    giftsList.add(new Gift(giftType));
  }
  
  for(int i = 0; i < giftsList.size(); i++)
    giftsList.get(i).draw();

 giftCounter--;

  // Introduce gifts at random
  if(giftCounter < 0)
  {
    giftCounter = int(random(1000, 5000));
    giftCounter = giftCounter/scoreboard.level;    // More gifts for higher levels
  }

}