class Circle {
  PVector pos;
  float r;
  float speed;
  color col;
  boolean isGrowing = false;//true;
  
  Circle(float x, float y) {
    pos = new PVector(x, y);
    r = 4;
    speed = 0.5;
    col = 255;
  }
  
  void update() {
    if(isGrowing) r += speed;
  }
  
  void show() {
    noStroke();
    fill(col);
    rect(pos.x, pos.y, r * 2, r * 2);
  }
  
  void check(ArrayList<Circle> other) {
    for(int i = 0; i < other.size(); i++) {
      Circle c = other.get(i);
      
      if(c != this) {
        if(Math.abs(pos.x - c.pos.x) < r && Math.abs(pos.y - c.pos.y) < r) {
          isGrowing = false;
        } 
      }
    }
  }
}
