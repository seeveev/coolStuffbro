public class assignclass {

public list<hierarchy__c> lsthir {get; set;}
  string strhir = 'Select Name__c, BTN_phone__c from hierarchy__c';

    public assignclass() {

    }


Public List<hierarchy__c> getValues() {
lsthir = [select Name__c from hierarchy__c];

return lsthir;

}


    public assignclass(ApexPages.StandardController controller) {

    }

}