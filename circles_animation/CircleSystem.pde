class System {
  ArrayList<Circle> circles;
  boolean destroying; 
  System() {
    circles = new ArrayList<Circle>();
    destroying = false;
  }

  void run() {
    kill();
    for (Circle circle : circles) {
      circle.check(circles);
      circle.update();
      circle.show();
    }
  }

  void adding(PImage i) {
    for (int n = 0; n < 20; n++) {
      Circle c = addCircle(i);
      if (c != null) circles.add(c);
    }
  }

  void kill() {
    if (circles.size() > 2000) destroying = true;
  }

  void destroy() {
    for (int i = circles.size()-1; i >= 0; i--) {
      Circle c = circles.get(i);

      c.destroy = true;
      if (c.isDead) {        
        circles.remove(i);
      }
    }
  }

  Circle addCircle(PImage i) {
    int x = int(random(width));
    int y = int(random(height));

    for (Circle c : circles) {
      float d = dist(c.pos.x, c.pos.y, x, y);
      if (d < c.r) {
        addCircle(i);
        return null;
      }
    }
    i.loadPixels();
    int index = x + y * width;
    color c = i.pixels[index];
    i.updatePixels();
    return new Circle(x, y, c);
  }

  boolean isDestroyed() {
    if (circles.size() <= 0) {    
      return true;
    } else return false;
  }
}
