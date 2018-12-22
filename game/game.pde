//PImage bg;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Character ch;

void setup() {
  size(600, 400);
   ch = new Character();
   //bg = loadImage("assets\\images\\grass.jpg");
   //bg.resize(width, height);
}

void drawBullets() {
  ArrayList<Bullet> outOfBoundsBullets = new ArrayList<Bullet>();
  for(Bullet b : bullets) {
    b.draw();
    if(b.outOfBounds()) {
      outOfBoundsBullets.add(b);
    }
  }
  bullets.removeAll(outOfBoundsBullets);
}

void draw() {
  background(#50DE4E);
  ch.move(isUp, isDown, isRight, isLeft);
  ch.draw();
  drawBullets();
  
  if(isMousePressed) {
    ch.shoot();
  }
}

boolean isMousePressed = false;
int lastShot = 0;

void mousePressed() {
  isMousePressed = true;
}

void mouseReleased() {
  isMousePressed = false;
}

void keyPressed() {
  if(key == CODED) {
    setMove(keyCode, true);
  }
  else if("wasd".indexOf(key) != -1) {
    setMove(key, true);
  }
}

void keyReleased() {
  if(key == CODED) {
    setMove(keyCode, false);
  }
  else if("wasd".indexOf(key) != -1) {
    setMove(key, false);
  }
}

boolean isLeft, isRight, isUp, isDown;

void setMove(int k, boolean b) {
  switch (k) {
    case UP:
    case 'w':
    case 'W':
      isUp = b;
      break;
    case DOWN:
    case 's':
    case 'S':
      isDown = b;
      break;
    case LEFT:
    case 'a':
    case 'A':
      isLeft = b;
      break;
    case RIGHT:
    case 'd':
    case 'D':
      isRight = b;
      break;
  }
}
