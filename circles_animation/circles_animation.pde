System circles;
int current = 0;
PImage[] imgs;


void setup() {
  size(800, 580);
  circles = new System();

  imgs = new PImage[5];
  imgs[0] = loadImage("cube.jpg");
  imgs[1] = loadImage("plant.jpg");
  imgs[2] = loadImage("pad.jpg");
  imgs[3] = loadImage("mercedes.jpg");
  imgs[4] = loadImage("art.jpg");
}

void draw() {
  background(255);


  if (circles.destroying) circles.destroy();
  else circles.adding(imgs[current]);

  circles.run();

  if (circles.isDestroyed()) {
    if(current < 4) current++;
    else current = 0;
    circles.destroying = false;
  }
}
