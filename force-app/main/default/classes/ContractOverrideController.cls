public class ContractOverrideController {
    public Contract objCon    {get;set;}
    public ContractOverrideController(ApexPages.StandardController controller) {
        objCon = new Contract();
    }

    
    public ContractOverrideController(){
        
    }
    
    public pageReference save(){
        
        insert objCon;
        
        PageReference pdf = Page.OppProductPDFPreview;
        //pdf.getParamters().put('id','ttttt');
        
        Blob body = pdf.getContentAsPDF();
        Attachment attach = new Attachment();
        attach.Body=body;
        attach.Name='test' + System.today() + '.pdf';
        attach.isPrivate=false;
        attach.ParentId=objCon.id; 
        insert attach;
        
        PageReference objPg = new PageReference('/' + objCon.id);
        return objPg;
    }
}