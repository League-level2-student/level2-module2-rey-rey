class Food {

  final int FOOD_SIZE = 10;
  
  private int xLoc;
  private int yLoc;

// Add a constructor with parameters to initialize each variable.
  public Food() {
    update();
  }
  
  private void update( int x, int y) {
    xLoc = x;
    yLoc = y;
  }
  
  public void update() {
    // create random numner between X_MAX and Y_MAX, size of board, defined in LeagueSnake file
    // Note.  the method random returns a float.  So, need to convert to an int.
    update( (int)random(X_MAX), (int)random(Y_MAX));
  }
  
  public void draw() {
     fill( #EF1010 ); // red
     rect( xLoc, yLoc, FOOD_SIZE, FOOD_SIZE);
  }
  
 public int getLocationX() {
    return xLoc;
  }
  
  public int getLocationY() {
    return yLoc;
  }
  
  public void printXY()
  {
      System.out.println( "food: " + getLocationX() +  ", " + getLocationY() );
  }
}
