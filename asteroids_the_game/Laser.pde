class Laser {
  
  PVector pos;
  PVector vel;
  float rotation;
  float len;
  
  Laser(float x, float y, float a) {
    pos = new PVector(x,y);
    vel = new PVector();
    rotation = a - PI/2;
    len = 20;  
    vel.add(PVector.fromAngle(rotation)).mult(10);
  }
  
  void update() {        
    pos.add(vel); 
  }
  
  boolean offScreen() {
    return (pos.x > width + len || pos.x < -len || pos.y > height + len || pos.y < -len);
  }
  
  void show() {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rotation);
    stroke(220, 0, 200);
    strokeWeight(3);
    line(0,0,len,0);
    popMatrix();
  }
  



}
