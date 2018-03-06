
int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(1500,900);
  background(0);
  
  int midx = 750;
  int midy = 450;
  
  int stx = 750;
  int sty = 450;
  
  double r1,g1,b1,r2,g2,b2;
  r1 = 197;
  g1 = 143;
  b1 = 239;
  r2 = 255;
  g2 = 221;
  b2 = 169;
  
  double cenx,ceny;
  cenx = 600;
  ceny = 750;
  for(int t=0;t<3;t++){
    stx = 750;
    sty = 450;
    for(int i=0;i<1500;i++){
      float cenp = (1.0 - (((stx - midx) * (stx - midx) + (sty - midy) * (sty - midy)) / 170000))*10 ;
      double del =( (stx - cenx) * (stx - cenx) + (sty - ceny) * (sty - ceny) ) / (float)680000;
      /*float rgx = random(1,200)*cenp;
      float rgy = random(1,2000)*cenp;
      double dx = random(-rgx,rgx+1);
      double dy = random(-rgy,rgy+1); 
     
      ellipse((float)(stx+dx),(float)(sty+dy),(float)2,(float)2);
      if( (stx + dx - midx) * (stx + dx - midx) + (sty + dy - midy) * (sty + dy - midy) <= 170000){
          
          
          stroke((float)(r1*del+r2*(1.0-del)),(float)(g1*del+g2*(1.0-del)),(float)(b1*del+b2*(1.0-del)));
          line((float)(stx),(float)(sty),(float)(stx+dx),(float)(sty+dy));
          stx+=dx;
          sty+=dy;
      } */
      int nx,ny;
      nx = (int)random(0,1500);
      ny = (int)random(0,900);
      float wei = (float)(((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/20000);
      fill(127,0,0);

      int centerP = 60;
      int centerP2 = 50;
      if((int)random(0,100)<=centerP){
          if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 50000 ){
            //ellipse(nx,ny,wei,wei);
            stroke((float)(r1*del+r2*(1.0-del)),(float)(g1*del+g2*(1.0-del)),(float)(b1*del+b2*(1.0-del)));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
          }
      }
      else if((int)random(0,100)<=centerP2){
        if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 80000 ){
            //ellipse(nx,ny,wei,wei);
            stroke((float)(r1*del+r2*(1.0-del)),(float)(g1*del+g2*(1.0-del)),(float)(b1*del+b2*(1.0-del)));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
        }
      }
      else{
        if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
            //ellipse(nx,ny,wei,wei);
            stroke((float)(r1*del+r2*(1.0-del)),(float)(g1*del+g2*(1.0-del)),(float)(b1*del+b2*(1.0-del)));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
        }
      }
      
        
    }
  }
}

void draw() {
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = random(-10,11);
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}