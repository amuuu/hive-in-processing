
ArrayList<Float> pointsx;
ArrayList<Float> pointsy;

ArrayList<PShape> shapes;

float angle = TWO_PI/6;
float x = 500;
float y = 700;
float radius = 20;  
int MAX = 20;

void setup()
{
  size(1000,1000,P2D);
  background(0);
  
  shapes = new ArrayList<PShape>();   
  pointsx  = new ArrayList<Float>();
  pointsy  = new ArrayList<Float>();
  
  FillScreen(x,y, 0);
}

void draw()
{
 for(int i=0;i<shapes.size();i++) {
   shape(shapes.get(i));
 }
}

void FillScreen(float x, float y, int m)
{
  if(m<MAX)
  {
    int oldsize = pointsx.size();
    if(m==0)
      AddNeighbors(x,y,255,255,100);
    else
      AddNeighbors(x,y,200,200,200);
    
    for(int i = oldsize; i < pointsx.size(); i++)
      FillScreen(pointsx.get(i), pointsy.get(i), ++m);
  }
  else
    return;
 
}
void AddNeighbors(float x, float y, int r, int g, int b)
{
  for(int i=0;i<7;i++)
    AddToList(x,y,i,r,g,b);
}

void AddToList(float x, float y, int dir, int r, int g, int b)
{
  float nx = GetX(dir, x, y);
  float ny = GetY(dir, x, y);

  if (!PointExists(nx,ny))
  {
    pointsx.add(nx);
    pointsy.add(ny); 
    shapes.add(DrawShape(nx,ny, r,g,b));
  }
}

PShape DrawShape(float x, float y, int r, int g, int b)
{
  PShape s = createShape();
  
  s.beginShape();
  s.fill(color(r,g,b));
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    s.vertex(sx, sy);
  }
  s.endShape(CLOSE);
  
  return s;
  
}

float GetX(int where, float x, float y)
{
  switch(where)
  {
    //1u 2ur 3ul 4dr 5dl 6d
    case 0: return x;
    case 1: return x;
    case 2: return x + radius + radius * cos(angle); 
    case 3: return x - (radius + radius * cos(angle));
    case 4: return x + radius + radius * cos(angle); 
    case 5: return x - (radius + radius * cos(angle));
    case 6: return x; 
  }
  return -1;
}

float GetY(int where, float x, float y)
{
  switch(where)
  {
    case 0: return y;
    case 1: return y - 2*radius * sin(angle); 
    case 2: return y - radius * sin(angle);
    case 3: return y - radius * sin(angle);
    case 4: return y + radius * sin(angle);
    case 5: return y + radius * sin(angle); 
    case 6: return y + 2*radius * sin(angle); 
  }
  return -1;
}

boolean PointExists(float x, float y)
{
  for (int i=0;i<pointsx.size(); i++)
    if (x==pointsx.get(i) && y==pointsy.get(i))
      return true;
  
  return false;
}
