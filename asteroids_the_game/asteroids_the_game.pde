//background
StarSystem background;
int len = 500;

//ship
Ship ship;

//asteroids
int lvl = 1;
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>();

void setup() {
  //size(800,800);
  fullScreen();
  background = new StarSystem(len);
  ship = new Ship(width/2,height/2,20);
  setAsteroids();

}

void draw() {
  background(0);
  background.show();
  
  //ship
  ship.run();
  ship.laser();
  
  //asteroids
    for(int i = 0; i < asteroids.size(); i++) {
    Asteroids a = asteroids.get(i);
    a.run();
    if(a.isShooted(ship)) asteroids.remove(i);
    ship.collision(a);
  }
  
  if(asteroids.size() == 0) {
    setAsteroids();
    lvl++;
  }
}

void setAsteroids() {
  int total = 5 + (2 * lvl);
    for(int i = 0; i < total; i++) {
    float x = random(width);
    float y = random(height);
    float r = random(32,64);
    asteroids.add(new Asteroids(x,y,r));
  }
}

void keyPressed() {
  if(key == CODED && keyCode == LEFT) ship.setRotation(-0.07); 
  if(key == CODED && keyCode == RIGHT) ship.setRotation(0.07); 
  
  if(keyPressed && key == 'z') ship.isBoost = true;
}

void keyReleased() {
  if(key == 'x' || key == 'X') ship.ammo.add(new Laser(ship.pos.x,ship.pos.y,ship.angle));
  if(key == CODED && (keyCode == LEFT || keyCode == RIGHT)) ship.setRotation(0);
  
  if(key == 'z') ship.isBoost = false;
}
