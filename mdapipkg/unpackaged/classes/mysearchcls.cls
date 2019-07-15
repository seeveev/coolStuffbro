public class mysearchcls {
public List<hierarchy__c> lsthir { get; set; }
public String strINputVal    {get;set;}

public PageReference search() {
        String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + strINputVal + '%\'';
        //lsthir = [Select Name__c, BTN_Phone__c from hierarchy__c where Name__c=:strINputVal];
        lsthir = Database.query(strQuery);
        return null;
    }

}