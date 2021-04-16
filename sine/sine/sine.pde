float f, valsin,valcos,valtan;
float x=400, y=400;
float radius = 120;
float margin = 20;
float s1, s2, s3;
int counter=0;

void setup()
{
  size(800, 800, P2D);
  frameRate(12);
  background(0);
  
  s1 = random(15,40);
  s2 = random(15,40);
}

void draw()
{
  counter++;
  if(counter%97==0)
  {
    frameRate(random(9,12));
    counter = 0;
  }
  background(0);
  valsin = sin(f);
  valcos = cos(f);
  valtan = tan(f);
  
  if (valtan>0.9) valtan=0.5;
  if (valtan<-0.9) valtan=-0.5;
  
  f++;
  
  for (int i=0;i<100; i++)
  {
    if(random(0,10)>7)
    {
      noStroke();
      fill(random(0,255));
      circle(x+random(-1*radius,radius)+margin,y+random(-1*radius,radius)+margin,s1*valsin);
    }
    if(random(0,10)>7)
    {
      noStroke();
      fill(random(0,255));
      rect(x+s2+random(-1*radius,radius)+margin,y-s2+random(-1*radius,radius)+margin,-1*s2*valcos,-1*s2*valcos);
    }
    if(random(0,10)>4 && (i%4==0))
    {
      noStroke();
      fill(random(0,255));
      rect(x-s1-s2+random(-1*radius,radius)+margin,y-s2-s1+random(-1*radius,radius)+margin,s1*valtan,s1*valtan);
    }
    
    if(random(0,10)>7 && (i%3==0))
    {
      noStroke();
      fill(random(0,255));
      rect(x+s1+s2+random(-1*radius,radius)+margin,y-s1-s2+random(-1*radius,radius)+margin,-1*s2*valcos,-1*s2*valcos);
    }
  }
}
