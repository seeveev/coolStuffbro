public class Mapscontroller {
map <Id,Account> accountIdMap =new map<Id,Account>();
map<id,A_R_info__c> maparinfo =new map<id,A_R_info__c>();

public Mapscontroller(){
methodName();
}

public void methodName(){
	Integer mycount =0; 
list<hierarchy__c> lsthier = new list<hierarchy__c>();
lsthier=[select id, name,BTN_Phone__c,Account_Id__c from hierarchy__c];	
list<A_R_info__c> lstarinfo =new list<A_R_info__c>();
lstarinfo =[select id, name,Phone_Number__c,Account_Id__c from A_R_info__c];
//map<id,A_R_info__c> maparinfo = new  map<id,A_R_info__c>();
for(A_R_info__c ar: lstarinfo){
    maparinfo.put(ar.Account_Id__c,ar);
    }
	for(hierarchy__c hr:lsthier){
		if(maparinfo.containsKey(hr.Account_Id__c)){
		  mycount =+1;
		  system.debug('#####count'+mycount);
		}
	}
	
/*	
list<account> acc1 = new list<account> ();
acc1 =[select id, name from Account];
system.debug('*******######'+acc1);
account acc2 =new account();
account acc3 = new account();
// populating the map with account id and account object
for(account Acc :acc1){
accountIdMap.put(acc.id,acc);
system.debug('**********'+accountIdMap .put(acc.id,acc));
}
accountIdMap .put(acc2.id,acc2);
accountIdMap .put(acc3.id,acc3);
*/
}
    
}