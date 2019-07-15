/********************************** 
** 2018-07-28 vijay created 
***********************************/
public class searchcontroller
{
    public List<hierarchy__c> lsthir { get; set; }
    public String searchText    {get;set;}
    
    public PageReference searchaccounts() {
        String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + searchText + '%\'';
        //lsthir = [Select Name__c, BTN_Phone__c from hierarchy__c where Name__c=:strINputVal];
        lsthir = Database.query(strQuery);
        return null;
    }
    
    
    
}