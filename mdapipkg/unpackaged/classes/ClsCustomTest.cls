@isTest
private class ClsCustomTest {

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
        
        userdivision__c objDiv = new userdivision__c();
        objDiv.username__c = tempuser.id;
        objDiv.division__c = '-- Select One --';
        insert objDiv;
        
        custom__c csReprot = new custom__c();
        csReprot.Notes__c = 'test notes';
        csReprot.author__c = 'author';
        csReprot.category__c ='category';
        //csReprot.Division__c(1);
        //csReprot.Name ='name';
        insert csReprot;
        
       

        // [Select c.Notes__c, c.date__c, c.category__c, c.author__c, c.Name, c.Division__c, c.DivisionHide__c, c.CreatedDate From custom__c c where c.OwnerId=:UserInfo.getUserId()];
    
        ClsCustom clsRUM = new ClsCustom(new ApexPages.StandardController(csReprot));
        
        
        
        clsrum.getCusList();
        //clsrum.custom();
       // clsrum.customResult();
        clsrum.getFromDate();
        clsrum.getToDate();
        clsrum.download();
        clsrum.editVal();
        clsrum.getAuthor();
        clsrum.getCategory();
        clsrum.getDivision();
        clsrum.msgBolVal();
        //Set author and category vaue
        clsrum.authorVal = 'author';
        clsRUM.categoryVal='category';
        clsrum.strKeySearch = 'ha';
        clsrum.strDivOnReport ='test report';
        clsrum.fromDate.date__c  = system.today()+300;
        clsrum.toDate.date__c = system.today();
        clsrum.getCusList();
        
        clsrum.authorVal = '-- Select One --';
        clsRUM.categoryVal='-- Select One --';
        clsrum.bolShowDivision = false;
        clsrum.fromDate.date__c  = system.today()-300;
        clsrum.toDate.date__c = system.today();
        clsrum.getCusList();
        
        clsrum.divisionVal = '-- Select One --';
        //clsrum.strLikeString ='this';
        clsrum.authorVal='-- Select One --';
        clsRUM.categoryVal='-- Select One --';
        clsrum.divisionVal = '-- Select One --';
        clsrum.bolShowDivision = true;
        clsrum.bolDisplaySaveButt = false;
        clsrum.fromDate.date__c  = system.today()-300;
        clsrum.toDate.date__c = system.today();
         System.debug('**** divisionVal ' + clsrum.divisionVal + '    ' + clsrum.bolShowDivision );
        clsrum.getCusList();
         System.debug('**** authorVal1 ' + clsrum.authorVal + '    ' + clsrum.categoryVal );
      //  clsrum.lstFinalOut();
        
        clsrum.divisionVal = '-- Select One --';
        clsrum.authorVal='-- Select One --';
        clsRUM.categoryVal='-- sSelect One --';
        clsrum.divisionVal = '-- Select One --';
        clsrum.bolShowDivision = true;
        clsrum.bolDisplaySaveButt = false;
        clsrum.fromDate.date__c  = system.today()-300;
        clsrum.toDate.date__c = system.today();
         System.debug('**** divisionVal ' + clsrum.divisionVal + '    ' + clsrum.bolShowDivision );
        clsrum.getCusList();
        
        clsrum.divisionVal = '-- Select One --';
        clsrum.authorVal='-- sSelect One --';
        clsRUM.categoryVal='-- Select One --';
        clsrum.divisionVal = '-- Select One --';
        clsrum.bolShowDivision = true;
        clsrum.bolDisplaySaveButt = false;
        clsrum.fromDate.date__c  = system.today()-300;
        clsrum.toDate.date__c = system.today();
         System.debug('**** divisionVal ' + clsrum.divisionVal + '    ' + clsrum.bolShowDivision );
        clsrum.getCusList();
        
        clsrum.save();
        
        test.stopTest();
    }
}