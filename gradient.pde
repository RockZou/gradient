//import processing.video.*;

Maxim maxim;
AudioPlayer player;

int colorLoopIndex=0;

void setup()
{
  //size(100,100);
  maxim=new Maxim(this);
  
  player = maxim.loadFile("mybeat.wav");
  player.setAnalysing(true);
  player.setLooping(true);
  player.play();
  colorMode(HSB);
  ellipseMode(CENTER);
  noStroke();
  background(0);
}

void draw()
{
  background(0);
  //player.play();
  float power=player.getAveragePower();
  colorLoopIndex+=power*50;
  //background(255);
  translate(mouseX,mouseY);
  for (int i=50;i>0;i--)
  {
    int theColor=(colorLoopIndex+i*5)%255;
    fill(theColor, power*512, 255);
    ellipse(0,0,width*2/50*i,height*2/50*i);
  }
}

