trigger deleterecords on Provisioning__c (after insert) {
 
   List <A_R_info__c> lstbilling = new List<A_R_info__c>();             /*defining a list bcause we need to get all the a/r info updated. */
  set<Id> Ids= new set<Id>();
for(Provisioning__c pro:trigger.new )
   lstbilling =[select bd.id,bd.Library_id__c,bd.Account_Id__c from A_R_info__c bd where Account_Id__c=:pro.Account_Id__c  ];   /* comparing the records with same account id*/

 if(lstbilling.size()>=0){
          A_R_info__c objar = lstbilling[0];
       //   objar.library_id__c= pro.Library_id__c;
          delete objar;
      }
}