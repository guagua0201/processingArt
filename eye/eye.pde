
int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;

float GG(float c1,float c2,float per){
  return (c1*per + c2*(1.0-per));
}
void drawLine(int stx,int sty,int nx,int ny){
  float r1,g1,b1,r2,g2,b2,r3,g3,b3;
  
  r1 = 39;
  g1 = 91;
  b1 = 162;
  r2 = 67;
  g2 = 132;
  b2 = 222;
  
  
  r3 = 26;
  g3 = 104;
  b3 = 211;
  int midx = 750;
  int midy = 450;
  float wei = (float)(((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/20000);
      fill(127,0,0);
    
      int centerP = 60;
      int centerP2 = 50;
      //if((int)random(0,100)<=centerP){
          if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 2000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/2000; 
            stroke(GG(r1,36,nowP),GG(b1,81,nowP),GG(g1,142,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
          }
      //}
      //else if((int)random(0,100)<=centerP2){
        else if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 90000 ){
            //ellipse(nx,ny,wei,wei);
            
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 2000)/88000;
            stroke(GG(r2,r1,nowP),GG(g2,g1,nowP),GG(b2,b1,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
        }
      //}
      //else{
        else if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 90000)/80000;
            nowP = random(0,1);
            stroke(GG(r3,r2,nowP),GG(g3,g2,nowP),GG(b3,b2,nowP));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
        }
      //}
}
void drawLine2(int stx,int sty,int nx,int ny){
  float r1,g1,b1,r2,g2,b2,r3,g3,b3;
  
  r1 = 194;
  g1 = 83;
  b1 = 211;
  r2 = 167;
  g2 = 70;
  b2 = 183;
  
  
  r3 = 201;
  g3 = 119;
  b3 = 214;
  int midx = 750;
  int midy = 450;
  float wei = (float)(((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/20000);
      fill(127,0,0);
    
      int centerP = 60;
      int centerP2 = 50;
      //if((int)random(0,100)<=centerP){
          if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 2000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/2000; 
            stroke(GG(r1,169,nowP),GG(b1,62,nowP),GG(g1,185,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
          }
      //}
      //else if((int)random(0,100)<=centerP2){
        else if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 90000 ){
            //ellipse(nx,ny,wei,wei);
            
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 2000)/88000;
            stroke(GG(r2,r1,nowP),GG(g2,g1,nowP),GG(b2,b1,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
        }
      //}
      //else{
        else if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 90000)/80000;
            nowP = random(0,1);
            stroke(GG(r3,r2,nowP),GG(g3,g2,nowP),GG(b3,b2,nowP));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
        }
      //}
}


void setup() {
  size(1500,900);
  background(0);
  
  int midx = 750;
  int midy = 450;
  
  int stx = 750;
  int sty = 450;
  
  
  
  
  double cenx,ceny;
  cenx = 750;
  ceny = 450;
  for(int t=0;t<5;t++){
    stx = 750;
    sty = 450;
    for(int i=0;i<1000;i++){
      float cenp = (1.0 - (((stx - midx) * (stx - midx) + (sty - midy) * (sty - midy)) / 170000))*10 ;
      double del =( (stx - cenx) * (stx - cenx) + (sty - ceny) * (sty - ceny) ) / (float)680000;
      int nx,ny;
      float sita = random(0,360);
      nx = 750+(int)(cos(radians(sita))*random(0,412.6213));
      ny = 450+(int)(sin(radians(sita))*random(0,412.6213));
      println(nx,",",ny);
      
      //nx = (int)(((random(0,1))*(random(0,1)))*750);
      //ny = (int)(((random(0,1))*(random(0,1)))*450);
      //if(random(0,101) <= 50) nx = 750+nx;
      //else nx = 750-nx;
      //if(random(0,101) <= 50) ny = 450+ny;
      //else ny = 450-ny;
      if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
        for(float j=0.1;j<=1.0;j+=0.1){
           drawLine((int)(stx+(j-0.1)*(nx-stx)),(int)(sty+(j-0.1)*(ny-sty)),(int)(stx+j*(nx-stx)),(int)(sty+j*(ny-sty)));   
        }
        stx = nx;
        sty = ny;
      } 
    }
  } 
  
  
  for(int t=0;t<5;t++){
    stx = 750;
    sty = 450;
    for(int i=0;i<1000;i++){
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
      float sita = random(0,360);
      nx = 750+(int)(cos(radians(sita))*random(0,412.6213));
      ny = 450+(int)(sin(radians(sita))*random(412.6213));
      println(nx,",",ny);
      
      //nx = (int)(((random(0,1))*(random(0,1)))*750);
      //ny = (int)(((random(0,1))*(random(0,1)))*450);
      //if(random(0,101) <= 50) nx = 750+nx;
      //else nx = 750-nx;
      //if(random(0,101) <= 50) ny = 450+ny;
      //else ny = 450-ny;
      if( 2*(nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 50000 ){
        for(float j=0.1;j<=1.0;j+=0.1){
           drawLine2((int)(stx+(j-0.1)*(nx-stx)),(int)(sty+(j-0.1)*(ny-sty)),(int)(stx+j*(nx-stx)),(int)(sty+j*(ny-sty)));   
        }
        stx = nx;
        sty = ny;
      } 
    }
  }
  
  
  
  
}

void draw() {
}