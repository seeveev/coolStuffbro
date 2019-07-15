trigger afterinsertonfield on Billing_Detail_1__c (after insert, after update) {
// List<ID> Ids = New List<ID>();
for( Billing_Detail_1__c bd: trigger.new )
   //  Ids.add(Billing_Detail_1__c.Id);
//List <Billing_Detail_1__c> lstbilling = new List<Billing_Detail_1__c>([SELECT Account_Id__c,Id,Library_Id__c,Item_Number__c,LastModifiedDate,Phone_Number__c FROM Billing_Detail_1__c]);
  //  for(integer i=0;i<lstbilling.size();i++){
  //  if(  lstbilling[i].library__c !=null||lstbilling[i].library__c!='')
if(bd.Item_Number__c >2)
    bd.Library_Id__c = bd.Account_Id__c;
}