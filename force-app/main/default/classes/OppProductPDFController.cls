public class OppProductPDFController {
    public List<OpportunityLineItem> lstOppLinITem    {get;set;}
    public OppProductPDFController(){
        lstOppLinITem = [SELECT CPE_NRC_Price_c__c,lineItem__c,ListPrice,NRC_Price_c__c,OppLI__c,OpportunityId,PricebookEntryId,Quantity,Quooo__c,Renewal_MRC__c,Term_months__c,TotalPrice,UnitPrice FROM OpportunityLineItem WHERE OpportunityId =:apexpages.currentpage().getparameters().get('id')];
    }
}