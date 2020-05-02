class Asteroids {
  
  PVector pos;
  PVector vel;
  float r;
  Float[] rOff;
  int total = 10;
  //boolean isShooted = false;
  
  Asteroids(float x, float y, float r_) {
    pos = new PVector(x,y);
    float mult =(float) lvl * 1.5;
    vel = PVector.random2D().mult(mult);
    r = r_;
    rOff = new Float[total];
    
    for(int i = 0; i < rOff.length; i++) {
      float off = random(-20,20);
      rOff[i] = off;
    }
  }
  
  void run() {
    update();
    edges();
    show();
  }
  
  void update() {
    pos.add(vel);
  }
  
  void show() {
    pushMatrix();
    translate(pos.x,pos.y);
    fill(255,20);
    stroke(255);
    strokeWeight(2);
    beginShape();
    for(int i = 0; i < total; i++) {
      float angle = map(i, 0, 10, 0, TWO_PI);
     
      float x = r * cos(angle) + rOff[i];
      float y = r * sin(angle) + rOff[i];
      vertex(x,y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  
  void edges() {
    if(pos.x > width*3/2) pos.x = -(2*r);
    else if(pos.x < -width/2) pos.x = width + (2*r);
    
    if(pos.y > height*3/2) pos.y = -(2*r);
    else if(pos.y < -height/2) pos.y = height + (2*r);
  }
  
  boolean isShooted(Ship ship) {
    for(int i = 0; i < ship.ammo.size(); i++) {
      Laser l = ship.ammo.get(i);
      
      float d = dist(l.pos.x,l.pos.y,pos.x,pos.y); 
      if(d < r) {
        ship.ammo.remove(i); 
        ship.score += lvl;
        return true;
      } 
    }
   return false;
  }
}
