import de.bezier.data.*;
import rita.*;
import net.nexttext.*;
import net.nexttext.renderer.*;

Book book;
Entry[] entries = new Entry[57];

String tester = "its an elephant man eating his hand";

//Adjustable Parameters
int numOfImages = 15; 
int maxFontSize = 150;
int minFontSize = 100;

//Randomized Parameters
int background;
int fontSize;


//Global Variables
JSONArray results; 
JSONObject response;
String[] imgUrls;

PImage template;
PImage[] img = new PImage[numOfImages];
PFont f;

void setup() {
  size(1306, 1160, JAVA2D);
  
   book = new Book(this, JAVA2D);
  //Font Setup
  fontSize=floor(random(minFontSize,maxFontSize));
  f = createFont("HelveticaNeue-CondensedBold", fontSize);
  textFont(f);

  //Create array of entries from XLS sheet
  for (int i = 1; i < 57; i++) {
    entries[i] = new Entry(i);
  }

  //setup template background
  template = loadImage("template.png");  
  image(template, 0, 0, width, height);

  //create imgUrls array
  imgUrls = new String[numOfImages];

  //randomized parameters, comment out to unrandomfy
  if (random(1, 3)>2) {
    background = 0;
  } else {
    background = 255;
  }
}

void draw() {
  book.stepAndDraw();
}

//Create a function that takes a Sentence and 
// 2) randomly chooses 3-5 of them to turn to clip art
// 3) PImage img = loadImage("url to the image"); 


void keyPressed() {
    String randomEntry = entries[floor(random(1,56))].presentEvent();
    background(background);
    getImages(numOfImages, getTokens(randomEntry));
    randomTextPlace(randomEntry);
    
}

String getImgUrl(String search) {
  String url;
  int randomSelect = floor(random(1, 30));
  url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+search+ "&start="+(randomSelect)+"&as_filetype=jpg"+"&imgsz=medium"; //ift:jpg,isz:m";
  response = loadJSONObject(url);
  response = response.getJSONObject("responseData");
  results = response.getJSONArray("results");

  JSONObject result = results.getJSONObject(0); 
  String linkstring = result.getString("unescapedUrl");

  return linkstring;
}

void imageCreate(int index, String searchTerm) {
  img[index] = loadImage(getImgUrl(searchTerm), "jpg");
  if (img[index]==null) {
    imageCreate(index, searchTerm);
  }
}

void getImages(int numOfImages, String[] terms) {
  if (numOfImages>terms.length) {
    for (int i = 0; i<terms.length; i++) {
      imageCreate(i, terms[i]);
    }
  } else {
    for (int i = 0; i<numOfImages; i++) {
      imageCreate(i, terms[i]);
    }
  }
   for (int i = 0; i < numOfImages; i++) {
    if (img[i] != null) {
      randPos(img[i]);
    }
  }
}

void randPos(PImage img){
  image(img, floor(random(0, width)), floor(random(1, height)));
}

void randPosSize(PImage img){
  image(img, floor(random(0, width)), floor(random(1, height)), floor(random(1, width)), floor(random(1, height)));
}

void typeEmphasis(String input) {
  //  RiTa.getPosTags(input);
}


//returns all useable tokens from text
String[] getTokens(String text) {
  String [] tokenized = RiTa.tokenize(text);
  String [] allTokens = new String[tokenized.length];
  int numOfTokens = 0;

  for (int i = 0; i<tokenized.length; i++) {
    String stringCheck = RiTa.getPosTags(tokenized[i])[0];

    //check for noun
    if (stringCheck.equals("nn") || stringCheck.equals("nns") || stringCheck.equals("nnp") || stringCheck.equals("nnps")) {
      allTokens[numOfTokens] = tokenized[i];
      numOfTokens++;
    }
    //check for modal
    if (stringCheck.equals("md")) {
      allTokens[numOfTokens] = tokenized[i];
      numOfTokens++;
    }
    //check for verb
    if (stringCheck.equals("vb") || stringCheck.equals("vbd") || stringCheck.equals("vbg") || stringCheck.equals("vbn")) {
      allTokens[numOfTokens] = tokenized[i];
      numOfTokens++;
    }
  }

  if (numOfTokens == 0) {
    return null;
  }



  String[] tokens = new String [numOfTokens];
  arrayCopy(allTokens, 0, tokens, 0, numOfTokens);

  return tokens;
}

boolean coinFlip(){
  
  boolean f = false;
  if(random(100)>50){
    f = true;
  }
  return f;
  
}
