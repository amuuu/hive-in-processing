
ArrayList<Float> pointsx;
ArrayList<Float> pointsy;

ArrayList<PShape> shapes;

float angle = TWO_PI/6;
float x = 500;
float y = 500;
float radius = 40;  
int MAX = 45;

int[]choosenRs;
int[]choosenGs;
int[]choosenBs;
int colorsnum = 8;

void setup()
{
  size(800, 800, P3D);
  frameRate(24);
  background(0);
  lights();

  shapes = new ArrayList<PShape>();   
  pointsx  = new ArrayList<Float>();
  pointsy  = new ArrayList<Float>();

  choosenRs = new int[] {144, 180, 170, 128, 112,154, 41, 0};
  choosenGs = new int []{48, 90, 75, 38, 156,195,124, 62};
  choosenBs = new int [] {90, 129, 57, 21, 52,97,69, 21};

  FillScreen(x, y, 0);
}

void draw()
{
  pushMatrix();
  translate(random(0, width/2), random(0, height/2), 0);
  background(0);
  rotateY(0.25*random(0, 2));
  rotateX(-0.4*random(0, 2));
  for (int i=0; i<shapes.size()-random(0, 20); i++) {
    shape(shapes.get(i));
  }
  popMatrix();
}

void FillScreen(float x, float y, int m)
{
  if (m<MAX)
  {
    int oldsize = pointsx.size();

    int choice = (int)random(0,colorsnum);
    AddNeighbors(x, y, choosenRs[choice], choosenGs[choice], choosenBs[choice]);

    for (int i = oldsize; i < pointsx.size(); i++)
      FillScreen(pointsx.get(i), pointsy.get(i), ++m);
  } else
    return;
}
void AddNeighbors(float x, float y, int r, int g, int b)
{
  for (int i=0; i<7; i++)
    AddToList(x, y, i, r, g, b);
}

void AddToList(float x, float y, int dir, int r, int g, int b)
{
  float nx = GetX(dir, x, y);
  float ny = GetY(dir, x, y);

  if (!PointExists(nx, ny))
  {
    pointsx.add(nx);
    pointsy.add(ny); 
    shapes.add(DrawShape(nx, ny, r, g, b));
  }
}

PShape DrawShape(float x, float y, int r, int g, int b)
{
  PShape s = createShape();

  s.beginShape();
  s.fill(color(r, g, b));
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    s.vertex(sx, sy, radius);
    s.vertex(sx-1*radius, sy-1*radius, 2*radius);
  }

  s.endShape(CLOSE);

  return s;
}

float GetX(int where, float x, float y)
{
  switch(where)
  {
    //1u 2ur 3ul 4dr 5dl 6d
  case 0: 
    return x;
  case 1: 
    return x;
  case 2: 
    return x + radius + radius * cos(angle); 
  case 3: 
    return x - (radius + radius * cos(angle));
  case 4: 
    return x + radius + radius * cos(angle); 
  case 5: 
    return x - (radius + radius * cos(angle));
  case 6: 
    return x;
  }
  return -1;
}

float GetY(int where, float x, float y)
{
  switch(where)
  {
  case 0: 
    return y;
  case 1: 
    return y - 2*radius * sin(angle); 
  case 2: 
    return y - radius * sin(angle);
  case 3: 
    return y - radius * sin(angle);
  case 4: 
    return y + radius * sin(angle);
  case 5: 
    return y + radius * sin(angle); 
  case 6: 
    return y + 2*radius * sin(angle);
  }
  return -1;
}

boolean PointExists(float x, float y)
{
  for (int i=0; i<pointsx.size(); i++)
    if (x==pointsx.get(i) && y==pointsy.get(i))
      return true;

  return false;
}
