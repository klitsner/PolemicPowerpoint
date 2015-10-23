String randomImageSize() {
  if (random(12)>6) {
    return "xxlarge";
  } else
    return "huge";
}

void getImages(int numOfImages, String[] terms) {

  for (int i = 0; i<img.length; i++) {
    img[i] = null;
  }
  
  //The number of images is limited to the number of significant terms (nouns, verbs) found in entry, even if numOfImages is higher
  if (numOfImages>terms.length) {
    numOfImages = terms.length;
  }
    for (int i = 0; i<numOfImages; i++) {
      imageCreate(i, terms[i]);
    }
    for (int i = 0; i < numOfImages; i++) {
      if (img[i] != null) {
        randPos(img[i]);
      }
    }
  }

void imageCreate(int index, String searchTerm) {
  //pauses 
  wait(5000);
  String url = getImgUrl(searchTerm);
  if (url != null) {
    img[index] = loadImage(getImgUrl(searchTerm), "jpg");
    wait(50);
    references[numOfReferences]=url;
    numOfReferences++;
  } else {
    imageCreate(index, searchTerm); // coment out if running slowly
  }
}


String getImgUrl(String search) {
  String url;
  int randomSelect = int(random(4));

  url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+search+ "&start="+(randomSelect)+"&as_filetype=jpg"+"&imgsz="+randomImageSize()+"";
  response = loadJSONObject(url);
  try { 
    response = response.getJSONObject("responseData");
  }
  catch(Exception e) {
    String responseDetails = response.getString("responseDetails");
    e.printStackTrace();
    wait(610000);
    return null;
  }
  results = response.getJSONArray("results");

  JSONObject result = results.getJSONObject(0); 
  String linkstring = result.getString("unescapedUrl");

  return linkstring;
}

void wait(int time) {
  /*
  //runs an empty loop for specified time, halting the program
   int curr = millis();
   while ((millis()-curr)%time!=0) {
   }
   */
}

