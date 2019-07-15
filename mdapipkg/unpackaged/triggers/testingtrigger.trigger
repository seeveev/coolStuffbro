trigger testingtrigger on Testing__c (before insert, after insert) 
{
    system.debug('***** my trigger starteed... '+trigger.new);   
    //it will perform all validaiton ..all logics you want in this trigger
   
    if(Trigger.isInsert) // will pass only for insert operations
    {
        if(trigger.isBefore)
        {
            Testingtrigger_handler.beforeinsertlogic(Trigger.new);
        }
        if(trigger.isAfter)
        {
            Testingtrigger_handler.afterinsertlogic(Trigger.new);
        }
    }
    
    if(Trigger.isUpdate) // will pass only for update...
    {
        if(trigger.isAfter)
        {
            Testingtrigger_handler.afterupdatelogic(Trigger.new);
        }
         if(trigger.isBefore)
        {
            Testingtrigger_handler.beforeupdatelogic(Trigger.new);
        }
    }
}