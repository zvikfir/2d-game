class Point {
  public float x;
  public float y;
  
  public Point() {}
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public float distance(Point p2) {
    Point p1 = this;
    return sqrt(pow(p1.y - p2.y, 2) + pow(p1.x - p2.x, 2));
  }
}
