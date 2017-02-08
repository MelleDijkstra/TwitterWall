String c_key = "YOUR_KEY";
String c_secret = "YOUR_SECRET";

String a_token = "YOUR_TOKEN";
String a_token_secret = "YOUR_TOKEN_SECRET";

ConfigurationBuilder cb = new ConfigurationBuilder();

ArrayList<FloatingTrend> trends = new ArrayList<FloatingTrend>();

void setup() {
  // Set twitter stuff
  cb.setOAuthConsumerKey(c_key);
  cb.setOAuthConsumerSecret(c_secret);
  cb.setOAuthAccessToken(a_token);
  cb.setOAuthAccessTokenSecret(a_token_secret);
  
  fullScreen(2);
  
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  TrendsResources trendResources = twitter.trends();
  try {
    // Retrieve latest trending Trends from WOEID 1 (which is the world)
    Trends latestTrends = trendResources.getPlaceTrends(1);
    Trend[] latesttrends = latestTrends.getTrends();
    for(int i = 0; i < latesttrends.length; i++) {
      trends.add(new FloatingTrend(latesttrends[i],random(width, width + 400), random(height), (int)random(8,20)));
    }
  } catch(TwitterException e) {
    e.printStackTrace();
    System.out.println("Could not gather Trends");
  }
}

void draw() {
  background(50);
  for(FloatingTrend trend : trends) {
    trend.update();
    trend.show();
  }
}