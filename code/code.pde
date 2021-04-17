String[] lines;
boolean textDisplayed;
float paddingX = 10;
float paddingY = 20;
float lineSpace = 16;
float fontSize = 14;

void setup()
{
  background(0);
  size(800, 800, P2D);
  lines = loadStrings("code.pde");
  textDisplayed=false;
}

void draw()
{
  if(!textDisplayed)
  {
    for (int i = 0 ; i < lines.length; i++)
    {
      noStroke()
      textSize(fontSize);
      fill(255);
      text(lines[i], paddingX, i*lineSpace+paddingY);
    }
    textDisplayed=true;
  }
}
