

color randomColor() {
  return color(random(0,255),random(0,255),random(0,255));
}


void outlineText() {
  strokeWeight(floor(random(4,12)));
}

void randomBlendMode() {
  if (random(30)>20) {
    if (random(30)>25) {
      blendMode(MULTIPLY);
      println("bledning");
    } else
      blendMode(SCREEN);
            println("bledning");
  } else {
    if (random(30)>10) {
      blendMode(LIGHTEST);
            println("bledning");
    } else {
      blendMode(EXCLUSION);
            println("bledning");
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

