trigger addNewProduct on OpportunityLineItem (before insert) {
    
    for (OpportunityLineItem opll:Trigger.new){
        if (opll.lineItem__c==''||opll.lineItem__c==null){
            System.debug('error from trigger ' + opll.lineItem__c);
            opll.addError('Item code cannot be empty from oppor   testestest');    
        }
    }
    
    //List<OpportunityLineItem> opl = new List<OpportunityLineItem>();
    //opl[0].addError('Item code cannot be empty from oppor Line item');
   
   /* opl=[SELECT Description,IsDeleted,OppLI__c,lineItem__c FROM OpportunityLineItem where OpportunityID =:o.ID];
    for (OpportunityLineItem opll:opl){
        if (opll.lineItem__c==''||opll.lineItem__c==null){
            System.debug('error from trigger ' + opll.lineItem__c);
            trigger.new[0].name.addError('Item code cannot be empty from oppor');
        }
    }*/
}