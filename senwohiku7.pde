ten[] others;
ten center = new ten(0, 0);
sen[] waku;

void setup() {

  size(640, 360);
  
  
  int yoko = 16;
  int tate = 9;

  others = new ten[tate*yoko];

  float f = 15;
  for (int i = 0; i < others.length; i++) {
    others[i] = new ten(
      (0.5+i/tate)*(width /yoko)+random(-f, f), 
      (0.5+i%tate)*(height/tate)+random(-f, f));
  }

  sen[] _waku = {
    new sen(1, 0, 0), 
    new sen(0, 1, 0), 
    new sen(1, 0, width), 
    new sen(0, 1, height)
  };
  waku = _waku;

  ten[] hoge = new ten[others.length-1];

  for (int j = 0; j<others.length; j++) {
    int counter = 0;
    for (int i = 0; i < others.length; i++) {
      if (i == j) {
        center = others[i];
      } else {
        hoge[counter] = others[i];
        counter++;
      }
    }

    center.bnkt = bunkatsu(center, hoge);
  }
}

void draw() {
 
  background(255);

  stroke(0,0,0,80);
  fill(0, 0, 0, 128);

  for (ten lion : others) {
    beginShape();
    for (ten rabbit : lion.bnkt) {
      vertex(rabbit.x, rabbit.y);
    }
    endShape(CLOSE);
  }
  
  println(frameRate);
}