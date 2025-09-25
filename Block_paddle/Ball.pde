class Ball {
  float x, y, r;
  float vx, vy;

  Ball() {
    r = 30;
    x = width / 2;
    y = height / 2;
    vx = random(2, 4) * (random(1) < 0.5 ? -1 : 1);
    vy = -3;
  }

  void update() {
    x += vx;
    y += vy;

    if (x < r || x > width - r) vx *= -1;
    if (y < r) vy *= -1;
  }

void display() {
  image(ballImg, x - r, y - r, r * 2, r * 2);  // 中心に合わせて描画
}

  void checkPaddle(Paddle p) {
    if (y + r > p.y && y + r < p.y + p.h &&
        x > p.x && x < p.x + p.w) {
      vy *= -1;
      y = p.y - r;
      float offset = (x - (p.x + p.w / 2)) / p.w;
      vx = 5 * offset;
    }
  }

  void checkBlocks(ArrayList<Block> blkList) {
    for (Block blk : blkList) {
      if (blk.hp > 0 &&
          x > blk.x && x < blk.x + blk.w &&
          y > blk.y && y < blk.y + blk.h) {
        vy *= -1;
        blk.hp--;
        score += 10;
        break;
      }
    }
  }

  boolean isDead() {
    return y > height;
  }
}
