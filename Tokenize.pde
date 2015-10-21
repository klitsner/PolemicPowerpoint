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
