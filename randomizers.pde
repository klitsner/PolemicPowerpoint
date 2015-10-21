void TextPlace(String text, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);
  
  fill(randomColor());
  stroke(randomColor());

  randomTextAttributes(text);

  book.clear();
  try{
  book.addText(text, x, y, lineLength);
  }catch(Exception e){
  book.addText(text, x, y, lineLength+2);
  }
  
  //draws text to page
    book.stepAndDraw();
}

color randomColor() {
  colorMode(HSB, 16, 100, 100);
  int col = floor(random(16));

  return color(col, 100, 100);
}


void outlineText() {
  strokeWeight(floor(random(4,12)));
}

void randomBlendMode() {
  if (random(30)>20) {
    if (random(30)>25) {
      blendMode(MULTIPLY);
    } else
      blendMode(SCREEN);
  } else {
    if (random(30)>10) {
      blendMode(LIGHTEST);
    } else {
      blendMode(EXCLUSION);
    }
  }
}

void randomTextAttributes(String text){
    if (coinFlip() && textOutline) {
    outlineText();
  } else {
    strokeWeight(0);
  }

  if (coinFlip() && blendModes) {
    randomBlendMode();
  } else {
    blendMode(BLEND);
  }
  s
    if (coinFlip() && allUpperCase) {
    text = text.toUpperCase();
  } 
  
}

