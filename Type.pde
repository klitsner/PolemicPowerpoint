void setFont(int fontSize) {
  if (random(12)>3) {
    if (random(12)>6) {
      f = createFont(font3, fontSize);
    } else
      f = createFont(font2, fontSize);
  } else {
    f = createFont(font1, fontSize);
  }
}

void SetType(String text) {
  int charCount = text.length();

  //use character count to dictate max font size
  int maxTextLines = 3;

  int maxFontSize = getFontSize(fontSizeLimit, text);
  int minFontSize = maxFontSize-100;

  int fontSize = floor(random(minFontSize, maxFontSize));

  setFont(fontSize);
  textFont(f);

  int charWidth = floor(textWidth("a"));
  int textWidth = floor(textWidth(text));

  int maxX = (width-textWidth/3)-charWidth;  
  int x = floor(width - textWidth("A")*text.length()/3);//floor(random(0, maxX));

  //int maxY =  
  //int y = floor(random(0,maxY));
  int y = floor(random(typeYLimit+yearSize, typeYLimit+height/5));

  int lineLength = floor((width-x)/(charWidth*1.2));
  println(lineLength);
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));

  TextPlace(text, x, y, lineLength, lineSpacing);
}

void SetYear(String text) {
  int charCount = text.length()+4;

  //use character count to dictate max font size
  int maxFontSize = floor(map(charCount, 10, 20, 400, 250));
  int minFontSize = 250;
  int maxTextLines = 3;

  int fontSize = floor(random(minFontSize, maxFontSize));

  fontSizeLimit = fontSize;

  setFont(fontSize);
  textFont(f);

  int charWidth = floor(textWidth("a"));
  int textWidth = floor(textWidth(text));

  int maxX = (width-textWidth/3)-charWidth - 100;  
  int x = floor(random(20, min(maxX, width/2)));

  int y = floor(random(height/5+fontSize, height/4));
  yearSize = floor(textDescent()+textAscent());
  println("yearSize: "+yearSize);

  int lineLength = floor((width-x)/(charWidth*1.1));
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));

  YearPlace(text+" BCE", x, y, lineLength, lineSpacing);

  typeYLimit = floor(y-(textDescent()));
}

void TextPlace(String text, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);

  color textFill = textColor();



  int textHeight = floor(0.8*(textAscent() + textDescent()));

  if (circlesAndSquares) {
    maybeRect(textFill, lineLength, lineSpacing, x, y, textHeight);
    maybeEllipse(textFill, lineLength, lineSpacing, x, y, textHeight);
  }

  fill(textFill);
  if (blackWhiteOutline) {
    if (textFill==color(0, 0, 0)) {
      stroke(255, 255, 255);
    } else {
      stroke(0, 0, 0);
    }
  } else {
    stroke(randomColor());
  }

  //create a rectangle

  randomTextAttributes(text);

  try {
    book.addText(text, x, y, lineLength);
  }
  catch(Exception e) {
    book.addText(text, x, y, lineLength+2);
  }

  //draws text to page
}

void YearPlace(String year, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);

  if (coinFlip()) {
    fill(textColor());
  } else {
    fill(255, 0, 0);
  }

  color textFill = textColor();

  if (blackWhiteOutline) {
    if (textFill==color(0, 0, 0)) {
      stroke(255, 0, 0);
    } else {
      stroke(0, 0, 0);
    }
  } else {
    stroke(randomColor());
  }

  randomTextAttributes(year);

  try {
    book.addText(year, x, y, lineLength);
  }
  catch(Exception e) {
    book.addText(year, x, y, lineLength+2);
  }
}


void addReference(String [] reference, int number) {
  int start;
  if (reference[0] == null) {
    start = 1;
  } else {
    start = 0;
  }
  int i = start;
  int y = height - (number * 28) - 30;

  textFont(referenceFont);
  colorMode(RGB);
  fill(255, 0, 0);
  text("REFERENCES:", 18, y-18);

  while (reference[i] != null) {
    text(reference[i], 18, y+(i*28));
    i++;
  }
}

color textColor() {
  color textFill = color(0, 0, 255);
  if (blackWhiteText) {
    if (background==255 && textOutline || background == 0) {
      textFill = color(255, 255, 255);
    } else if (background == 255 || background == 0 && textOutline) {
      textFill = color(0, 0, 0);
    }
  } else {
    textFill = randomColor();
  }
  return textFill;
}

int getFontSize(int limit, String text) {
  boolean sizeOkay = false;
  int size = limit;
  println("limit " + limit);
  while (sizeOkay == false) {
    textSize(size);
    if (textWidth("A")*text.length() > width*(3)) {
      size -= 10;
    }else{
      sizeOkay = true;
    }
  }
  println("size " + size);
  return size;
}

