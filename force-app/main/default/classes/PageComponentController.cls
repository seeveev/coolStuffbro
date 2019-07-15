public with sharing class PageComponentController {
  public page_component__c oPageComponent {get;set;}
  public String sRecordTypeName {get;set;}
  public map<String,String> mapRecordTypeWiseFieldSetName {get;set;}
  
  public List<Schema.FieldSetMember> lstFields {get;set;}
  
  private String ObjectName;
  
  public PageComponentController(ApexPages.StandardController controller) {
   objectName = 'page_component__c';
   
   oPageComponent = (page_component__c)controller.getRecord();
   System.debug('@Developer --> oPageComponent:' + oPageComponent);
   
   if(oPageComponent.RecordTypeId != null){
     for(RecordType rt :[Select Id,Name,DeveloperName From RecordType Where Id =:oPageComponent.RecordTypeId limit 1]){
      sRecordTypeName = rt.DeveloperName;
     }
     System.debug('@Developer --> sRecordTypeName:' + sRecordTypeName);
     
     /*populateRecorTypeFieldSet();
     if(mapRecordTypeWiseFieldSetName.containsKey(sRecordTypeName)){
       lstFields = fetchFieldSetDetails(mapRecordTypeWiseFieldSetName.get(sRecordTypeName));
       for(page_component__c pc : database.query(buildSOQL())){
        oPageComponent = pc; 
       }
      }*/
      
      lstFields = fetchFieldSetDetails(sRecordTypeName);
      for(page_component__c pc : database.query(buildSOQL())){
       oPageComponent = pc; 
      }
   }
  }
  
  public List<Schema.FieldSetMember> fetchFieldSetDetails(String fieldSetName){      
     Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
     Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
     Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
     Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
     return fieldSetObj.getFields();
  }
  
  /*private void populateRecorTypeFieldSet(){
   mapRecordTypeWiseFieldSetName = new map<String,String>();
    //mapRecordTypeWiseFieldSetName.put('actualRecordTypeDeveloperName' , 'actualFieldSetName');
    
   mapRecordTypeWiseFieldSetName.put('Content' , 'Content');
    mapRecordTypeWiseFieldSetName.put('Chatter' , 'Chatter');
  }*/
  
  private String buildSOQL(){
    String soql = 'Select Id';
    for(Schema.FieldSetMember fld :lstFields) {
     soql += ', ' + fld.getFieldPath();
    }
    soql += ' From '+ ObjectName + ' Where Id = '+ '\'' + oPageComponent.Id + '\'' + ' limit 1';
    
    System.debug('@Developer --> soql:' + soql);     
    return soql;
  }
  
}