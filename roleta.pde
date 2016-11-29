PImage roleta, up, down, background, seta;
float x, y, d;
float angle=0, inc, valor;
int contador, value = 0, i=0,f;
boolean RODA;
float[] array = new float[5];
//

void setup() {
  fullScreen();
  escolhe();
  RODA = false;
  roleta = loadImage("roleta.png");
  seta = loadImage("seta.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  background = loadImage("background.png");
  imageMode(CENTER);

  x = width/2+300;
  y = height/2;
}

void draw() {
  image(background, width/2, height/2, width, height);

  if (RODA == false) {
    image(roleta, x, y);
    image(up, 200, height/2);
  }

  if (keyPressed ) {
    RODA = true;
  }

  if (RODA) {
    rodaInicial();
  }

  image(seta, 640, 400);
}

void rodaInicial() {

  image(down, 200, height/2);

  if (angle < 26.668)
    inc = 0.942;
  else
    if (angle >= 26.668 && angle < 39.2266)
      inc = 0.628;
    else
      if (angle >= 39.2266 && angle <= 43.940+0.628)
        inc = 0.314;
      else {
        println("Zerou");
        inc = 0;
        exit();
      }
        
          //if (angle <= 43.93905666666667+array[i]){
          //  inc = 0.314;
          //  println(array[i]);
          //}else 
          //    if(angle >= 43.93905666666667+array[i]) {
                
          //      inc = 0;
          //      angle = 0;
          //      i++;
          //      RODA = false;
          //}

  angle += inc;

  pushMatrix();
  translate(x, y);
  rotate(angle);
  image(roleta, 0, 0);
  popMatrix();
}  

void escolhe() {
 // image(down, 200, height/2);
  f = 0;
  while (f<5) {
    contador = 0;
    value = int(random(1, 11));
    for (float i : array) {
      if (value*0.314 == i)
        break;
      else
        contador+=1;
    }
    if (contador == array.length) {
      array = append(array, value*0.314);
      println(value*0.314);
      f++;
    }
  }
}