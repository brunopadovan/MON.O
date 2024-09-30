PImage img;  // Variável para armazenar a imagem
PFont font;  // Variável para armazenar a fonte personalizada

void setup() {
  // Configura um canvas de 900x900 com renderização P3D para capacidades 3D
  size(900,900,P3D);
  
  // Carrega a imagem "3.png" na variável img
  img = loadImage("3.png");
  
  // Carrega a fonte personalizada "Darvine-Regular-BF65fbe42214468.otf" com tamanho 300
  font = createFont("Darvine-Regular-BF65fbe42214468.otf", 300);
}

void draw() {
  // Define o fundo da tela como preto
  background(0);
  
  // Define a cor de preenchimento para o texto (vermelho)
  fill(#A7190F);
  
  // Remove as bordas das formas
  noStroke();
  
  // Salva o estado atual da matriz para o texto
  push();
  
  // Define a fonte como a fonte personalizada carregada
  textFont(font);
  
  // Exibe o texto "MON.O" nas coordenadas (100, 250)
  text("MON.O", 100, 250);
  
  // Alinha o texto ao centro da tela
  textAlign(CENTER, CENTER);
  
  // Translada para o centro da tela para realizar transformações 3D
  translate(width/2, height/2);
  
  // Rotaciona toda a cena ao longo do eixo Y, com base na contagem de frames
  rotateY(radians(frameCount));
  
  // Define o número de blocos na grade
  float tiles = 150;
  
  // Calcula o tamanho de cada bloco com base na largura e no número de blocos
  float tileSize = width/tiles;
  
  // Loop para percorrer todos os blocos da grade nos eixos X e Y
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      
      // Obtém a cor do pixel na posição (x, y) da imagem
      color c = img.get(int(x * tileSize), int(y * tileSize));
      
      // Mapeia o brilho da cor do pixel para um valor entre 0 e 1
      float b = map(brightness(c), 0, 255, 0, 1);
      
      // Mapeia o brilho para um valor de deslocamento no eixo Z (-100 a 100)
      float z = map(b, 0, 1, -100, 100);
      
      // Salva o estado da matriz antes de modificá-lo para cada bloco
      push();
      
      // Translada o bloco para sua posição no espaço 3D, com compensação do centro da tela
      translate(x * tileSize - width/2, y * tileSize - height/2, z);
      
      // Desenha um cubo 3D, onde o tamanho depende do brilho do pixel
      box(tileSize * b);
      
      // Restaura o estado da matriz para a próxima iteração
      pop();
    }
  }
  
  // Restaura a matriz para voltar ao estado original
  pop();
}
