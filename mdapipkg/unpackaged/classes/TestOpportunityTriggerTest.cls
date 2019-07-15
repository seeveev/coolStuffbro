@isTest
private class TestOpportunityTriggerTest
{
    static TestMethod void testMethodOpp()
    {
        try{
            Date myDate = date.newinstance(1960, 2, 17);
            Opportunity opp = new Opportunity();
            opp.Name='Name';
            opp.CloseDate=myDate;
            opp.StageName='Closed Lost';
            insert opp;
            
            Product2 p2= new Product2(Name='Test Product');
            insert p2;
            OpportunityLineItem oli = new OpportunityLineItem(OpportunityId=opp.Id);
            insert oli;
        }Catch(Exception ae){}
        
    }
}