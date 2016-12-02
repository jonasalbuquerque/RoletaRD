PImage roleta, up, down, background, seta, voltar, voltar2, fim;
PImage vicios, supersticao, sexualidade, vocacao, namoro, seitas, vida_social, aborto, familia, modestia;
float x, y, d;
float angle=0, inc;
int contador, value = 0, i=0, f, TEMA=0;
boolean RODA;
float[] array = new float[5];
//

void setup() {
  fullScreen();
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
      array[f] = value*0.314;
      println(value*0.314);
      f++;
    }
  }
  RODA = false;
  roleta = loadImage("roleta.png");
  seta = loadImage("seta.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  background = loadImage("background2.png");
  voltar = loadImage("voltar.png");
  voltar2 = loadImage("voltar2.png");
  fim = loadImage("fim.jpg");

  vicios = loadImage("vicios.jpg");
  supersticao= loadImage("supersticao.jpg");
  sexualidade = loadImage("sexualidade.jpg");
  vocacao= loadImage("vocacao.jpg");
  namoro= loadImage("namoro.jpg");
  seitas= loadImage("seitas.jpg");
  vida_social= loadImage("vidasocial.jpg");
  aborto= loadImage("aborto.jpg");
  familia= loadImage("familia.jpg");
  modestia= loadImage("modestia.jpg");

  imageMode(CENTER);

  x = width*0.75;
  y = height/2;
}

void draw() {

  switch(TEMA) {
  case 0:
    image(background, width/2, height/2, width, height);

    if (RODA == false) {
      image(roleta, x, y);
      image(up, 350, height/2+100);
      image(seta, x-(roleta.width/2), height/2);
    }

    if (mousePressed && mouseX>350-(up.width/2) && mouseX<350+(up.width/2) && mouseY>height/2+100-(up.height/2) && mouseY<height/2+100+(up.height/2)) {
      RODA = true;
    }

    if (RODA) {
      roda();
    }
    break;

  case 1:
    image(supersticao, width/2, height/2, width, height);
    clica();
    break;

  case 2:
    image(sexualidade, width/2, height/2, width, height);
    clica();
    break;

  case 3:
    image(vocacao, width/2, height/2, width, height);
    clica();
    break;

  case 4:
    image(namoro, width/2, height/2, width, height);
    clica();
    break;

  case 5:
    image(seitas, width/2, height/2, width, height);
    clica();
    break;

  case 6:
    image(vida_social, width/2, height/2, width, height);
    clica();
    break;

  case 7:
    image(aborto, width/2, height/2, width, height);
    clica();
    break;

  case 8:
    image(familia, width/2, height/2, width, height);
    clica();
    break;

  case 9:
    image(modestia, width/2, height/2, width, height);
    clica();
    break;

  case 10:
    image(vicios, width/2, height/2, width, height);
    clica();
    break;
  case 11:
    image(fim, width/2, height/2, width, height);
    break;
  }
}

void roda() {

  image(down, 350, height/2+100);

  if (angle < 26.668)
    inc = 0.942;
  else
    if (angle >= 26.668 && angle < 39.2266)
      inc = 0.628;
    else
      if (angle >= 39.2266 && angle <= 43.940+2*array[i]) {
        inc = 0.314;
      } else {
        println("PAROU");
        inc = 0;
        delay(5000);

        if (array[i] == 0.314 )          
          TEMA = 1;
        else  if (array[i] == 0.628 )          
          TEMA = 2;
        else if (array[i] == 0.94200003 )          
          TEMA = 3;
        else if (array[i] == 1.256 )          
          TEMA = 4;
        else if (array[i] == 1.57 )          
          TEMA = 5;
        else if (array[i] == 1.8840001 )          
          TEMA = 6;
        else if (array[i] == 2.198 )          
          TEMA = 7;
        else if (array[i] == 2.512 )          
          TEMA = 8;
        else if (array[i] == 2.8260002 )          
          TEMA = 9;
        else if (array[i] == 3.14 )          
          TEMA = 10;
      }
  angle += inc;

  pushMatrix();
  translate(x, y);
  rotate(angle);
  image(roleta, 0, 0);
  popMatrix();

  image(seta,x-(roleta.width/2), height/2);
}  

void clica() {
  image(voltar, width*0.1, height*0.9);
  if (mouseX>width*0.1-(voltar.width/2) && mouseX<width*0.1+(voltar.width/2) && mouseY>height*0.9-(voltar.height/2) && mouseY<height*0.9+(voltar.height/2)) {
    image(voltar2, 100, 700);
  }
  if (mousePressed && mouseX>width*0.1-(voltar.width/2) && mouseX<width*0.1+(voltar.width/2) && mouseY>height*0.9-(voltar.height/2) && mouseY<height*0.9+(voltar.height/2)) {
    if (i<4) {
      angle= 0;
      inc = 0;
      RODA= false;
      i++;
      TEMA = 0;
    } else {
      TEMA = 11;
    }
  }
}