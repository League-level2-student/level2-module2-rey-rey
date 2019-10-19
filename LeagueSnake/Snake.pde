class Snake {
  final int DEFAULT_SIZE = 10;

  private Segment head;
  private Segment[] tail;
  private int direction = LEFT;


  public Snake ( int x, int y ) {
    this( x, y, 10 );  // default size of snake
  }

  public Snake ( int x, int y, int size ) {

    head = createHead( x, y );
    tail = createTail( size );
  }

  private Segment createHead ( int x, int y ) {
    return new Segment( x, y );
  }


  private Segment[] createTail( int size ) {
    for (int ii = 0; ii < size; ii++ ) {
      addToTail();
    }
    return tail;
  }

  private void addToTail()
  {
    //  Need to create space for new Tail segment

    if (tail == null  || tail.length == 0 ) {
      // since no tail yet created, create one NOW
      tail = new Segment[1];
    } else {
      // we cannot just add to an already existing tail array, SO..., need to recreate with one size bigger
      //  *** Need to reimplement to use list as opposed to Array

      Segment[] temp = new Segment[ tail.length + 1];  // one size bigger
      // copy array
      for (int ii = 0; ii < tail.length; ii++ ) {
        temp[ ii ] = tail[ii]; // copy each tail segment to temp
      }
      // after all copied, now replace tail with new temp array
      tail = temp;
    }

    // now need to update last tail segment based on direction the snake is going
    int last = tail.length - 1;
    
    // get last segment, which maybe just the head.  We need its X and Y values to place correctly
    Segment nextToLast;
    if ( last == 0 ) {
       nextToLast = head;
    } else {
       nextToLast = tail[ last - 1 ];
    }

    if (direction == UP ) {
      tail[ last ]  = new Segment(nextToLast.xLoc, nextToLast.yLoc + Segment.SIZE);
    } else if (direction == DOWN ) {
      tail[ last ]  = new Segment(nextToLast.xLoc, nextToLast.yLoc - Segment.SIZE);
    } else if (direction == LEFT ) {
      tail[ last ]   = new Segment(nextToLast.xLoc + Segment.SIZE, nextToLast.yLoc);
    } else {
      tail[ last ]   = new Segment(nextToLast.xLoc - Segment.SIZE, nextToLast.yLoc);
    }
  }

  public void eat()
  {
    addToTail();
  }

  public boolean hasEatenSelf()
  {
    boolean eatenself = false;
    for (int ii = 0; ii < tail.length; ii++ )
    {
      if ( (head.xLoc  == tail[ii].xLoc) &&
           (head.yLoc == tail[ii].yLoc) )
      {
         eatenself = true;
      }
    }
    return eatenself;
  }
  public int getDirection() {
    return direction;
  }

  public int getLocationX() {
    return head.xLoc;
  }

  public int getLocationY() {
    return head.yLoc;
  }

  public void draw() {
    drawHead();
    drawTail();
  }

  private void drawHead() {
    fill( #13F25D );
    drawSegment( head.xLoc, head.yLoc );
  }

  private void drawTail() {
    fill( #FFFFFF );

    // loop thru the tail size, ad draw tail segments
    for ( int ii = 0; ii < tail.length; ii++ ) {
      if ( tail[ii] != null ) {
        drawSegment( tail[ii].xLoc, tail[ii].yLoc);
      }
    }
  }

  private void drawSegment( int x, int y )
  {
    // draw an individual segment at given x,y
    rect( x, y, Segment.SIZE, Segment.SIZE);
  }


  public void moveUp() {
    simulateMoveTail(); 
    head.yLoc -= Segment.SIZE;  // then update HEAD to Y point above
    direction = UP;
  }

  public void moveDown() {
    simulateMoveTail(); 
    head.yLoc += Segment.SIZE;  // then update HEAD to Y point below
    direction = DOWN;
  }

  public void moveLeft() {
    simulateMoveTail(); 
    head.xLoc -= Segment.SIZE;  // then update HEAD to X point Before
    direction = LEFT;
  }

  public void moveRight() {
    simulateMoveTail(); 
    head.xLoc += Segment.SIZE;  // then update HEAD to X point After
    direction = RIGHT;
  }


  private void simulateMoveTail() {
    // simulate moviing the tail first, by updating each segment to segment before
    // starting from the end of tail, reset each to its previous
    for ( int ii = tail.length-1; ii >= 1; ii-- ) {
      tail[ii].xLoc = tail[ii-1].xLoc;
      tail[ii].yLoc = tail[ii-1].yLoc;
    }

    // for first tail item, set to Heads position
    tail[0].xLoc = head.xLoc;
    tail[0].yLoc = head.yLoc;
  }
  
  
  public void printXY() {
    System.out.println( "snake: " + getLocationX() +  ", " + getLocationY() );
  }
  
  
  
 /*   
  private Segment [] temp (int size ) {

    Segment [] tt;
    if ( size <= 0 ) {
      tt = null;
    } else {
      // allocate the tail some segments
      tt = new Segment[size ];

      // init each tail segment location
      for (int ii = 0; ii < size; ii++ ) {

        // create and assigned a tail segment
        // Note.  New location horizontal to HEAD, moving to the left
        tt[ ii ] = new Segment(head.xLoc + ((ii+1)*Segment.SIZE), head.yLoc);
      }
    }
    return tt;
  } 
*/
}
