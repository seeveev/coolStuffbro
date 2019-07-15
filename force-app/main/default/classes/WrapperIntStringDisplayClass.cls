public with sharing class WrapperIntStringDisplayClass {
   public String strBTNNumber  {get;set;}
// Creating lists for the object Products__c and Hierarchy__c.
List<Products__c> lstProd = new List<Products__c>();
List<Hierarchy__c> lstHier = new List<Hierarchy__c>();
// Creating List for Wrapper class
public List<wrapper> lstw = new List<wrapper>();
// Get method calling from PageBlockTable and return the list of wrapper to Table
            public List<wrapper> getLstwrapperIntString() {
                    strBTNNumber = apexpages.currentpage().getparameters().get('btnNumber');
            
                    lstProd = [select id,Account_Id__c,Phone_Number__c,Name from Products__c where Phone_Number__c=:strBTNNumber];
                    lstHier = [select id,Account_Id__c,BTN_Phone__c from Hierarchy__c where BTN_Phone__c=:strBTNNumber];
                    for(Integer i=0;i<lstHier.size();i++){
                    lstw.add(new wrapper(lstProd[i].Account_Id__c,lstHier[i].Account_Id__c));
                                    }

                return lstw;
                                            }
public class wrapper{
public String Tid{get;set;}
public String Did{get;set;}
      

// Wrapper class constructor

public wrapper(String Tid,String Did){

this.Tid=Tid;
this.Did=Did;
String strBTNNumber = Apexpages.currentPage().getParameters().get('btnNum');
system.debug('*****vijay' +strBTNNumber );
}

}

}