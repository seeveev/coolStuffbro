public class mysearch1 {
public  List<hierarchy__c> Lstsearch { get; set; }
    public PageReference search() {
    // List<hierarchy__c> Lstsearch = new List<hierarchy__c>() ; 
    Lstsearch = [select BTN_Phone__C from Hierarchy__c];
        return null;
    }


    public String getHierarchy() {
        return null;
    }


    public String getSearchresult() {
        return null;
    }

}