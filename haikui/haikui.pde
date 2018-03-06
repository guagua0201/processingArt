float GG(float c1,float c2,float per){
  return (c1*per + c2*(1.0-per));
}
void drawLine(int stx,int sty,int nx,int ny){
  float r1,g1,b1,r2,g2,b2,r3,g3,b3;
  r1 = 36;
  g1 = 211;
  b1 = 189;
  r2 = 63;
  g2 = 160;
  b2 = 148;
  r3 = 242;
  g3 = 245;
  b3 = 168;
  int midx = 750;
  int midy = 450;
  float wei = (float)(((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/20000);
      fill(127,0,0);
      int centerP = 60;
      int centerP2 = 50;
      if((int)random(0,100)<=centerP){
          if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 50000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/50000; 
            stroke(GG(r1,255.0,nowP),GG(b1,255.0,nowP),GG(g1,255.0,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
          }
      }
      else if((int)random(0,100)<=centerP2){
        if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 80000 ){
            //ellipse(nx,ny,wei,wei);
            
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 50000)/30000;
            stroke(GG(r2,r1,nowP),GG(g2,g1,nowP),GG(b2,b1,nowP));
            
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
        }
      }
      else{
        if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
            //ellipse(nx,ny,wei,wei);
            float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 80000)/90000;
            stroke(GG(r3,r2,nowP),GG(g3,g2,nowP),GG(b3,b2,nowP));
            strokeWeight(wei/8);
            line((float)(stx),(float)(sty),(float)(nx),(float)(ny));
            stx = nx;
            sty = ny;
        }
      }
}
void setup() {
  size(1500,900);
  background(0);
  int midx = 750;
  int midy = 450;
  int stx = 750;
  int sty = 450;
  int cnt = 0;
  double cenx,ceny;
  cenx = 750;
  ceny = 450;
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
      if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
        for(float j=0.1;j<=1.0;j+=0.1){
           drawLine((int)(stx+(j-0.1)*(nx-stx)),(int)(sty+(j-0.1)*(ny-sty)),(int)(stx+j*(nx-stx)),(int)(sty+j*(ny-sty)));   
        }
      } 
    }
    saveFrame("C:/Users/fishtoby/Desktop/procssing_haikui/"+str(cnt)+".png");
    cnt = cnt+1;
  }
}
void draw() {
}