public class CKTextDemoController {
    public Page_Component__c oPageComponent  {get;set;}
    public CKTextDemoController(ApexPages.StandardController controller) {
     oPageComponent = (Page_Component__c)controller.getRecord();
    }
    public pagereference save(){
    insert oPageComponent;
    return null;
    }
    
}