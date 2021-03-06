int CantidadMotores; //<>//

int Ancho;
int Alto;

int InicioCanvas;
int FinCanvas;
int AnchoCanvas;

float[] Angulo;
float[] AnguloEnviado; 

void setup() {
  fullScreen();
  Iniciar();
  Ancho =  width;
  Alto = height;
  InicioCanvas = 0 + Ancho/30;
  FinCanvas = Ancho - Ancho/30 ;
  AnchoCanvas = Ancho - InicioCanvas*2; 

  IniciarVariables(5);

  textAlign(CENTER);
}

void draw() {

  if (SePuedeDibujar()) {
    // TU CODIGO DIBUJO
    DibujarCuerpo();
    // HASTA AQUI CODIGO DIBUJO
  }
}

void DibujarCuerpo() {
  background(240);
  DibujarCuadros();
  DibujarLineas();
  DibujarNumeros();
  EnviarDatos();
}

void mouseDragged() {
  mouseClicked();
}

void mouseClicked() {
  if (SePuedePresionar()) {
    // TU CODIGO MOUSE
    int AnchoCelda = Alto/(CantidadMotores+1);
    for (int i = 0; i<CantidadMotores; i++) {
      if (mouseY<(i+1)*AnchoCelda) {
        Angulo[i] = map(mouseX, InicioCanvas, FinCanvas, 0, 180);
        Angulo[i] = int(constrain(Angulo[i], 0, 180));
        return;
      }
    }
    // HASTA AQUI CODIGO MOUSE
  }
}


void EnviarDatos() {
  if (BtActivo) {
    if (!mousePressed) {
      for (int i = 0; i <CantidadMotores; i++) {
        if (Angulo[i] != AnguloEnviado[i]) {
          //MiSerial.write("M"+i+"T"+int(Angulo[i]));
          println("M"+i+"T"+int(Angulo[i]));
          AnguloEnviado[i] = Angulo[i];
        }
      }
    }
  }
}

void IniciarVariables(int n) {
  CantidadMotores = n;
  Angulo = new float[CantidadMotores];
  AnguloEnviado = new float[CantidadMotores];

  for (int i = 0; i<CantidadMotores; i++) {
    Angulo[i] = 90;
    AnguloEnviado[i] = 90;
  }
}