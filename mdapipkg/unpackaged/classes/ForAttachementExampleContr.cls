public class ForAttachementExampleContr {

    public PageReference saveFileToOpp() {
        Attachment att = new Attachment(name ='Invoice_AnyUniqueName.pdf');
         PageReference invoicePage = Page.OppProductPDF;
         invoicePage .getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
         // return page content as blob type
         // Alt: att.body = invoicePage .getContentAsPDF();
         att.body = invoicePage .getContent();
         // Associate with project's record Id
         att.parentid = apexpages.currentpage().getparameters().get('id');
         insert att;
        return null;
    }

    public List<OpportunityLineItem> lstOppLinITem    {get;set;}
    public ForAttachementExampleContr(){
        lstOppLinITem = [SELECT CPE_NRC_Price_c__c,lineItem__c,ListPrice,NRC_Price_c__c,OppLI__c,OpportunityId,PricebookEntryId,Quantity,Quooo__c,Renewal_MRC__c,Term_months__c,TotalPrice,UnitPrice FROM OpportunityLineItem WHERE OpportunityId =:apexpages.currentpage().getparameters().get('id')];
    }
}