trigger UpdateAddressFields on SterlingQuoteItem__c (before insert,before update) {
    for(SterlingQuoteItem__c objSQ:Trigger.new){
        //SterlingQuote__c
        SterlingQuote__c objSQT = [select id,OpportunityId__c from SterlingQuote__c where id=:objSQ.SterlingQuote__c];
        Opportunity objOpp = [select id, AccountID from Opportunity where id=:objSQT.OpportunityId__c];
        Account objAcc=[SELECT ShippingCity,ShippingCountry,ShippingLatitude,ShippingLongitude,ShippingPostalCode,ShippingState,ShippingStreet FROM Account where id=:objOpp.AccountID];
        
        objSQ.StreetName__c = objAcc.ShippingStreet;
        
        
    }
}