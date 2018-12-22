class Character {
  private Point location;
  private static final int RADIUS = 20;
  private static final int MOVEMENT_FACTOR = 3;
  private Weapon weapon;
  
  public Character() {
    this.location = new Point(width / 2, height / 2);
    this.weapon = new Weapon();
    this.weapon.setLocation(this.location);
  }
  
  public void moveUp() {
    this.location.y -= MOVEMENT_FACTOR;
  }
  
  public void moveDown() {
    this.location.y += MOVEMENT_FACTOR;
  }
  
  public void moveRight() {
    this.location.x += MOVEMENT_FACTOR;
  }
  
  public void moveLeft() {
    this.location.x -= MOVEMENT_FACTOR;
  }
  
  public void move(boolean isUp, boolean isDown, boolean isRight, boolean isLeft) {
    if (isLeft) moveLeft();
    if (isRight) moveRight();
    if (isDown) moveDown();
    if (isUp) moveUp();
    this.weapon.setLocation(this.location);
  }
  
  public void shoot() {
    this.weapon.shoot();
  }
  
  public void draw() {
    ellipse(this.location.x, this.location.y, Character.RADIUS, Character.RADIUS);
    this.weapon.draw();
  }
}
