public class ScheduleOverrideController {
    public Schedule__c objSc {get;set;}
    public String strID    {get;set;}
    
    public ScheduleOverrideController(ApexPages.StandardController controller) {
        objSC = new Schedule__c();
        strID = apexpages.currentpage().getparameters().get('retURL');
        strID = strID.replace('%2F','');
        strID = strID.replace('/','');
        objSC.Contract__c= strID;
    }
    public PageReference saveSch(){
        insert objSC;
        
        
        PageReference pdf = Page.OppProductPDFPreview;
        //pdf.getParamters().put('id','ttttt');
        
        Blob body = pdf.getContentAsPDF();
        Attachment attach = new Attachment();
        attach.Body=body;
        attach.Name='test' + System.today() + '.pdf';
        attach.isPrivate=false;
        attach.ParentId=objSC.Contract__c; 
        insert attach;
        
        PageReference objPg = new PageReference('/' + objSC.Contract__c);
        return objPg;
    }
}