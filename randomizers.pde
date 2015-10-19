void randomTextPlace(String text) {
  int x = floor(random(width/2));
  int y = floor(random(height/6+fontSize, height/2));
  println(y);
  int lineLength = max(2, floor((width-x)/(fontSize/2))); 
  book.setLineSpacing(floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2))));
  fill(randomColor());
  stroke(randomColor());

  if (coinFlip() && textOutline) {
    outlineText();
  } else {
    strokeWeight(0);
  }

  if (coinFlip() && blendModes) {
    println("HEY");
    randomBlendMode();
  } else {
    blendMode(BLEND);
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

