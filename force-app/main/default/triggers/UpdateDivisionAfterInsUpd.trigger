//This will get Division from userDivision object
trigger UpdateDivisionAfterInsUpd on custom__c (before insert, before update) {
    
    //ClsCustomTrigger objCusTrigg = new ClsCustomTrigger();
    custom__c cus = trigger.new[0];
    userdivision__c objUsD = [Select u.username__c, u.division__c From userdivision__c u where username__c=:cus.OwnerId];
    
    if(objUsD<>null)
        cus.DivisionHide__c = objUsD.division__c;
    else
        cus.DivisionHide__c = '';
    
}