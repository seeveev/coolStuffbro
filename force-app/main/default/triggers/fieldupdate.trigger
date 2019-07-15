trigger fieldupdate on Billing_Detail_1__c (after insert, after update) {
for(Billing_Detail_1__c BD: trigger.new )
if(BD.Library_Id__c==''||BD.Library_Id__c==null)
BD.addError('Enter the Library Id ra Jaffa nayala.. ');

}