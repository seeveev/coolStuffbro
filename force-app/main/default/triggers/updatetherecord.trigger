trigger updatetherecord on Provisioning__c (after insert) {
 A_R_info__c ar = new A_R_info__C();
for(Provisioning__c pro:trigger.new )
  //  objar= [select ar.id,  ar.Account_Id__c,ar.Library_id__c, ar.Phone_Number__c from A_R_info__c ar ]; 
            ar.Phone_Number__c= pro.Phone_Number__c;
       // ar.add(ar.library_id__c= BD1.Library_id__c);
           insert ar;
}