@isTest
private class buttoncontTest{

    static testMethod void myUnitTest() {
        hierarchy__c objhir = new hierarchy__c();
        objhir.Account_id__c='Test';
        objhir.BTN_Phone__c='1234567890';
        insert objhir;
         Test.startTest();
           Test.setCurrentPage(page.button);
           Apexpages.currentPage().getParameters().put('btnNum','1234567890');
           Test.stopTest();
    }
}