class Bullet {
  private Point location;
  private static final int LENGTH = 5;
  private static final int VELOCITY = 10;
  private static final color COLOR = #FF0000;
  private float x_velocity;
  private float y_velocity;
  
  public Bullet(Point location) {
    this.location = new Point(location.x, location.y);
  }
  
  public void shoot() {
    // determine path of bullet
    float shoot_vector_x = mouseX - this.location.x;
    float shoot_vector_y = mouseY - this.location.y;
    // normalize that vector
    float length_of_shoot_vector = sqrt( (shoot_vector_x * shoot_vector_x) + (shoot_vector_y * shoot_vector_y) );
    shoot_vector_x = shoot_vector_x / length_of_shoot_vector;
    shoot_vector_y = shoot_vector_y / length_of_shoot_vector;
    // determine velocity of bullet
    this.x_velocity = shoot_vector_x * Bullet.VELOCITY;
    this.y_velocity = shoot_vector_y * Bullet.VELOCITY;
  }
  
  private void updateLocation() {
    this.location.x += this.x_velocity;
    this.location.y += this.y_velocity;
  }
  
  public boolean outOfBounds() {
    return this.location.x < 0 || this.location.x > width || this.location.y < 0 || this.location.y > height; 
  }
  
  public void draw() {
    Point currentLocation = new Point(this.location.x, this.location.y);
    updateLocation();
    line(currentLocation.x, currentLocation.y, this.location.x, this.location.y);
  }
}
