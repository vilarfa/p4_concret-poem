PFont myfont;
String o = "kras";
char[] letras = {'k', 'r', 'a', 's'};
boolean exportado = false;  // Para exportar solo una vez

void setup() {
  size(595, 879);         // Tamaño del lienzo
  frameRate(4);           // Más fluido
  myfont = createFont("B.S.-Mono-Regular.otf", 18);
  textFont(myfont);
  textSize(10);
}

void draw() {



  background(255);        // Fondo blanco
  fill(0);                // Texto negro

  float cx = width / 2.0;
  float cy = height / 2.0;

  // EFECTO DE RUIDO QUE SUBE Y BAJA
  float ciclo = (sin(frameCount * 0.05) + 1) / 2.0;
  int total = int(500 + ciclo * 4000);

  // DIBUJO DEL RUIDO
  for (int i = 0; i < total; i++) {
    float angle = random(TWO_PI);
    float r = pow(random(1), 3) * max(width, height) / 2;
    float x = cx + cos(angle) * r;
    float y = cy + sin(angle) * r;

    String texto;
    float tipo = random(1);

    if (tipo < 0.25) {
      texto = o;
    } else {
      int len = int(random(1, letras.length + 1));
      texto = "";
      for (int j = 0; j < len; j++) {
        texto += letras[int(random(letras.length))];
      }
    }

    if (random(1) < 0.5) {
      text(texto, x, y);
    } else {
      pushMatrix();
      translate(x, y);
      rotate(HALF_PI);
      text(texto, 0, 0);
      popMatrix();
    }
  }
}
