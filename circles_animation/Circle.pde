class Circle {
  PVector pos;
  float r;
  float speed;
  color col;
  boolean isGrowing = true;

  Circle(float x, float y, color c) {
    pos = new PVector(x, y);
    r = 1;
    speed = random(1);
    col = c;
  }

  void update() {
    if(isGrowing) r += speed;
  }

  void show() {
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
  
  void edges() {
    if(pos.x + r > width || pos.x - r < 0 || pos.y + r > height || pos.y - r < 0) isGrowing = false;
  }


  void check(ArrayList<Circle> other) {
   edges();
   
   
   for(int i = 0; i < other.size(); i++) {
     Circle c = other.get(i);
   
     if(c != this) {
        float d = dist(c.pos.x, c.pos.y, this.pos.x, this.pos.y);
        if(d < (c.r + this.r)) {
          isGrowing = false;
        }
     }
   }
  }
}
