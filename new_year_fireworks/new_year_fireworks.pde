ArrayList<Firework> fireworks;
ArrayList<PVector> spots;
System circle;
PImage img;

void setup() {

  size(1200, 1000);
  rectMode(CENTER);

  spots = new ArrayList<PVector>();
  fireworks = new ArrayList<Firework>();

  img = loadImage("nye.png");
  setupImage();

  circle = new System();
}

void setupImage() {
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color col = img.pixels[index];
      float b = brightness(col);

      if (b > 1) {
        spots.add(new PVector(x, y));
      }
    }
  }
  img.updatePixels();
}

void draw() {
  println(frameCount);
  background(51);

  addFirework();
  showFireworks();

  for (Firework f : fireworks) {
    circle.colors(f);
  }
  circle.run();

}

void record() {
  saveFrame("gif/####.png");
}

void addFirework() {
 
    if (frameCount % 20 == 0) fireworks.add(new Firework(random(width), height));

}

void showFireworks() {
  for (int i = fireworks.size()-1; i >= 0; i--) {

    Firework f = fireworks.get(i);
    f.run();

    if (f.particles.size() == 0) {
      fireworks.remove(i);
    }
  }
}
