trigger closeDate on Opportunity (before update) {
    for (Opportunity o:Trigger.new){
        List<OpportunityLineItem> opl = new List<OpportunityLineItem>();
        opl=[SELECT Description,IsDeleted,OppLI__c,lineItem__c FROM OpportunityLineItem where OpportunityID =:o.ID];
        for (OpportunityLineItem opll:opl){
            if (opll.lineItem__c==''||opll.lineItem__c==null){
                System.debug('error from trigger ' + opll.lineItem__c);
                trigger.new[0].name.addError('Item code cannot be empty from oppor');
            }
        }
    }
}