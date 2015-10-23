import de.bezier.data.*;
import rita.*;
import net.nexttext.*;
import net.nexttext.renderer.*;

Book book;
Entry[] entries = new Entry[57];

/////*****Adjustable Parameters*****///////

//EntryType
boolean present = false;
boolean future = false;
boolean modal = true;
boolean extended = false; // may be too much text

//Image
int numOfImages = 5; 
boolean resizeImages = true;
boolean drawImages = true; //turn on and off image drawing

//Text
boolean blackWhiteText = true; // true: will allow only black or white fonts;
boolean blackWhiteOutline = true;
boolean textOutline = true; // allows outlined text
boolean allUpperCase = true; // sets all type to uppercase

//Draw
boolean blendModes = false; // random application of blending modes
boolean circlesAndSquares = false; // generates box or circle outline around text

//Fonts
boolean randomFonts = false; // Will select from the 3 font strings below if true
String font1 = "Avenir Next Condensed"; // if randomFonts set to false, only this font will be used.
String font2 = "Oswald-Light";
String font3 = "Oswald-Bold";
String refFont = "Avenir Next Condensed";
/////*********//////*****///////

//Randomized Parameters
int background;

//Global Variables
int fontSizeLimit;
int typeYLimit;
int yearSize;
JSONArray results; 
JSONObject response;
boolean go = true;
int maxPNGs = 56;
int pngs = 32;
String [] references = new String [numOfImages+3];
int numOfReferences = 0;

PImage[] img = new PImage[numOfImages];
PFont f;
PFont referenceFont;

void setup() {
  size(3072, 2732, JAVA2D);
  book = new Book(this, JAVA2D);

  //Create array of entries from XLS sheet
  for (int i = 1; i < 57; i++) {
    entries[i] = new Entry(i);
  }
   referenceFont = createFont(refFont, 18);

  //randomized parameters, comment out to unrandomfy
  mainProcess();
}

void draw() {
  //run process every 5 seconds (giving time to load)
  if (second() % 6 == 0 && go) {
    mainProcess();
    go = false;
  }
  if (second() % 7 == 0) {
    go = true;
  }
}

void mainProcess() {
  pngs++;
  //Right now pulling only form (present event)
  //int randomRow = floor(random(1,56));
  
  int selectRow = pngs;
  
  String selectedEntry = "blank"; //wont run unless value is given
  if(present){
    selectedEntry = entries[selectRow].presentEvent();
  }
  if(future){
    selectedEntry = entries[selectRow].futureEvent();
  }
  if(modal){
    selectedEntry = entries[selectRow].modalEvent();
  }
  if(extended){
    selectedEntry = entries[selectRow].getFullSentence();
  }

  String selectedYear = entries[selectRow].yearOf();
  references[0] = entries[selectRow].reference();
  if(references[0]!=null){
  numOfReferences = 1;
  }else{
   numOfReferences = 0;
  }
  
  changeBackground();

  //get and put images on page
  if(drawImages){
    getImages(numOfImages, getTokens(selectedEntry));
  }
  
  SetYear(selectedYear);
  book.stepAndDraw();
  
  SetType(selectedEntry);
  book.stepAndDraw();
  
  addReference(references, numOfReferences);
  //output frame
   wait(2000);
  saveFrame("output/"+modal+"/frames####.png");
  book.clear();
  numOfReferences = 0;
  if (pngs == maxPNGs) {
    wait(5000);
    exit();
  }
}

void randPos(PImage img) {
  
    int y;
    int x;
    if(random(10)<3){
      y = int(random(0,200));
      x = int(random(0,200));
    }else{
      x = int(random(0, width-(width/5)));
      y = int(random(1, height-(height/3)));
    }
  
  
  if(resizeImages){
    float scalar = random(2,4);
    println(scalar);
    image(img, x, y,img.width*scalar, img.height*scalar );
  }else{
    image(img, x, y);
  }
}


void randPosSize(PImage img) {
  image(img, floor(random(0, width)), floor(random(1, height)), floor(random(1, width)), floor(random(1, height)));
}

boolean coinFlip() {
  boolean f = false;
  if (random(100)>50) {
    f = true;
  }
  return f;
}

void changeBackground() {
  float check = random(100);
  if (check>60) {
    background = 0;
  } else if (check>40){
    background = 255;
  }else{
    background(0,0,255);
    return;
  }
  blendMode(BLEND);
  background(background);
}





