@isTest(SeeAllData=true)                    
private class TripControllerTest {
    public static testMethod void TripControllerMethodTest () { 
    
        Adventure__c adv=new Adventure__c();
        adv.name = 'test';
        adv.Group_Size__c = 10;
        adv.Length_d__c = 10;
        adv.Location__c = 'test';
        adv.Max_Group_Size__c = 10;
        adv.Difficult__c = 'One';
        insert adv;
        
        apexpages.currentpage().getparameters().put('id','');
        Trip__c TripObj=new Trip__c();
        ApexPages.StandardController stdCont=new ApexPages.StandardController(TripObj);
        TripController TripControllerObj=new TripController(stdCont);
        
        
        Trip__c tripdata=new Trip__c();
        tripdata.name = 'test';
        insert tripdata;
        Trip_Leg__c TripLeg = new Trip_Leg__c ();
        TripLeg.Trip__c =tripdata.id;
        insert TripLeg;
        
        apexpages.currentpage().getparameters().put('id',tripdata.id);
        ApexPages.StandardController stdCont1=new ApexPages.StandardController(tripdata);
        TripController TripControllerObj1=new TripController(stdCont1);
        
        List<SelectOption> lst= TripControllerObj1.getDiffValues();
       
        TripControllerObj1.pgSaveRecord();
        
        TripControllerObj1.strSelDiff='all';
        TripControllerObj1.forAdventrueRecrods();
        TripControllerObj1.strSelDiff='One';
        TripControllerObj1.forAdventrueRecrods();
        
        TripControllerObj1.Last();
        TripControllerObj1.Next();
        TripControllerObj1.Previous();
        TripControllerObj1.First();

    }
}