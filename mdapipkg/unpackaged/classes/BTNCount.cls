global class BTNCount implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator('SELECT BTN_Phone__c,WTN__c FROM hierarchy__c where BTN_Phone__c != null AND WTN__c != null');
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        List<hierarchy__c> lstHir = scope;
        
        for(hierarchy__c objH:lstHir)
        {
            //Check wether data is available in table
            List<BTNCount__c> lstBTN = [SELECT Count__c,Name FROM BTNCount__c where Name=:objH.BTN_Phone__c];
            if(lstBTN.size()>0)
            {
                BTNCount__c objBTNcntT = lstBTN[0];
                objBTNcntT.Count__c = lstBTN[0].Count__c+1;
                update objBTNcntT;
            }
            else
            {
                BTNCount__c objBTNcnt = new BTNCount__c();
                objBTNcnt.name=objH.BTN_Phone__c;
                objBTNcnt.Count__c = 1;
                insert objBTNcnt;
            }
        }
    }
    
    global void finish(Database.BatchableContext BC)
    {}
}