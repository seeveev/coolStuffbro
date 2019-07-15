public class buttoncont {
public static List<hierarchy__c> lstHier{get;set;}      

    public PageReference displaydata() {
                lstHier = [Select Account_id__c,BTN_Phone__c from hierarchy__c ]; 
                system.debug('vijay'  +lsthier);

        return null;
    }


public static String strhier = 'SELECT Account_id__c,billing_id__c,BTN_Phone__c,Circuit_Id__c,City__c,CLLI__c,Company_ID__c,Company_name__c,CreatedById,CreatedDate,GAN__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Level__c,Location_Id__c,Name,Name__c,OwnerId,Region__c,Service_Location__c,State__c,Summary_Id__c,Summary_master_phone__c,SystemModstamp,WTN_ID__c,WTN__c FROM hierarchy__c';

    public PageReference redirect() {
         PageReference pageRef = new PageReference('https://www.google.com');

    
        return pageRef;
    }

}