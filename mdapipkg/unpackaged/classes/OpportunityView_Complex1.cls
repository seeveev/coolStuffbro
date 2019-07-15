public class OpportunityView_Complex1 {
    public boolean bolRecordType1    {get;set;}
    public boolean bolRecordType2    {get;set;}
    public Opportunity objOpp    {get;set;}
    public boolean bolReadOnlyMode    {get;set;}
    public List<OpportunityLineItem> lstOppLineItem    {get;set;}
    public List<PricebookEntry> lstPricebook {get; set;}
    public String strOppID;
    public List<Quote> lstQuote    {get;set;}
    
    public OpportunityView_Complex1(ApexPages.StandardController controller) {
        
        //Set it as default
        strOppID = apexpages.currentpage().getparameters().get('id');
        lstOppLineItem = new List<OpportunityLineItem>();
        lstQuote = new List<Quote>();
        
        objOpp = (Opportunity)controller.getRecord();
               
                
        //Calling methods
        OppLineItem();
        OppQuote();
    }
    
    public void saveOpportunity(){
        if(objOpp!=null)
            insert objOpp;
        
    }
    
     
    public void editOpportunity(){
        if(objOpp!=null)
            upsert objOpp;

    }
    public void OppLineItem(){
        if(strOppID!=null && strOppID!='')
            lstOppLineItem = [SELECT  PricebookEntry.Name,CPE_NRC_Price_c__c,CreatedById,CreatedDate,Description,Id,IsDeleted,LastModifiedById,LastModifiedDate,lineItem__c,ListPrice,NRC_Price_c__c,OppLI__c,OpportunityId,PricebookEntryId,Quantity,Renewal_MRC__c,ServiceDate,SortOrder,SystemModstamp,Term_months__c,TotalPrice,UnitPrice FROM OpportunityLineItem WHERE OpportunityId =:strOppID];
  System.debug('****opplineitem'   +lstOppLineItem);
    }
    //[SELECT AdditionalCity,AdditionalCountry,AdditionalLatitude,AdditionalLongitude,AdditionalName,AdditionalPostalCode,AdditionalState,AdditionalStreet,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingName,BillingPostalCode,BillingState,BillingStreet,ContactId,CreatedById,CreatedDate,Description,Discount,Email,ExpirationDate,Fax,GrandTotal,Id,IsDeleted,IsSyncing,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LineItemCount,Name,OpportunityId,Phone,Pricebook2Id,QuoteNumber,QuoteToCity,QuoteToCountry,QuoteToLatitude,QuoteToLongitude,QuoteToName,QuoteToPostalCode,QuoteToState,QuoteToStreet,ShippingCity,ShippingCountry,ShippingHandling,ShippingLatitude,ShippingLongitude,ShippingName,ShippingPostalCode,ShippingState,ShippingStreet,Status,Subtotal,SystemModstamp,Tax,TotalPrice FROM Quote WHERE OpportunityId = '12']
    
    public void OppQuote(){
        if(strOppID!=null && strOppID!='')
            lstQuote = [SELECT AdditionalCity,AdditionalCountry,AdditionalLatitude,AdditionalLongitude,AdditionalName,AdditionalPostalCode,AdditionalState,AdditionalStreet,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingName,BillingPostalCode,BillingState,BillingStreet,ContactId,CreatedById,CreatedDate,Description,Discount,Email,ExpirationDate,Fax,GrandTotal,Id,IsDeleted,IsSyncing,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LineItemCount,Name,OpportunityId,Phone,Pricebook2Id,QuoteNumber,QuoteToCity,QuoteToCountry,QuoteToLatitude,QuoteToLongitude,QuoteToName,QuoteToPostalCode,QuoteToState,QuoteToStreet,ShippingCity,ShippingCountry,ShippingHandling,ShippingLatitude,ShippingLongitude,ShippingName,ShippingPostalCode,ShippingState,ShippingStreet,Status,Subtotal,SystemModstamp,Tax,TotalPrice FROM Quote WHERE OpportunityId =:strOppID];
     System.debug('****lstquote'   +lstQuote);
   
   
    }

}