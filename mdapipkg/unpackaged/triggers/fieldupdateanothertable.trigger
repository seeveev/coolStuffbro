/*this trigger is used to update the record in the orthe table when an update is done on the billngtable for that accountid */

trigger fieldupdateanothertable on Billing_Detail_1__c (after update) {
 set<Id> Ids= new set<Id>();     /*this line is to get all the ids into the 'ID' */
for(Billing_Detail_1__c BD1: trigger.new ){                    /*to start the trigger,  */
   Ids.add(BD1.Id); 										/*to get the billing details id into the Variable ID */	
//  }
  List <A_R_info__c> lstbilling = new List<A_R_info__c>();             /*defining a list bcause we need to get all the a/r info updated. */
   lstbilling =[select bd.id,bd.Library_id__c,bd.Account_Id__c from A_R_info__c bd where Account_Id__c=:BD1.Account_Id__c  ];   /* comparing the records with same account id*/
  // lIST<A_R_info__c> ar = new LIST<A_R_info__c>();
 // ar= [select ar.id,  ar.Account_Id__c,ar.Library_id__c from A_R_info__c ar where Account_Id__c=:BD1.Account_Id__c ]; 
 //   for(Billing_Detail_1__c temp:lstbilling ) 
  // {
      // A_R_info__c ar = new A_R_info__C();
      //   ar.library_id__c= BD1.Library_id__c;
       //  ar.add(ar.library_id__c= BD1.Library_id__c);
          //   upsert ar;
   /* to check the size of the list whether its null or nt..*/
     if(lstbilling.size()>=0){
          A_R_info__c objar = lstbilling[0];
          objar.library_id__c= BD1.Library_id__c;
          update objar;
      }
//  }
 
 }
}