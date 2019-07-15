public class ClsSearchVendors {
    public List<project__c> lstQuestion {get;set;}
    List<Answers__c> lstAnswers {get;set;}
    List<Vendors__c> lstVendors {get;set;}
    List<contract_names__c> lstContracts {get;set;}
    public List<SelectOption> options {get;set;}
    
    Map<id,project__c> MapObjQuestion {get;set;}
    Map<id,Answers__c> MapObjAnswers {get;set;}
    Map<id,Vendors__c> MapObjVendors {get;set;}
    Map<id,contract_names__c> MapObjContractNames {get;set;}
    
    public ClsSearchVendors(ApexPages.StandardController controller) {
         lstQuestion=new List<project__c>();
         lstQuestion = [SELECT Id,Name,OwnerId FROM project__c];
         options = new List<SelectOption>();
         
         for(project__c objQesTemp:lstQuestion ){
            options.add(new SelectOption('SAM','Sam I Am'));
    
         }
         
    }


  /* ClsSearchVendors(){

        lstQuestion = [SELECT Id,Name,OwnerId FROM project__c];
    }*/
    
    public PageReference pageRedirect() {
        return null;
    }

}