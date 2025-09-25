class Block {
  float x, y, w, h;
  int hp;

  Block(float _x, float _y) {
    x = _x;
    y = _y;
    w = 50;
    h = 20;
    hp = 2;  // 2回当たると消える
  }

  void display() {
    if (hp <= 0) return;
    if (hp == 2) fill(0, 150, 255);
    else fill(255, 150, 0);
    stroke(255);
    rect(x, y, w - 2, h - 2);
  }
}
