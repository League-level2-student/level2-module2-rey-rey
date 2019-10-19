class Segment {
  static final int SIZE = 10;

  public int xLoc = -1;
  public int yLoc = -1;
  //public int direction = LEFT;

// Add a constructor with parameters to initialize each variable.
  public Segment( int x, int y) {
    update( x, y );
  }
  
  public void update( int x, int y) {
    xLoc = x;
    yLoc = y;
 // System.out.println ("Segment.x: " + x );
 // System.out.println ("Segment.y: " + y );
  }
  
  /*
  public void setDirection( int direct ) {
    direction = direct;
  }
*/

}
