
// 2D hilbert curve example
// https://en.wikipedia.org/wiki/Hilbert_curve

int fractalOrder = 3;

void setup() {
  size(512, 512);
  // size(1024, 1024);
  // size(2048, 2048);
  smooth();
}

void draw(){
  // fractalOrder 1: 4 blocks
  // fractalOrder 2: 16 blocks
  // fractalOrder 3: 64 blocks
  // fractalOrder n: 4^n blocks
  background(152,190,100);
  textSize(40);
  text("Hilbert Curve w/ Order: " + fractalOrder, 40, 40);
  displayHC('C', 0, 0, width, fractalOrder); // can also start with type A, B or D shape
}

void mouseWheel(MouseEvent event) {
  int e = - (int) event.getCount();
  int upperBound = 0; 
  // 8 for 512, 9 for 1024, 10 for 2048
  // 2^(UB + 1) = width
  while((1 << (upperBound + 1)) != width) upperBound++;
  int lowerBound = 1;
  if(e == 1 && fractalOrder < upperBound)
    fractalOrder++;
  else if(e == -1 && fractalOrder > lowerBound)
    fractalOrder--;
}

// see below for A, B, C, D
// https://en.wikipedia.org/wiki/File:Hilbert_curve_production_rules!.svg
void drawBaseHCurve(char type, int topLeftPosY, int topLeftPosX, int size){
  switch(type){
    case 'A':
      line(topLeftPosX + size / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size / 4, topLeftPosY + size / 4);
      line(topLeftPosX + size / 4, topLeftPosY + size / 4, topLeftPosX + size * 3 / 4, topLeftPosY + size / 4);
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size / 4, topLeftPosX + size * 3/ 4, topLeftPosY + size * 3 / 4);
      break;
    case 'B':
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size / 4, topLeftPosX + size / 4, topLeftPosY + size / 4);
      line(topLeftPosX + size / 4, topLeftPosY + size / 4, topLeftPosX + size / 4, topLeftPosY + size * 3 / 4);
      line(topLeftPosX + size / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size * 3/ 4, topLeftPosY + size * 3 / 4);
      break;
    case 'C':
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size / 4, topLeftPosX + size * 3 / 4, topLeftPosY + size * 3 / 4);
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size/ 4, topLeftPosY + size * 3 / 4);
      line(topLeftPosX + size / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size / 4, topLeftPosY + size / 4);
      break;
    case 'D':
      line(topLeftPosX + size / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size * 3 / 4, topLeftPosY + size * 3 / 4);
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size * 3 / 4, topLeftPosX + size * 3/ 4, topLeftPosY + size / 4);
      line(topLeftPosX + size * 3 / 4, topLeftPosY + size / 4, topLeftPosX + size / 4, topLeftPosY + size / 4);
      break;
    default:
      break;
  }
}

void displayHC(char type, int topLeftPosY, int topLeftPosX, int displayAreaSize, int order){
    if(order == 1){
      drawBaseHCurve(type, topLeftPosY, topLeftPosX, displayAreaSize);
    }else{
      switch(type){
        case 'A':
          displayHC('A', topLeftPosY, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('A', topLeftPosY, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          displayHC('D', topLeftPosY + displayAreaSize / 2, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('B', topLeftPosY + displayAreaSize / 2, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          break;
        case 'B':
          displayHC('B', topLeftPosY, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('C', topLeftPosY, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          displayHC('B', topLeftPosY + displayAreaSize / 2, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('A', topLeftPosY + displayAreaSize / 2, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          if(order == 2){
            line(topLeftPosX + displayAreaSize * 5 / 8, topLeftPosY + displayAreaSize / 8, topLeftPosX + displayAreaSize * 3 / 8, topLeftPosY + displayAreaSize / 8);
            line(topLeftPosX + displayAreaSize * 3 / 8, topLeftPosY + displayAreaSize * 3 / 8, topLeftPosX + displayAreaSize * 3 / 8, topLeftPosY + displayAreaSize * 5 / 8);
            line(topLeftPosX + displayAreaSize * 3 / 8, topLeftPosY + displayAreaSize * 7 / 8, topLeftPosX + displayAreaSize * 5 / 8, topLeftPosY + displayAreaSize * 7 / 8);    
          }
          break;
        case 'C':
          displayHC('D', topLeftPosY, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('B', topLeftPosY, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          displayHC('C', topLeftPosY + displayAreaSize / 2, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('C', topLeftPosY + displayAreaSize / 2, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          break;
        case 'D':
          displayHC('C', topLeftPosY, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('D', topLeftPosY, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          displayHC('A', topLeftPosY + displayAreaSize / 2, topLeftPosX, displayAreaSize / 2, order - 1);
          displayHC('D', topLeftPosY + displayAreaSize / 2, topLeftPosX + displayAreaSize / 2, displayAreaSize / 2, order - 1);
          break;
        default:
          break;
      }
      drawConnectors(type, topLeftPosY, topLeftPosX, displayAreaSize, order);
    }
  }

void drawConnectors(char type, int topLeftPosY, int topLeftPosX, int displayAreaSize, int order){
  order += 1;
  int gap = displayAreaSize >> order;
  
  switch(type){
    case 'A':
      line(topLeftPosX + gap, topLeftPosY + (displayAreaSize / 2 + gap), 
          topLeftPosX + gap, topLeftPosY + (displayAreaSize / 2 - gap));
      line(topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize / 2 - gap), 
          topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize / 2 - gap));
      line(topLeftPosX + (displayAreaSize - gap), topLeftPosY + (displayAreaSize / 2 - gap), 
          topLeftPosX + (displayAreaSize - gap), topLeftPosY + (displayAreaSize / 2 + gap));
      break;
    case 'B':
      line(topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + gap, 
            topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + gap);
      line(topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize / 2 - gap), 
            topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize / 2 + gap));
      line(topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize - gap), 
            topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize - gap));
      break;
    case 'C':
      line(topLeftPosX + (displayAreaSize - gap), topLeftPosY + (displayAreaSize / 2 - gap), 
          topLeftPosX + (displayAreaSize - gap), topLeftPosY + (displayAreaSize / 2 + gap));
      line(topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize / 2 + gap), 
          topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize / 2 + gap));
      line(topLeftPosX + gap, topLeftPosY + (displayAreaSize / 2 + gap), 
          topLeftPosX + gap, topLeftPosY + (displayAreaSize / 2 - gap));
      break;
    case 'D':
      line(topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + (displayAreaSize - gap), 
            topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize - gap));
      line(topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize / 2 + gap), 
            topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + (displayAreaSize / 2 - gap));
      line(topLeftPosX + (displayAreaSize / 2 + gap), topLeftPosY + gap, 
            topLeftPosX + (displayAreaSize / 2 - gap), topLeftPosY + gap);
      break;
    default:
      break;
  }
}