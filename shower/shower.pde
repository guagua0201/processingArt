int cnt = 0;
float R1,G1,B1,R2,G2,B2;
float GG(float c1,float c2,float per){
  return (c1*per + c2*(1.0-per));
}
void drawLine(int stx,int sty,int nx,int ny){
  float r1,g1,b1,r2,g2,b2,r3,g3,b3;
  r1 = R1;
  g1 = G1;
  b1 = B1;
  r2 = R2;
  g2 = G2;
  b2 = B2;
  r3 = 242;
  g3 = 245;
  b3 = 168; 
  int midx = 750;
  int midy = 450;
  float wei = (float)(((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy))/20000);
      //fill(127,0,0);
      if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 120000 ){
          //ellipse(nx,ny,wei,wei);
          float nowP = ((nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) - 0)/120000;
          stroke(GG(r2,r1,nowP),GG(g2,g1,nowP),GG(b2,b1,nowP));
          strokeWeight(wei/8);
          line(stx,sty,nx,ny);
     }
     else if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 140000 ){
     }
}
void setup() {
  size(1500,900);
  for(int all=0;all<=200;all=all+1){
    background(0);
    R1 = random(0,255);
    G1 = random(0,255);
    B1 = random(0,255);
    R2 = random(0,255);
    G2 = random(0,255);
    B2 = random(0,255);
    int midx = 750;
    int midy = 450;
    int stx = 750;
    int sty = 450;
    for(int t=0;t<3;t++){
      stx = 750;
      sty = 450;
      for(int i=0;i<1500;i++){
        int nx,ny;
        nx = (int)((1-(random(0,1))*(random(0,1)))*1500);
        ny = (int)((1-(random(0,1))*(random(0,1)))*900);
        if( (nx-midx)*(nx-midx) + (ny-midy)*(ny-midy) <= 170000 ){
          for(float j=0.1;j<=1.0;j+=0.1){
             drawLine((int)(stx+(j-0.1)*(nx-stx)),(int)(sty+(j-0.1)*(ny-sty)),(int)(stx+j*(nx-stx)),(int)(sty+j*(ny-sty)));   
          }
          stx = nx;
          sty = ny;
        }
      }
    }
    saveFrame("C:/Users/fishtoby/Desktop/procssing_shower/"+str(cnt)+".png");
    cnt++;
  }
}
void draw() {
}