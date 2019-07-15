public class proj1 {
    public proj1(ApexPages.StandardController controller) {

    }


    
     private Static Final Integer PAGE_NUMBER = 10;
         public proj1(ApexPages.StandardSetController controller) {
         }
        public proj1(){
        
        String qryString = 'SELECT name, Phone FROM Account';      
        
        }
        
        public String getaccount(){
        String qryString = 'SELECT name, Phone FROM Account'; 
        return qryString;
        }
        
        
        Integer currentpage =1;
        Integer maxSize = 1;
 public boolean getprevRequired(){
  return currentpage > 1;
  }
  
  public PageReference next() {
  if(maxSize > this.currentPage * PAGE_NUMBER) {
   this.currentPage = this.currentPage + 1;
}
  return null;
 }
//action for previous click
 public PageReference previous() {
  if(this.currentPage > 1)
   this.currentPage = this.currentPage - 1;
  return null;
 }




    }


/* public with sharing class vfListPaginationController {
 //Page Size
 private Static Final Integer PAGE_NUMBER = 10;
 public vfListPaginationController() {
String qryString = 'SELECT Id, title, UrlName, LastPublishedDate,LastModifiedById FROM KnowledgeArticleVersion WHERE (PublishStatus = \'online\' and Language = \'en_US\')';
  List<KnowledgeArticleVersion> articleList= Database.query(qryString);
  maxSize = articleList.size() ;
 }
 //Keeps track of current page & max size of article list
 Integer currentPage = 1;
 Integer maxSize = 1;
 // Returns whether we need to see previous button or not
 public boolean getPrevRequired() {
  return currentPage > 1;
 }
 // Returns whether we need to see next button or not
 public boolean getNextRequired() {
  return currentPage * PAGE_NUMBER < maxSize;
 }
 //Returns current page number
 public Decimal getCurrentPageNumber() {
  return this.currentPage;
 }
 //action for next click
 public PageReference next() {
  if(maxSize > this.currentPage * PAGE_NUMBER) {
   this.currentPage = this.currentPage + 1;
}
  return null;
 }
 //action for previous click
 public PageReference previous() {
  if(this.currentPage > 1)
   this.currentPage = this.currentPage - 1;
  return null;
 }
}  */