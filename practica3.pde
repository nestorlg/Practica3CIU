PImage imagen_espacio;
PImage imagen_sol;
PImage imagen_tierra;
PImage imagen_luna;
PImage imagen_marte;
PImage imagen_venus;
PImage imagen_jupiter;
PImage imagen_neptuno;
PShape sol;
PShape tierra;
PShape luna;
PShape nave;
PShape marte;
PShape venus;
PShape jupiter;
PShape neptuno;
float a;
float b;
float angSol;
float pasoRotacionSol;
float xTierra;
float zTierra;
float movTierra;
float pasoTraslacionTierra;
float angXTierra;
float angYTierra;
float pasoRotacionTierra;
float xMarte;
float zMarte;
float movMarte;
float pasoTraslacionMarte;
float angXMarte;
float angYMarte;
float pasoRotacionMarte;
float xVenus;
float zVenus;
float movVenus;
float pasoTraslacionVenus;
float angXVenus;
float angYVenus;
float pasoRotacionVenus;
float xJupiter;
float zJupiter;
float movJupiter;
float pasoTraslacionJupiter;
float angXJupiter;
float angYJupiter;
float pasoRotacionJupiter;
float xNeptuno;
float zNeptuno;
float movNeptuno;
float pasoTraslacionNeptuno;
float angXNeptuno;
float angYNeptuno;
float pasoRotacionNeptuno;
float xLuna;
float zLuna;
float angLuna;
float movLuna;
float pasoTraslacionLuna;
float pasoRotacionLuna;
float xNave;
float yNave;
float zNave;
float perspectivaX;
float perspectivaY;

void setup () {
  size(695,521,P3D);
  stroke(0);
  imagen_espacio = loadImage("space.jpg");
  imagen_sol = loadImage("sol.jpg");
  imagen_tierra = loadImage("tierra.jpg");
  imagen_luna = loadImage("luna.jpg");
  imagen_marte = loadImage("marte.jpg");
  imagen_venus = loadImage("venus.jpg");
  imagen_jupiter = loadImage("jupiter.jpg");
  imagen_neptuno = loadImage("neptuno.jpg");
  a = 80;
  b = 40;
  angSol = 0;
  pasoRotacionSol = 0.014;
  xTierra = 0;
  zTierra = 0;
  movTierra = 1;
  pasoTraslacionTierra = 0.33333;
  angXTierra = 0;
  angYTierra = 0;
  pasoRotacionTierra = 0.12893;
  xMarte = 0;
  zMarte = 0;
  movMarte = 1;
  pasoTraslacionMarte = 0.2;
  angXMarte = 0;
  angYMarte = 0;
  pasoRotacionMarte = 0.1;
  xVenus = 0;
  zVenus = 0;
  movVenus = 1;
  pasoTraslacionVenus = 0.5;
  angXVenus = 0;
  angYVenus = 0;
  pasoRotacionVenus = 0.005;
  xJupiter = 0;
  zJupiter = 0;
  movJupiter = 1;
  pasoTraslacionJupiter = 0.058011;
  angXJupiter = 0;
  angYJupiter = 0;
  pasoRotacionJupiter = 0.03721;
  xNeptuno = 0;
  zNeptuno = 0;
  movNeptuno = 1;
  pasoTraslacionNeptuno = 0.07;
  angXNeptuno = 0;
  angYNeptuno = 0;
  pasoRotacionNeptuno = 0.12;
  xLuna = 0;
  zLuna = 0;
  movLuna = 1;
  pasoTraslacionLuna = 1.33333;
  pasoRotacionLuna = 0.05;
  xNave = 0;
  yNave = 0;
  zNave = 0;
  perspectivaX = 0;
  perspectivaY = 0;
}

