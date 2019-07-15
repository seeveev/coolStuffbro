@isTest
public class TestingTrigger_Test 
{
    //1) create dummy data .. 
    //2) send those data to the method
    //3) check you get what you expected.. 
    
    @testSetup static void testmethoh()
    {
        Testing__c dummydata  = new Testing__c();
        dummydata.Name ='testing';
        dummydata.Country__c ='testing';
		insert dummydata;        
    }
    
    @IsTest static void testRecordSession() {
        list<Testing__c> testingCreate = [Select id, name, country__c,os_type__c from testing__c where name='testing'];
        Test.startTest();
        Testingtrigger_handler.beforeinsertlogic(testingCreate);
        Testingtrigger_handler.afterinsertlogic(testingCreate);   
        Testingtrigger_handler.afterupdatelogic(testingCreate);
        Testingtrigger_handler.beforeupdatelogic(testingCreate);


        Test.stopTest();

    }
}