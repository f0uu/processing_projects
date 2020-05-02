class StarSystem {
  
  ArrayList<Star> stars;
  int size;
  
  StarSystem(int size_) {
    stars = new ArrayList<Star>();
    size = size_;
    
        for(int i = 0; i < size; i++) {
      float x = random(width);
      float y = random(height);
      float w = random(0.5,3);
      stars.add(new Star(x,y,w));
    }
  }
  


  
  void show() {
    for(Star s : stars) {
      s.show();
    }  
  }
}
