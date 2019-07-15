trigger InsertAttachment on Contract (after update) {
    /*List<Attachment> lstAtt = new List<Attachment>();
    for(Contract ct:Trigger.new){
        PageReference pdf = Page.OppProductPDFPreview;
        //pdf.getParamters().put('id','ttttt');
        
        Blob body = pdf.getContentAsPDF();
        Attachment attach = new Attachment();
        attach.Body=body;
        attach.Name='test' + System.today() + '.pdf';
        attach.isPrivate=false;
        attach.ParentId=ct.id;
        lstAtt.add(attach);
        
    }
    if(lstAtt.size()>0) insert lstAtt;*/
    InsertAttachmentClass.insertAtt(Trigger.new[0].id);
}