public class css1 {

Public String CustomerAccount{get;set;} 

    public PageReference jaffamsg() {
     List<hierarchy__c> CustomerAccount= [select id, name,Account_Id__c  from hierarchy__c where account_id__c='14' limit 10 ];
           return null;
    }


}