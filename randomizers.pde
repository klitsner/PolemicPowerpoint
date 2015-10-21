

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
  
    if (coinFlip() && allUpperCase) {
    text = text.toUpperCase();
  } 
  
}

