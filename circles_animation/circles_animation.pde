ArrayList<Circle> circles;
PImage img;

void setup() {
  size(800, 580);
  circles = new ArrayList<Circle>();
  img = loadImage("cube.jpg");
}

void draw() {
  background(255);


  if (circles.size() < 10000) {
    for (int i = 0; i < 20; i++) {
      Circle c = addCircle();
      if (c != null) circles.add(c);
    }
  }

  for (Circle circle : circles) {
    circle.check(circles);
    circle.update();
    circle.show();
  }
}

Circle addCircle() {
  int x = int(random(width));
  int y = int(random(height));

  for (Circle c : circles) {
    float d = dist(c.pos.x, c.pos.y, x, y);
    if (d < c.r) {
      addCircle();
      return null;
    }
  }
  img.loadPixels();
  int index = x + y * width;
  color c = img.pixels[index];
  img.updatePixels();
  return new Circle(x, y, c);
}
