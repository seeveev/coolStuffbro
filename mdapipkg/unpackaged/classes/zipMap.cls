public with sharing class zipMap {
    
    public String zips {get;set;}
    
    public PageReference find() {
        return null;
    }
    
    public ApexPages.StandardSetController accts {
        get {
            //List<String> zList = new List<String>();
            //zList = zips.split(',');
            accts = new ApexPages.StandardSetController(
                Database.getQueryLocator(
                    [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode FROM Account WHERE BillingPostalCode = '10022' ORDER BY BillingPostalCode, Name]
                )
            );
            accts.setPageSize(2);
            return accts;
        }
        set;
    }
    
    public List<Account> getAccounts() {
        
        return null;//(List<Account>) accts.getRecords();
        
    }
    
    public Integer pages {
        
        get {
        
            pages = accts.getResultSize()/accts.getPageSize();
            
            return pages;
            
        }
        
        set;
        
    }
    
    public Boolean hasNext {
        
        get {
            
            return accts.getHasNext();
            
        }
        
        set;
        
    }
    
    public Boolean hasPrevious {
        
        get {
            
            return accts.getHasPrevious();
            
        }
        
        set;
        
    }
    
    public Integer pageNumber {
        
        get {
            
            return accts.getPageNumber();
            
        }
        
        set;
        
    }
    
    public void first() {
        
        accts.first();
        
    }
    
    public void last() {
        
        accts.last();
        
    }
    
    public void previous() {
        
        accts.previous();
        
    }
    
    public void next() {
        
        accts.next();
        
    }

    public void cancel() {
        
        accts.cancel();
        
    }
}