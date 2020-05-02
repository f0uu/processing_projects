class Ship {

  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float angle = 0;
  float rotation = 0;
  boolean isBoost = false;
  int life = 3;
  boolean isLife = true;
  int score = 0;
  
  ParticleSystem ps = new ParticleSystem();
  
  ArrayList<Laser> ammo = new ArrayList<Laser>();
  int index = 0;

  Ship(float x, float y, float len) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    r = len;
  }

  void run() {
    if(isLife) {
    boost();
    update();
    rotating();
    show();
    } else if(isLife == false) isDead();
  }

  void update() {
    edges();
    vel.add(acc);
   
    vel.limit(10);
    vel.mult(0.95);
    pos.add(vel);
    acc.mult(0);
    
    ps.run();
    
    if(life == 0)   isLife = false;
  }
  
  void isDead() {
      textSize(128);
      fill(255,0,0);
      text("GAME OVER", width * (2/3), height/2);
  }
  
  void edges() {
    if(pos.x > width+r) pos.x = 0;
    else if(pos.x < -r) pos.x = width;
    
    if(pos.y > height+r) pos.y = 0;
    else if(pos.y < -r) pos.y = height;
  }
  
  void boost() {
    if(isBoost) {
      PVector dir = PVector.fromAngle(angle - PI/2);
      vel.add(dir);
      
      ps.adding(pos.x,pos.y,dir.mult(-2));
    }
  }
  
  void rotating() {
    angle += rotation;
  }
  
  void setRotation(float a) {
    rotation = a;
  }

  void show() {  
    textSize(32);
    fill(255);
    String text = "|| Lifes: " + life + " || Score: " + score + " || Level: " + lvl + " ||";
    text(text,10,35);
    
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    strokeWeight(2);
    stroke(220, 0, 200);
    fill(200);
    triangle(-r, r, r, r, 0, -r);
    popMatrix();
  }
  
  
  void laser() {
      
    for(int i = 0; i < ammo.size(); i++) {
    Laser l = ammo.get(i);
    l.update();
    l.show();
    if(l.offScreen()) {
      ammo.remove(i);

      }
    } 
  }
  
  void collision(Asteroids a) {
    float d = dist(a.pos.x,a.pos.y,pos.x,pos.y);
    if(d <= a.r) {
      pos.set(width/2,height/2,0);
      life--;
    }
  }
}
