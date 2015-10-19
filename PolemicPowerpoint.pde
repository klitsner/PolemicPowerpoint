import de.bezier.data.*;
import rita.*;

Entry[] entries = new Entry[57];
Entry testEntry;

//Adjustable Parameters
int numOfResults = 5;   

//Randomized Parameters
color background;

//Global Variables
JSONArray results; 
JSONObject response;
String[] imgUrls;

PImage template;
PImage[] img = new PImage[numOfResults];

String imgUrl;

void setup(){
  size(800,600);

  //Create array of entry objects
  for(int i = 1; i < 57; i++){
  entries[i] = new Entry(i);
  }

  //
 
 
  //setup template background
  template = loadImage("template.png");  
  image(template, 0, 0, width, height);
  
  int t = second();   

  //
  imgUrls = new String[numOfResults];
  // populate entries using a loop
  // format the XLS sheet so that all the numbers are readable to ints
  
}

void draw(){
  
}

  //Create a function that takes a Sentence and 
    // 1) collects all important words
    // 2) randomly chooses 3-5 of them to turn to clip art
    // 3) PImage img = loadImage("url to the image"); 
    
String getImgUrl(String search){
  String url;
  int randomSelect = floor(random(1,20));
   url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+search+ "&start="+(randomSelect)+"&as_filetype=jpg"+"&imgsz=medium"; //ift:jpg,isz:m";
   response = loadJSONObject(url);
   response = response.getJSONObject("responseData");
   results = response.getJSONArray("results");
   
   JSONObject result = results.getJSONObject(0); 
   String linkstring = result.getString("unescapedUrl");
   
   return linkstring;
}

void keyPressed(){
  for(int i = 0; i < numOfResults; i++){
    getImage(i);
  }
  
      for(int i = 0; i < numOfResults; i++){
      if (img[i] != null){
      image(img[i], floor(random(0,width)), floor(random(1,height)), floor(random(1,width)), floor(random(1,height)));
    }
  }
}


void getImage(int i){
  
  /*
    imgUrls[i] = getImgUrl(searchTerm);
  
   img[i] = loadImage(imgUrls[i],"jpg");
   
   if(img[i]==null){
     getImage(i);
   }
   */
}

