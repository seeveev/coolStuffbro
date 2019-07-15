public class ClsXMLProcess{
    public void ClsXMLProcessMethod(MyUserDefinedClassXML myCls){
        XMLInput__c objxml = new XMLInput__c();
        objxml.OpportunityId__c = myCls.OpportunityId;
        objxml.SFAQuoteId__c = myCls.SFAQuoteId;
        objxml.CPQQuoteId__c = myCls.CPQQuoteId;
        objxml.QuoteType__c = myCls.QuoteType;
        objxml.ApprovalType__c = myCls.ApprovalType;
        objxml.ExpediteIncluded__c = myCls.ExpediteIncluded;
        objxml.SubmittedBy__c = myCls.SubmittedBy;
        insert objxml;
                    
    }
}