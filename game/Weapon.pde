class Weapon {
  private Point location;
  private float angle;
  private static final float LENGTH = 30;
  private static final int SHOOT_TIME_INTERVAL = 4000;
  private int lastShot;
  
  public Weapon() {
    this.location = new Point();
    this.lastShot = -SHOOT_TIME_INTERVAL;
  }
  
  public void setLocation(Point location) {
    this.location.x = location.x;
    this.location.y = location.y; 
  }
  
  private float calculateAngle() {
    float b = mouseY - this.location.y;
    float a = mouseX - this.location.x;
    
    float angle = 0;
    
    if(a > 0) angle = atan(b/a);
    else if(b >= 0 && a < 0) angle = PI + atan(b / a);
    else if(b < 0 && a < 0) angle = PI + atan(b / a);
    else if(b > 0 && a == 0) angle = PI / 2;
    else if(b < 0 && a == 0) angle = -PI / 2;
    if(this.angle < 0) angle = angle + 2 * PI;
    
    return angle;
  }
  
  private Point calculateEndPoint() {
    this.angle = calculateAngle();
    float x2 = this.location.x + cos(this.angle) * Weapon.LENGTH;
    float y2 = this.location.y + sin(this.angle) * Weapon.LENGTH;
    return new Point(x2, y2);
  }
  
  public void shoot() {
    if(millis() - lastShot > SHOOT_TIME_INTERVAL) {
      this.lastShot = millis();
      Point endPoint = this.calculateEndPoint();
      Bullet b = new Bullet(endPoint);
      b.shoot();
      bullets.add(b);
    }
  }
  
  public void draw() {
    Point p2 = calculateEndPoint();
    line(this.location.x, this.location.y, p2.x, p2.y);
  }
}
