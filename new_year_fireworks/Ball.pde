class Ball {
  PVector pos, acc, vel;
  ArrayList<PVector> tail;
  boolean isFalling = false;
  int life;
  color col;
  int size = 4;
  int total = 7;

  Ball(float x, float y, PVector acc_, int c) {
    pos = new PVector(x, y);
    acc = acc_.copy();
    vel = new PVector();

    tail = new ArrayList<PVector>();

    life = 255;
    col = c;
  }

  void run() {
    applyForce(new PVector(0, 0.2));
    if (!isFalling) blow();
    update();
    show();
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void blow() {
    if (acc.y >= 0) {
      acc = new PVector(random(-3, 3), random(-2, 2));
      isFalling = true;
    }
  }

  void update() {
    if (tail.size() == total && !tail.isEmpty()) tail.remove(0);
    tail.add(new PVector(pos.x, pos.y));
    
    if (isFalling) life -= 5;


    vel.add(acc);
    pos.add(vel);
    
    vel.mult(0);
  }

  void show() {
    
    for (int i = 0; i < tail.size(); i++) {
      fill(col, i * 10);
      ellipse(tail.get(i).x, tail.get(i).y, size, size);
    }

    fill(col, life);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, size, size);
    popMatrix();
  }

  boolean isDead() {
    return (pos.y > height);
  }
}
