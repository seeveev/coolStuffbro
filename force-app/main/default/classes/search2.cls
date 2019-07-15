public class search2 {
Public String myparam{get;set;}

    public String getBtnNum() {
        return null;
    }
   

public static String strhier = 'Select Name__c,Id, BTN_Phone__c,billing_id__c from hierarchy__c';
public List<hierarchy__c> lsthier{get; set;}
public String Strbutton { get; set; }
Public String Strsearchtext {get; set;}
public String strSearchByValue{ get; set;}
public static String strSearchByStandardValues='Name,Billing Id,Telephone';
 public String strQuery1;

       public List<selectOption> getaccts() {
        //Get the List Values
        List<String> lstSelValues=strSearchByStandardValues.split(',');
        
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        for(String strVal:lstSelValues){
                options.add(new selectOption(strVal, strVal)); 
        }
        return options; //return the picklist options
    }
   
    public PageReference strbutton() {
    
     if(strSearchByStandardValues==null || strSearchByStandardValues==''){
                   ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select Search By Value'));
                    return null;
           }
            
           if(strhier==null || strhier==''){
            }
    
  // String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + Strsearchtext + '%\'';
     //  lsthier= Database.query(strQuery);
                        System.debug('***** search value ' + strSearchByValue);

if(strSearchByValue.equals('Billing Id')){

  //strQuery = strHirarchyQuery + ' WHERE WTN__c LIKE \'%' + strColumnValue + '%\' OR WTN__c LIKE \'%' + strPhoneNumberOnly + '%\' ORDER BY Name__c ASC NULLS LAST LIMIT 49999';
      strQuery1 = strhier + ' WHERE billing_id__c LIKE \'%'+ Strsearchtext +'%\'' ;
        //String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + Strsearchtext + '%\'';
        }else{
                if(strSearchByValue.equals('Name')){
      strQuery1 = strhier + ' WHERE Name__c LIKE \'%'+ Strsearchtext +'%\'' ;
        }
             else{
                if(strSearchByValue.equals('Telephone')){
      strQuery1 = strhier + ' WHERE BTN_Phone__c LIKE \'%'+ Strsearchtext +'%\'' ;
        }              
}
            }
            System.debug('***** query ' +strQuery1);

        if(strQuery1!=null)
            lsthier= Database.query(strQuery1);
                   System.debug('***** phone ' + Strsearchtext);
            
                return null;

}
  public PageReference searchSelectedUserData() {
     // List<hierarchy__c> Lsthier = [Select Name__c, BTN_Phone__c,billing_id__c from hierarchy__c Where id=: myparam];

  
PageReference pageRef = new PageReference('/apex/detailinfo1?detailID=' + Apexpages.currentPage().getParameters().get('ID'));

        return pageRef;
    }
public class ClsCreditInfo2Columns{
        public String strColumn1    {get;set;}
}
}