void draw () {
  background(imagen_espacio);
  noStroke();
  text("Mueva el ratón para manejar la nave. Para acercar o alejar la nave, use la rueda del ratón.\nCon las flechas del teclado, podrá cambiar la perspectiva del espacio.",10,10);
  pushMatrix();
    translate(width/2,height/2,0);
    rotateX(perspectivaX);
    rotateY(perspectivaY);
    pushMatrix();
      rotateY(angSol);
      sol = createShape(SPHERE,70);
      beginShape();
      sol.setTexture(imagen_sol);
      endShape();
      shape(sol);
    popMatrix();
    pushMatrix();
      translate(xTierra,0,movTierra*zTierra);
      rotateY(angYTierra);
      tierra = createShape(SPHERE,22);
      beginShape();
      tierra.setTexture(imagen_tierra);
      endShape();
      shape(tierra);
      pushMatrix();
        scale(0.2);
        translate(xLuna,0,zLuna);
        rotateY(angLuna);
        luna = createShape(SPHERE,20);
        beginShape();
        luna.setTexture(imagen_luna);
        endShape();
        shape(luna);
      popMatrix();
    popMatrix();
    pushMatrix();
      translate(xMarte,0,movMarte*zMarte);
      rotateY(angYMarte);
      marte = createShape(SPHERE,24);
      beginShape();
      marte.setTexture(imagen_marte);
      endShape();
      shape(marte);
    popMatrix();
    pushMatrix();
      translate(xVenus,0,movVenus*zVenus);
      rotateY(angYVenus);
      venus = createShape(SPHERE,20);
      beginShape();
      venus.setTexture(imagen_venus);
      endShape();
      shape(venus);
    popMatrix();
    pushMatrix();
      translate(xJupiter,0,movJupiter*zJupiter);
      rotateY(angYJupiter);
      jupiter = createShape(SPHERE,40);
      beginShape();
      jupiter.setTexture(imagen_jupiter);
      endShape();
      shape(jupiter);
    popMatrix();
    pushMatrix();
      translate(xNeptuno,0,movNeptuno*zNeptuno);
      rotateY(angYNeptuno);
      neptuno = createShape(SPHERE,27);
      beginShape();
      neptuno.setTexture(imagen_neptuno);
      endShape();
      shape(neptuno);
    popMatrix();
  popMatrix();
  pushMatrix();
    translate(xNave,yNave,zNave);
    nave = createShape(BOX,15);
    beginShape();
    nave.setFill(color(255,0,0));
    nave.setStroke(color(255));
    endShape();
    shape(nave);
  popMatrix();
  angSol -= pasoRotacionSol;
  xTierra += movTierra*pasoTraslacionTierra;
  zTierra = sqrt(pow(b+120,2) - pow((b+120)*xTierra/(a+120),2));
  if (xTierra >= a) movTierra = -1;
  if (xTierra <= -a) movTierra = 1;
  angYTierra += pasoRotacionTierra;
  xMarte += movMarte*pasoTraslacionMarte;
  zMarte = sqrt(pow(b+250,2) - pow((b+250)*xMarte/(a+250),2));
  if (xMarte >= a) movMarte = -1;
  if (xMarte <= -a) movMarte = 1;
  angYMarte += pasoRotacionMarte;
  xVenus += movVenus*pasoTraslacionVenus;
  zVenus = sqrt(pow(b+50,2) - pow((b+50)*xVenus/(a+50),2));
  if (xVenus >= a) movVenus = -1;
  if (xVenus <= -a) movVenus = 1;
  angYVenus += pasoRotacionVenus;
  xJupiter += movJupiter*pasoTraslacionJupiter;
  zJupiter = sqrt(pow(b+400,2) - pow((b+400)*xJupiter/(a+400),2));
  if (xJupiter >= a) movJupiter = -1;
  if (xJupiter <= -a) movJupiter = 1;
  angYJupiter += pasoRotacionJupiter;
  xNeptuno += movNeptuno*pasoTraslacionNeptuno;
  zNeptuno = sqrt(pow(b+45,2) - pow((b+45)*xNeptuno/(a+45),2));
  if (xNeptuno >= a) movNeptuno = -1;
  if (xNeptuno <= -a) movNeptuno = 1;
  angYNeptuno += pasoRotacionNeptuno;
  xLuna += movLuna*pasoTraslacionLuna;
  zLuna = sqrt(pow(b+170,2) - pow((b+170)*xLuna/(a+170),2));
  if (xLuna >= a) movLuna = -1;
  if (xLuna <= -a) movLuna = 1;
  angLuna += pasoRotacionLuna;
  if (keyPressed) {
    if (keyCode == UP) {
      perspectivaX -= 0.02;
    }
    if (keyCode == DOWN) {
      perspectivaX += 0.02;
    }
    if (keyCode == LEFT) {
      perspectivaY -= 0.02;
    }
    if (keyCode == RIGHT) {
      perspectivaY += 0.02;
    }
  }
}

void mouseMoved() {
  xNave = mouseX;
  yNave = mouseY;
}

void mouseWheel(MouseEvent e) {
  zNave += 5*e.getCount();
}

void keyPressed() {
  if (keyCode == UP) {
    perspectivaX += 0.1;
  }
  if (keyCode == DOWN) {
    perspectivaX -= 0.1;
  }
  if (keyCode == LEFT) {
    perspectivaY -= 0.1;
  }
  if (keyCode == RIGHT) {
    perspectivaY += 0.1;
  }
}
