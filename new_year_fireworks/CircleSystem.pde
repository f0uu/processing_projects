class System {
  ArrayList<Circle> circles;
  int amount = 2000;

  System() {
    circles = new ArrayList<Circle>();
    adding();
  }

  void run() {
    for (Circle c : circles) {
      c.check(circles);
      c.update();
      c.show();
    }
  }

  void adding() {
    for (int n = 0; n < amount; n++) {
      Circle c = addCircle();
      if (c != null) circles.add(c);
    }
  }

  Circle addCircle() {
    int index = int(random(0, spots.size()));
    PVector p = spots.get(index);

    float x = p.x;
    float y = p.y;

    boolean valid = true;

    for (Circle c : circles) {
      float d = dist(x, y, c.pos.x, c.pos.y);
      if (d < c.r) {
        valid = false;
        break;
      }
    }

    if (valid) return new Circle(x, y);
    else return null;
  }

  void colors(Firework f) {
    for (int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);

      for (int j = 0; j < f.particles.size(); j++) {
        Ball ball = f.particles.get(j);

        if (ball.life < 20) {
          break;
        } else {
          float d = dist(c.pos.x, c.pos.y, ball.pos.x, ball.pos.y);

          if (d < (c.r + ball.size)) {
            c.col = ball.col;
          }
        }
      }
    }
  }
}
