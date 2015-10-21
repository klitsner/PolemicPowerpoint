void setFont(int fontSize) {
  if (random(12)>3) {
    if (random(12)>6) {
      f = createFont("Oswald-Bold", fontSize);
    } else
      f = createFont("Oswald-Light", fontSize);
  } else {
    f = createFont("Oswald-Light", fontSize);
  }
}

void SetType(String text) {
  int charCount = text.length();


  //use character count to dictate max font size
  int maxFontSize = floor(map(charCount, 20, 100, 200, 100));
  int minFontSize = 80;
  int maxTextLines = 3;


  int fontSize = floor(random(minFontSize, maxFontSize));

  setFont(fontSize);
  textFont(f);

  int charWidth = floor(textWidth("a"));
  int textWidth = floor(textWidth(text));

  int maxX = (width-textWidth/3)-charWidth;  
  int x = floor(random(0, maxX));

  //int maxY =  
  //int y = floor(random(0,maxY));
  int y = floor(random(height/6+fontSize, height/2));

  int minLineLength = charCount/ maxTextLines;
  int maxLineLength = floor((width-x)/(charWidth*1.1));

  int lineLength = floor(random(minLineLength, maxLineLength));
  println(lineLength);
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));

  TextPlace(text, x, y, lineLength, lineSpacing);
}

void SetYear(String text) {
  int charCount = text.length();

  //use character count to dictate max font size
  int maxFontSize = floor(map(charCount, 20, 100, 200, 100));
  int minFontSize = 80;
  int maxTextLines = 3;

  int fontSize = floor(random(minFontSize, maxFontSize));

  setFont(fontSize);
  textFont(f);

  int charWidth = floor(textWidth("a"));
  int textWidth = floor(textWidth(text));

  int maxX = (width-textWidth/3)-charWidth - 100;  
  int x = floor(random(0, maxX));

  int y = floor(random(height/6+fontSize, height/2));

  int lineLength = floor((width-x)/(charWidth*1.1));
  println(lineLength);
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));

  YearPlace(text, x, y, lineLength, lineSpacing);
}

void TextPlace(String text, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);
  color textFill = randomColor();
  color recStroke = textFill;

  int margin = floor(textWidth("A")/2);
  stroke(recStroke);
  //try no fill
  noFill();
  int recWidth = floor(lineLength*textWidth("A")-margin);
  int recHeight = lineSpacing*30;
  rect(x-margin, y-margin*2, recWidth, 100);

  fill(textFill);
  stroke(randomColor());

  //create a rectangle

  randomTextAttributes(text);

  try {
    book.addText(text, x, y, lineLength);
  }
  catch(Exception e) {
    book.addText(text, x, y, lineLength+2);
  }

  //draws text to page
  book.stepAndDraw();
}

void YearPlace(String year, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);

  fill(randomColor());
  stroke(randomColor());

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
  int y = height - (number * 10) - 20;

  textFont(referenceFont);
  colorMode(RGB);
  fill(255, 0, 0);
  text("REFERENCES:", 10, y-18);

  while (reference[i] != null) {
    text(reference[i], 10, y+(i*14));
    i++;
  }
}

