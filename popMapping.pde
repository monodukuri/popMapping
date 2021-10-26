
int space = 100;
int kosuX;
int kosuY;
int[][] zahyoX;
int[][] zahyoY;
int randomi ;
int randomj ;


void setup() {
  fullScreen(P3D);
  kosuX = width/space;
  kosuY = height/space;
  zahyoX = new int[kosuX][kosuY];
  zahyoY = new int[kosuX][kosuY];

  randomi = (int)random(0, kosuX);
  randomj = kosuY - 1;
  for (int i = 0; i<kosuX; i++) {
    for (int j = 0; j<kosuY; j++) {
      zahyoX[i][j] = space*i;
      zahyoY[i][j] = space*j;
    }
  }
}

void draw() {
  background(0);
  ambientLight(50,50,50);
  spotLight(255, 255, 255, mouseX, mouseY, 500,0,0,-1,PI,0.1);
  if (zahyoY[randomi][randomj] >height*1.5) {
    randomi = (int)random(0, kosuX);
    for (int j = 0; j<kosuY; j++) {
      if (zahyoY[randomi][j]<height) {
        randomj = j;
      }
    }
  }
  zahyoY[randomi][randomj] = zahyoY[randomi][randomj] +10;
  for (int i = 0; i<kosuX; i++) {
    for (int j = 0; j<kosuY; j++) {
      pushMatrix();
      translate(zahyoX[i][j], zahyoY[i][j], -100);
      box(100);
      popMatrix();
    }
  }
}
