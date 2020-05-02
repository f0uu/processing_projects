class ParticleSystem {

  ArrayList<Particle> particles;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  void adding(float x, float y, PVector force) {
    particles.add(new Particle(x,y, force));
  }
  
  void run() {
    for(int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if(p.isDead) particles.remove(i);
    }
  }

}
