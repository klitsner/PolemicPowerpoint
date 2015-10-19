//This class is used to create objects containing data from the XLS sheet

class Entry {
  
  String year;
  int row;
  int numOfTokens;
  String[] tokens;
  XlsReader reader;
  
  Entry(int r){
    row = r;
    reader = new XlsReader ( PolemicPowerpoint.this, "data.xls" );
    
   //hardcoded locations of non-Int Cells because of lack of library support for checking cell type
   if(row == 15 || row == 28 || row == 33 || row == 41 || row > 52){
     year = reader.getString( row, 0 );
   }
   else{
     year = "" + reader.getInt( row, 0 );
   }
   
   //tokenize 
   
   
  }
  
  //turn date into an int
  String yearOf(){
    return year;
  }
  
  String futureEvent(){
    return reader.getString( row, 1 );
  }
  
  String presentEvent(){
    return reader.getString( row, 2 );
  }
  
  String modalEvent(){
    return reader.getString( row, 3 );
  }
  
  String reference(){
    return reader.getString( row, 4 );
  }
  
  String getFullSentence(){
    return reader.getString( row, 6 );
  }
  
  int numOfTokens(){
    return tokens.length;
  }
  
  String tokens(){
    return "";
  }
}
