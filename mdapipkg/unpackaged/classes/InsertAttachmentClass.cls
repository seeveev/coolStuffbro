public with sharing class InsertAttachmentClass {
    @Future(callout=true)
    public static void insertAtt(String lstCon){
        List<Attachment> lstAtt = new List<Attachment>();
        //for(Contract ct:lstCon){
            PageReference pdf = Page.OppProductPDFPreview;
            //pdf.getParamters().put('id','ttttt');
            
            Blob body = pdf.getContentAsPDF();
            Attachment attach = new Attachment();
            attach.Body=body;
            attach.Name='test' + System.today() + '.pdf';
            attach.isPrivate=false;
            attach.ParentId=lstCon; 
            lstAtt.add(attach);
            
        //}
        if(lstAtt.size()>0) insert lstAtt;
    }
}