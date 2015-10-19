void randomTextPlace(String text) {
  int x = floor(random(width/2));
  int y = floor(random(height/6+fontSize, height/2));
  println(y);
  int lineLength = floor((width-x)/(fontSize/2)); 
  book.setLineSpacing(floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2))));

  /* 
   int random = floor(random(0, 9));
   
   switch(random) {
   case 1: 
   textAlign(CENTER, TOP);
   break;
   case 2: 
   textAlign(CENTER, BOTTOM);
   break;
   case 3: 
   textAlign(CENTER, CENTER);
   break;
   case 4: 
   textAlign(RIGHT, TOP);
   break;
   case 5: 
   textAlign(RIGHT, BOTTOM);
   break;
   case 6: 
   textAlign(RIGHT, CENTER);
   break;
   case 7: 
   textAlign(LEFT, BOTTOM);
   break;
   case 8: 
   textAlign(RIGHT, BOTTOM);
   break;
   case 9: 
   textAlign(CENTER, BOTTOM);
   break;
   default : 
   textAlign(CENTER, CENTER);
   break;
   }
   */
   
  fill(randomColor());
  stroke(randomColor());

  if (coinFlip()) {
    outlineText();
  } else {
    strokeWeight(0);
  }
  book.clear();
  book.addText(text, x, y, lineLength);
}


color randomColor() {
  colorMode(HSB, 16, 10, 10);
  int col = floor(random(16));

  return color(col, 100, 100);
}

void dropShadowText(String text, int x, int y, int w, int h) {
  int stroke = floor(random(10));
  fill(randomColor());
  textSize(fontSize-stroke);
  text(text, x+stroke/10, y+stroke/10, w, h);
}

void outlineText() {
  strokeWeight(floor(random(15)));
}

