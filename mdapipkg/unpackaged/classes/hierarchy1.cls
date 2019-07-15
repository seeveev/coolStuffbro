public class hierarchy1 {

public hierarchy__c res{get; set;}

    public void getLsthierarchy() {
    res = [select city__c from hierarchy__c where account_id__c= '12345678'];
    
    }

}