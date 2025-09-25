Paddle paddle;
ArrayList<Ball> balls;
ArrayList<Block> blocks;
int score = 0;
int lives = 3;
boolean gameOver = false;

PImage ballImg;

void setup() {
  size(600, 400);
  ballImg = loadImage("ball.png");
  paddle = new Paddle();
  balls = new ArrayList<Ball>();
  balls.add(new Ball());

  blocks = new ArrayList<Block>();
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 10; x++) {
      blocks.add(new Block(60 * x + 10, 30 * y + 50));
    }
  }
  textAlign(CENTER);
}

void draw() {
  background(30);
  // ゲームオーバー判定
  if (gameOver) {
    fill(255, 0, 0);
    textSize(36);
    text("Game Over", width/2, height/2);
    return;
  }

  paddle.update();
  paddle.display();

  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    b.update();
    b.checkPaddle(paddle);
    b.checkBlocks(blocks);
    b.display();

    if (b.isDead()) {
      balls.remove(i);
      if (balls.size() == 0) {
        lives--;
        if (lives <= 0) {
          gameOver = true;
        } else {
          balls.add(new Ball());
        }
      }
    }
  }

  for (Block blk : blocks) {
    blk.display();
  }

  fill(255);
  textSize(16);
  text("Score: " + score + "   Lives: " + lives, width/2, 20);
}
