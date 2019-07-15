@isTest
private class ClsAddReportTest {

    static testMethod void myUnitTest() {
    	test.startTest();
       //Insert data
        User tempuser;
       
    	Profile PInstal = [select id from Profile where name = 'System Administrator'];
    	tempuser = new User(profileid=PInstal.Id,alias = 'standt', email='standarduser00735@accenture.com',
                    emailencodingkey='UTF-8', lastname='Tsting15', languagelocalekey='en_US',
                    localesidkey='en_US',timezonesidkey='America/Los_Angeles', username='standardser007@accenture.com'
                    );
        insert tempuser;
        
        custom__c csReprot = new custom__c();
        csReprot.Notes__c = 'test notes';
        csReprot.author__c = 'author';
        csReprot.category__c ='category';
        //csReprot.Division__c(1);
        //csReprot.Name ='name';
        insert csReprot;
        
        // [Select c.Notes__c, c.date__c, c.category__c, c.author__c, c.Name, c.Division__c, c.DivisionHide__c, c.CreatedDate From custom__c c where c.OwnerId=:UserInfo.getUserId()];
    
        ClsAddReport clsRUM = new ClsAddReport(new ApexPages.StandardController(csReprot));
        clsRUM.cancel();
        clsRUM.getAllRecord();
        clsRUM.getCustomRecod();
        clsRUM.NewRecord();
        clsRUM.saveRecord();
        test.stopTest();
    }
}