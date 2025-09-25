class Paddle {
  float x, y, w, h;

  Paddle() {
    w = 100;
    h = 10;
    y = height - 30;
  }

  void update() {
    x = constrain(mouseX - w / 2, 0, width - w);
  }

  void display() {
    fill(255);
    rect(x, y, w, h);
  }
}
