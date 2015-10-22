

color randomColor() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}


void outlineText() {
  strokeWeight(floor(random(4, 12)));
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

void randomTextAttributes(String text) {
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

void maybeRect(color recStroke, int lineLength, int lineSpacing, int x, int y, int textHeight) {

  if (coinFlip()) {
    int margin = floor(textWidth("A")/2);
    stroke(recStroke);
    strokeWeight(5);
    //try no fill
    noFill();
    int recWidth = floor(lineLength*textWidth("A")-(margin*4));
    int recHeight = lineSpacing*30;
    float scalar;
    
    if (coinFlip()) {
      scalar=1.5;
      if(coinFlip()){
        y+=textHeight*1.5;
      }
    } else {
      if (coinFlip()) {
        scalar=3;
      } else {
        return;
      }
    }

    //try randomizing where this rectangle goes
    rect(x-margin, y-textHeight, recWidth, textHeight*scalar);
  }
}

void maybeEllipse(color recStroke, int lineLength, int lineSpacing, int x, int y, int textHeight) {

  if (coinFlip()) {
    int margin = floor(textWidth("A")/2);
    stroke(recStroke);
    strokeWeight(5);
    //try no fill
    noFill();
    int recWidth = floor(lineLength*textWidth("A")-(margin*4));
    int recHeight = lineSpacing*30;
    float scalar;
    x+=floor(random(0,2000));
    
    if (coinFlip()) {
      scalar=1.5;
      if(coinFlip()){
        y+=textHeight*1.5;
      }
    } else {
      if (coinFlip()) {
        scalar=3;
      } else {
        return;
      }
    }

    //try randomizing where this rectangle goes
    ellipse(x-margin, y-textHeight, textHeight*scalar, textHeight*scalar);
  }
}

