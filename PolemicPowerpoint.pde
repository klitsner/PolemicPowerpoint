import de.bezier.data.*;
import rita.*;
import net.nexttext.*;
import net.nexttext.renderer.*;

Book book;
Entry[] entries = new Entry[57];

//Adjustable Parameters
int numOfImages = 10; 
boolean blendModes = true;
boolean textOutline = true;
boolean allUpperCase = true;

//Randomized Parameters
int background;

//Global Variables
JSONArray results; 
JSONObject response;
String[] imgUrls;
boolean go = true;
int maxTIFs = 5;
int TIFs = 0;
String [] references = new String [numOfImages+1];
int numOfReferences = 1;

PImage template;
PImage gradient;
PImage[] img = new PImage[numOfImages];
PFont f;
PFont referenceFont;

void setup() {
  size(1306, 1160, JAVA2D);
  book = new Book(this, JAVA2D);

  //Create array of entries from XLS sheet
  for (int i = 1; i < 57; i++) {
    entries[i] = new Entry(i);
  }

   referenceFont = createFont("Oswald-Light", 12);

  //setup template background
  // gradient = loadImage("Gradient.png");
  template = loadImage("template.png");  
  image(template, 0, 0, width, height);

  //create imgUrls array
  imgUrls = new String[numOfImages];

  //randomized parameters, comment out to unrandomfy
  mainProcess();
}

void draw() {
  //run process every 7 seconds (giving time to load)
  if (second() % 7 == 0 && go) {
    mainProcess();
    go = false;
  }
  if (second() % 8 == 0) {
    go = true;
  }
}

void mainProcess() {
  TIFs++;

  //Right now pulling only form (present event)
  int randomRow = floor(random(1,56));
  int selectRow = randomRow;
  String selectedEntry = entries[selectRow].presentEvent();
  String selectedYear = entries[selectRow].yearOf();
  references[0] = entries[selectRow].reference();
  numOfReferences = 1;
  
  changeBackground();

  //get and put images on page
  getImages(numOfImages, getTokens(selectedEntry));
  
  SetYear(selectedYear);
  SetType(selectedEntry);
  addReference(references, numOfReferences);
  //output frame
  saveFrame("output/frames####.tif");
  book.clear();
  numOfReferences = 0;
  if (TIFs == maxTIFs) {
    exit();
  }
}

void randPos(PImage img) {
  image(img, floor(random(0, width)), floor(random(1, height)));
}

void randPosSize(PImage img) {
  image(img, floor(random(0, width)), floor(random(1, height)), floor(random(1, width)), floor(random(1, height)));
}

void typeEmphasis(String input) {
  //  RiTa.getPosTags(input);
}

boolean coinFlip() {
  boolean f = false;
  if (random(100)>50) {
    f = true;
  }
  return f;
}

void changeBackground() {
  if (random(100)>50) {
    background = 0;
  } else {
    background = 255;
  }
  blendMode(BLEND);
  background(background, 255);
}





