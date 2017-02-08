class FloatingTrend {
  
  // uses a twitter4j Trend
  private Trend trend;
  private PVector pos;
  private float speed;
  private int textSize;
  // The textWidth of the trend name
  private float textWidth;
  
  public FloatingTrend(Trend trend, float x, float y, int textSize) {
    this.textSize = textSize;
    this.trend = trend;
    // specify textSize before calculating the width of the text
    textSize(textSize);
    textWidth = textWidth(trend.getName());
    // The textSize specifies how fast the text flows over the screen
    speed = textSize * 0.1;
    pos = new PVector(x,y);
  }
  
  public void update() {
    this.pos.x -= speed;
    if(this.pos.x + textWidth < 0) {
      this.pos.x = width;
    }
  }
  
  public void show() {
    fill(255, map(textSize, 8, 20, 50, 150));
    textSize(textSize);
    text(trend.getName(), pos.x, pos.y);
  }
  
}