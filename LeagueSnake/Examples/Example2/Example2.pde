int[][] grid = new int[50][50];
int dirX = 0;
int dirY = 0;
char dir = ' ';

int[] snakeX = {25, 25, 25, 25, 25};
int[] snakeY = {25, 24, 23, 22, 21};

String msg = "";
String msg2 = "";
int score = 0;
int hiScore = 0;
int gameOver = 0;

void setup() {
  int x, y;

  size(500, 550);

  for (x=0; x<50; x++)
    for (y=0; y<50; y++)
      grid[x][y] = 0;

  frameRate(5);
}


void draw() {

  int x, y, i;
  frameRate(5+score/4);

  background(255, 255, 255);
  stroke(0, 0, 0);
  text("Score:", 10, 525);
  text(score, 60, 525);
  text(msg, 100, 515);
  text(msg2, 100, 545);
  text("Hiscore:", 420, 525);
  text(hiScore, 470, 525);
  stroke(255, 0, 0);
  noFill();
  rect(0, 0, 499, 499);
  if (gameOver==1024) {
    text("Press spacebar to restart", 200, 200);
    if (dir==' ') {
      score = 0;
      msg = "";
      msg2 = "";
      for (x=0; x<50; x++)
        for (y=0; y<50; y++)
          grid[x][y] = 0;
      snakeX = new int[] {25, 25, 25, 25, 25};
      snakeY = new int[] {25, 24, 23, 22, 21};
      gameOver=0;
      dirX=0;
      dirY=0;
    }
  } else {
    // Draw grid 
    for (x=0; x<50; x++) {
      for (y=0; y<50; y++) {
        if (grid[x][y] == 0) {
          //fill(255,255,255);
          //stroke(230,230,230);
          //rect(x*10+1, y*10+1, 7, 7);
        } else if (grid[x][y]>0 && grid[x][y]<50) {
          stroke(0, 100, 0);
          fill(0, 100+grid[x][y]++*4, 0);
          rect(x*10+1, y*10+1, 7, 7);
          if (grid[x][y] == 50) grid[x][y] = 0;
        } else if (grid[x][y]>50 && grid[x][y]<100) {
          // Poison
          stroke(100, 0, 0);
          fill(200+(grid[x][y]++-50)*2, 0, 0);
          triangle(x*10+5, y*10+1, x*10+9, y*10+8, x*10+1, y*10+8);
          if (grid[x][y] == 100) grid[x][y] = 0;
        }
      }
    }
    // Mark snake
    for (i=0; i<snakeX.length; i++) {
      // mark in grid
      grid[snakeX[i]][snakeY[i]] = 255;
    }
    if (score>hiScore) {
      hiScore = score;
      if (gameOver>0) 
        msg2 = "You got a new Hiscore. Nice!";
      else 
      msg2 = "GG - Hiscore record run underway..";
    }

    // Update snake
    x = snakeX[0];
    y = snakeY[0];
    if ((dir!=' ') && gameOver==0) {
      if (dir=='U') {
        y = snakeY[0]-1;
      } else if (dir=='D') {
        y = snakeY[0]+1;
      } else if (dir=='L') {
        x = snakeX[0]-1;
      } else if (dir=='R') {
        x = snakeX[0]+1;
      }
      // Check if we are outside
      if (x<0 || x>49 || y<0 || y>49) {
        msg = "GAME OVER! You went outside the snake pit!"; 
        gameOver = 1;
      } else if (grid[x][y]==255) {
        // 
        msg = "GAME OVER! You ate yourself!";
        gameOver = 1;
      } else if (grid[x][y]>50) {
        msg = "GAME OVER! You ate poison and died!";
        gameOver = 1;
      } else if (grid[x][y]<50) {
        // Check what is on the location
        // Food or nothing there, ok to update
        i=snakeX.length;
        snakeX = splice(snakeX, x, 0);
        snakeY = splice(snakeY, y, 0);
        if (grid[x][y]==0) {
          grid[snakeX[i]][snakeY[i]] = 0;
          snakeX = shorten(snakeX);
          snakeY = shorten(snakeY);
        } else {
          score++;
          grid[x][y] = 0;
        }
      }
    }
    gameOver = gameOver + gameOver;
    // Print snake
    for (i=0; i<snakeX.length; i++) {
      if (i==0) {
        // Head
        stroke(50, 150, 150);
        if (gameOver>0)
          fill(250, 0, 0);
        else 
        fill(50, 150, 200);
        ellipseMode(CORNER);
        ellipse(snakeX[i]*10+1, snakeY[i]*10+1, 8, 8);
      } else {
        stroke(0, 0, 200);
        if (gameOver>0)
          fill(250, 0, 0);
        else 
        fill(0, 0, 250);
        rect(snakeX[i]*10+1, snakeY[i]*10+1, 8, 8);
      }
      // mark in grid
      grid[snakeX[i]][snakeY[i]] = 255;
    }
    // New food
    if (random(0, 255)>100) {
      // Generate new food
      x=int(random(0, 49));
      y=int(random(0, 49));
      grid[x][y]=1;
    }
    // New poison
    if (random(0, 255)>200) {
      // Generate new poison
      x=int(random(0, 49));
      y=int(random(0, 49));
      grid[x][y]=51;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      dir = 'U';
    } else if (keyCode == DOWN) {
      dir = 'D';
    } else if (keyCode == LEFT) {
      dir = 'L';
    } else if (keyCode == RIGHT) {
      dir = 'R';
    }
  } else if (key == ' ') {
    // space
    dir = ' ';
  }
}
