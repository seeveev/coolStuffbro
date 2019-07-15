public class detailinfoController {

    public String getLsthier1() {
        return null;
    }


    public List<hierarchy__c> Lsthier{ get; set;}
   

 public List<search2> lstDetails    {get;set;}
    
    public detailinfoController(){
        //REad the BTN VAlue
        String strID = Apexpages.currentPage().getParameters().get('detailID');
        System.debug('**** strBTNValue ' + strID);
    List<hierarchy__c> Lsthier = [Select Name__c, Id,BTN_Phone__c,billing_id__c from hierarchy__c Where Id=:strID];
}


   
}