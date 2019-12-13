class Circle {
  PVector pos;
  PVector vel;
  float r;
  float speed;
  color col;
  boolean isGrowing;
  boolean isDead;
  boolean destroy;
  int life = 255;

  Circle(float x, float y, color c) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    r = 1;
    speed = random(1);
    col = c;
    
    isGrowing = true;
    isDead = false;
    destroy = false;
  }

  void update() {
    if (isGrowing) r += speed;

    if (destroy) { 
      life -= speed * 10;
      pos.add(vel);
    }
    if (life < 40) {
      isDead = true;
      destroy = false; 
    }
  }

  void show() {
    noStroke();
    fill(col, life);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }

  void edges() {
    if (pos.x + r > width || pos.x - r < 0 || pos.y + r > height || pos.y - r < 0) isGrowing = false;
  }


  void check(ArrayList<Circle> other) {
    edges();


    for (int i = 0; i < other.size(); i++) {
      Circle c = other.get(i);

      if (c != this) {
        float d = dist(c.pos.x, c.pos.y, this.pos.x, this.pos.y);
        if (d < (c.r + this.r)) {
          isGrowing = false;
        }
      }
    }
  }
}
