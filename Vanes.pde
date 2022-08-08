
PVector home = new PVector() ;
Vane vanes[][] ;
//Vane vanes_norm[][] ;

void setup() {
  size(800, 800) ;

  vanes = new Vane[42][42];
  //vanes_norm = new Vane[15][10];

  //Vane v = new Vane(new PVector(120, 100)) ;
  //v.draw() ;

  home.x = mouseX ;
  home.y = mouseY ;
  
  int i, j ;
  
  for(i = 0 ; i < vanes.length ; i++) {
    for(j = 0 ; j < vanes[0].length ; j++) {
      boolean isNormal = ((i % 2 == 0) == (j % 2 == 0)) ;
      //isNormal = true ;
      Vane v = new Vane(new PVector(i * 20, j * 20), isNormal) ;        
      vanes[i][j] = v ;
    }
  }

  //noLoop() ;
}

void draw() {
  int i, j ;
  
  //background(0, 127, 0) ;
  background(0, 0, 255) ;
  
  for (i = 0 ; i < vanes.length ; i++) {
    for(j = 0 ; j < vanes[0].length ; j++) {
        Vane v = vanes[i][j] ;
        v.pointTo(new PVector(mouseX, mouseY)) ;
        //v.pointTo(new PVector(400, 400)) ;
        v.draw() ;
    }
  }
}

void mouseMoved() {
  home.x = mouseX ;
  home.y = mouseY ;
  redraw() ;
}

/** 
A Vane is a vector that can pivot on one end, pointing to a target point (vector)
*/
class Vane extends PVector {
  PVector origin ;
  int len ;
  boolean isNormal ;

  
  Vane(PVector origin, boolean isNormal) {
    this.origin = origin ;
    this.len = 25 ;
    this.x = 0 ;
    this.y = len ;
    this.isNormal = isNormal ;
  }
  

  void pointTo(PVector target) {
    //PVector v = new PVector(target.x - this.origin.x, target.y - this.origin.y) ;
    //find the heading to the target using a PVector
    PVector v = PVector.sub(target, this.origin) ;
    float head = v.heading() ;
    
    if (isNormal) {
      this.x = 0 ;
      this.y = len ;
    } else {
      this.x = len ;
      this.y = 0 ;
    }
    this.rotate(head) ;
    //float d = this.origin.dist(target) ;
    //this.mult(d * 0.01) ;
  }
  
  void draw() {
    //strokeWeight(7) ;
    //stroke(100) ;
    float x1, y1, x2, y2 ;
    int ballDiameter = 6 ;
    x1 = this.origin.x + this.x ;
    y1 = this.origin.y + this.y ;
    //this.rotate(PI) ;
    this.mult(-1) ;
    x2 = this.origin.x + this.x ;
    y2 = this.origin.y + this.y ;
 
    stroke(0, 255, 0) ;
    fill(0, 255, 0) ;
    circle(x1, y1, ballDiameter) ;
    
    stroke(255, 0, 0) ;
    fill(255, 0, 0) ;    
    circle(x2, y2, ballDiameter) ;    
    //line(x1, y1, x2, y2) ;
    //line(this.origin.x, this.origin.y, this.origin.x + this.x, this.origin.y + this.y) ;
  }
  
  
}
