@isTest 
private class DeleteProcessedDataTest {
    static testMethod void validateDelProcess() {
        Billing_Detail_2__c objBD = new Billing_Detail_2__c();
        objBD.Account_Id__c  = '12345';
        objBD.S_E_To_Date__c = System.today();
        insert objBD;
        
        Billing_Detail_2__c objBD1 = new Billing_Detail_2__c();
        objBD1.Account_Id__c  = '12345';
        objBD1.S_E_To_Date__c = System.today()+1;
        insert objBD1;
    }
}