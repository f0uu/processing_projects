class Particle  {
  
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float life = 255;
  boolean isDead = false;
  
  Particle(float x, float y, PVector dir) {
      pos = new PVector(x,y);
      vel = PVector.random2D();
      acc = dir.get();
      r = 6;
  }
  
  void run() {
    update();
    show();
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    life-=5;
    
    if(life < 0) isDead = true;
  }
  
  void show() {
   
    float col = map(life, 255, 0, 66, 255);
    noStroke();
    fill(244,col,66,life);
    ellipse(pos.x, pos.y, r*2, r*2);
  }


}
