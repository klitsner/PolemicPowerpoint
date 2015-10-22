String randomImageSize() {
  if (random(12)>3) {
    if (random(12)>6) {
      return "xxlarge";
    } else
      return "huge";
  } else {
    return "medium";
  }
}

void getImages(int numOfImages, String[] terms) {
  //The number of images is limited to the number of significant terms (nouns, verbs) found in entry, even if numOfImages is higher
  if (numOfImages>terms.length) {
    for (int i = 0; i<terms.length; i++) {
println("first image");
      imageCreate(i, terms[i]);

    }
  } else {
    for (int i = 0; i<numOfImages; i++) {
      
      //imageCreate(i, terms[i]);
    }
  }
  for (int i = 0; i < numOfImages; i++) {
    if (img[i] != null) {
      randPos(img[i]);
    }
  }
}

void imageCreate(int index, String searchTerm) {

  String url = getImgUrl(searchTerm);
  if (url != null) {
    img[index] = loadImage(getImgUrl(searchTerm), "jpg");
    references[index+1]=url;
    numOfReferences++;
    }else {
      delay(100);
      imageCreate(index, searchTerm); // coment out if running slowly
    }
  }


String getImgUrl(String search) {
  String url;
  int randomSelect = floor(random(1, 30));

  url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+search+ "&start="+(randomSelect)+"&as_filetype=jpg"+"&imgsz="+randomImageSize()+"";
  response = loadJSONObject(url);
  try { 
    response = response.getJSONObject("responseData");
  }
  catch(Exception e) {
    String responseDetails = response.getString("responseDetails");
    e.printStackTrace();
    return null;
  }
  results = response.getJSONArray("results");

  JSONObject result = results.getJSONObject(0); 
  String linkstring = result.getString("unescapedUrl");

  return linkstring;
}

