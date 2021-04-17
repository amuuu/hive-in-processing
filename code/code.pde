String[] lines;
boolean textDisplayed;
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
      println(lines[i]);
      textSize(14);
      fill(255);
      text(lines[i], 10, i*16+20);
    }
    textDisplayed=true;
  }
}
