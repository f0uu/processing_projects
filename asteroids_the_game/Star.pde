class Star {
  float x; 
  float y;
  float weight;
  float alpha;
  
  Star(float x_, float y_, float w) {
    x = x_;
    y = y_;
    weight = w;
    alpha = map(weight, 0.5, 3, 50, 255);
  }
  
  void show() {
    strokeWeight(weight);
    stroke(255, alpha);
    point(x,y);
  }

}
