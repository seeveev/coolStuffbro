public class opportunityList2Con {

    public PageReference lastBtnClick() {
        return null;
    }


    public String getNextButtonDisabled() {
        return null;
    }


    public PageReference nextBtnClick() {
        return null;
    }


    public PageReference previousBtnClick() {
        return null;
    }


    public String previousButtonEnabled { get; set; }

    public PageReference firstBtnClick() {
        return null;
    }

  // ApexPages.StandardSetController must be instantiated  
    
  // for standard list controllers  
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select name,closedate from Opportunity]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records  
    
    public List<Opportunity> getOpportunities() {
         return (List<Opportunity>) setCon.getRecords();
    }
    
    public PageReference next() {
        
        Integer p = setCon.getPageNumber();
        
        if(hasNext) {
            setCon.setPageNumber(p+1);
        }
        
        return null;
    }
    
    public PageReference previous() {
                
        Integer p = setCon.getPageNumber();
        
        if(hasPrevious) {
            setCon.setPageNumber(p-1);
        }
        
        return null;
    }
    
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
    }
    
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
    }

}