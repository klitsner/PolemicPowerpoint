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
  int maxFontSize = fontSizeLimit;
  int minFontSize = fontSizeLimit-150;
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
  int y = floor(random(typeYLimit, typeYLimit+300));

  int minLineLength = charCount/ maxTextLines;
  int maxLineLength = floor((width-x)/(charWidth*1.1));

  int lineLength = floor(random(minLineLength, maxLineLength));
  println(lineLength);
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));
  
  TextPlace(text, x, y, lineLength, lineSpacing);
}

void SetYear(String text) {
  int charCount = text.length()+4;

  //use character count to dictate max font size
  int maxFontSize = floor(map(charCount, 10, 20, 400, 200));
  int minFontSize = 250;
  int maxTextLines = 3;

  int fontSize = floor(random(minFontSize, maxFontSize));

  fontSizeLimit = fontSize;
  
  setFont(fontSize);
  textFont(f);

  int charWidth = floor(textWidth("a"));
  int textWidth = floor(textWidth(text));

  int maxX = (width-textWidth/3)-charWidth - 100;  
  int x = floor(random(0, maxX));

  int y = floor(random(height/5+fontSize, height/2));

  int lineLength = floor((width-x)/(charWidth*1.1));
  int lineSpacing = floor(map(fontSize, minFontSize, maxFontSize, 0, -(fontSize/2)));

  YearPlace(text+" BCE", x, y, lineLength, lineSpacing);
  
  typeYLimit = floor(y-(textDescent()));
}

void TextPlace(String text, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);
  
  color textFill = textColor();

 
  
  int textHeight = floor(0.8*(textAscent() + textDescent()));
  
  if(circlesAndSquares){
  maybeRect(textFill, lineLength, lineSpacing, x, y, textHeight);
  maybeEllipse(textFill, lineLength, lineSpacing, x, y, textHeight);
  }

  fill(textFill);
  if(blackWhiteOutline){
    if(textFill==color(0,0,0)){
      stroke(255,255,255);
    }else{
      stroke(0,0,0);
    }
  }else{
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
  book.stepAndDraw();
}

void YearPlace(String year, int x, int y, int lineLength, int lineSpacing) {

  book.setLineSpacing(lineSpacing);

  if(coinFlip()){
    fill(textColor());
  }else{
    fill(255,0,0);
  }
  
   color textFill = textColor();
  
  if(blackWhiteOutline){
    if(textFill==color(0,0,0)){
      stroke(255,0,0);
    }else{
      stroke(0,0,0);
    }
  }else{
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
  int y = height - (number * 18) - 20;

  textFont(referenceFont);
  colorMode(RGB);
  fill(255, 0, 0);
  text("REFERENCES:", 18, y-18);

  while (reference[i] != null) {
    text(reference[i], 18, y+(i*28));
    i++;
  }
}

color textColor(){
  color textFill;
    if(blackWhiteText){
    if(background==255 && textOutline){
      textFill = color(255,255,255);
    }else{
      textFill = color(0,0,0);
    }
  }else{
  textFill = randomColor();
  }
  return textFill;
}
