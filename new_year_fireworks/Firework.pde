class Firework {

  ArrayList<Ball> particles;
  PVector pos;
  PVector acc;

  Firework(float x, float y) {
    
    particles = new ArrayList<Ball>();
    pos = new PVector(x, y);
    acc = new PVector(0, random(-20, -10));
    adding();
    
  }


  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Ball particle = particles.get(i);
      particle.run();

      if (particle.isDead()) {
        particles.remove(i);
      }
    }
  }


  void adding() {
    int k = int(random(10, 20));
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    for (int i = 0; i < k; i++) {
      particles.add(new Ball(pos.x, pos.y, acc, color(r,g,b)));
    }
  }
}
