//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int UPP     = 1;
int DOWNN   = 2;
int LEFTT   = 3;
int RIGHTT  = 4;

int X_MAX = 800;
int Y_MAX = 800;

Snake snake ;
Food  food = new Food();


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(800, 800);
  snake = new Snake (X_MAX/2, Y_MAX/2, 8 );
}


void dropFood() {
  food.update();
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  drawBackground();
  food.draw();
  snake.draw();
}

void drawBackground() {
  background(0, 0, 0);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
}

// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake


void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key != CODED) {
  } else if (!isDirectionValid() )
  {
    // invalid direction
  } else if (!isBoundaryValid() )
  {
    // invalid.  Going past boundaries
  } else {
    if (keyCode == UP ) {
    snake.moveUp();
    } else if (keyCode == DOWN ) {
    snake.moveDown();
    } else if (keyCode == LEFT ) {
    snake.moveLeft();
    } else if (keyCode == RIGHT ) {
    snake.moveRight();
    }
    
    if (snake.hasEatenSelf() )
    {
      System.out.println( "***** GAME OVER****");
    }
    else if (hasSnakeFoundFood() ) {
      // eat and grow
      snake.eat();
      
      // replace food
      food.update();
    }
    

  }
}

boolean hasSnakeFoundFood()
{
  boolean found = false;
  if ( 
  /*
        ( snake.getLocationX()  == food.getLocationX() ) &&
        ( snake.getLocationY()  == food.getLocationY() )
  */
 // 
        // check X
        ( (snake.getLocationX()+5  >= food.getLocationX()) ||
          (snake.getLocationX()-5  <= food.getLocationX()) ) &&
          
        // now check Y
        ( (snake.getLocationY()+5  >= food.getLocationY()) ||
          (snake.getLocationY()-5  <= food.getLocationY()) ) 
//
      )
 
  {
    found = true;
  } else {
    snake.printXY();
    food.printXY();
  }
  
  return found; 
}

boolean isBoundaryValid() {
  boolean valid = false;
  if (keyCode == UP && snake.getLocationY() <= 0 )
  {
    // invalid
  } else if (keyCode == DOWN && snake.getLocationY() >= Y_MAX-Segment.SIZE)
  {
    // invalid
  } else if (keyCode == LEFT && snake.getLocationX() <= 0  )
  {
    // invalid
  } else if (keyCode == RIGHT && snake.getLocationX() >= X_MAX-Segment.SIZE )
  {
    // invalid
  } else
  {
    // since not any invalid case, then must valid
    valid = true;
  }
  return valid;
}

boolean isDirectionValid() {
  boolean valid = false;
  if (keyCode == UP && snake.getDirection() == DOWN)
  {
    // invalid
  } else if (keyCode == DOWN && snake.getDirection() == UP)
  {
    // invalid
  } else if (keyCode == LEFT && snake.getDirection() == RIGHT )
  {
    // invalid
  } else if (keyCode == RIGHT && snake.getDirection() == LEFT )
  {
    // invalid
  } else
  {
    // since not any invalid case, then must valid
    valid = true;
  }
  return valid;
}


void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
}


void eat() {
  //When the snake eats the food, its tail should grow and more food appear
}
