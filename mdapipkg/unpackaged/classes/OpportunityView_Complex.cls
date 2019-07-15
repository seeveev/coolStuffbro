public class OpportunityView_Complex {
    public boolean bolRecordType1    {get;set;}
    public boolean bolRecordType2    {get;set;}
    public Opportunity objOpp    {get;set;}
    public boolean bolReadOnlyMode    {get;set;}
    public List<OpportunityLineItem> lstOppLineItem    {get;set;}
    public List<PricebookEntry> lstPricebook {get; set;}
    public List<Opportunity> lstprod{get;set;}
    public String strOppID    {get;set;}
    public List<Quote> lstQuote    {get;set;}
    
    public OpportunityView_Complex(ApexPages.StandardController controller) {
        
        //Set it as default
        strOppID = apexpages.currentpage().getparameters().get('id');
        lstOppLineItem = new List<OpportunityLineItem>();
        lstQuote = new List<Quote>();
        
        objOpp = (Opportunity)controller.getRecord();
      //  objOpp = [SELECT AccountId,Amount,CampaignId,CloseDate,CreatedById,CreatedDate,CurrentGenerators__c,DeliveryInstallationStatus__c,Description,ExpectedRevenue,Fiscal,FiscalQuarter,FiscalYear,ForecastCategory,ForecastCategoryName,HasOpportunityLineItem,Id,IsClosed,IsDeleted,IsPrivate,IsWon,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,lauch__c,LeadSource,MainCompetitors__c,Name,NextStep,OrderNumber__c,OwnerId,Pricebook2Id,Probability,RecordTypeId,StageName,SyncedQuoteId,SystemModstamp,TotalOpportunityQuantity,TrackingNumber__c,Type FROM Opportunity where id =:ApexPages.currentPage().getParameters().get('id')];
        String strRecordType = apexpages.currentpage().getparameters().get('RecordType');
        RecordType objRecordType;
        System.debug('*** RT ' + bolRecordType1 + '    ' + bolRecordType2 );
    }
    
    public PageReference saveOpportunity(){
        if(objOpp!=null)
            upsert objOpp;
        
        //Calling methods
        OppLineItem();
        OppQuote();
         pricebookitem();
        bolReadOnlyMode = true;
        
        PageReference pg = new PageReference('/apex/opportunitypage?id=' + objOpp.id);
        return pg;
       // strOppID = objOpp.id;
       // return null;
        
    }
    
    
    public PageReference editOpportunity(){
        strOppID = null;
    
            return null;
    }
    public void pricebookitem(){
       lstpricebook = [SELECT CreatedById,CreatedDate,Id,IsActive,IsDeleted,LastModifiedById,LastModifiedDate,Name,Pricebook2Id,Product2Id,ProductCode,SystemModstamp,UnitPrice,UseStandardPrice FROM PricebookEntry ];
    
    }
    public void OppLineItem(){
        if(strOppID!=null && strOppID!='')
            lstOppLineItem = [SELECT CPE_NRC_Price_c__c,CreatedById,CreatedDate,Description,Id,IsDeleted,LastModifiedById,LastModifiedDate,lineItem__c,ListPrice,NRC_Price_c__c,OppLI__c,OpportunityId,PricebookEntryId,Quantity,Renewal_MRC__c,ServiceDate,SortOrder,SystemModstamp,Term_months__c,TotalPrice,UnitPrice FROM OpportunityLineItem WHERE OpportunityId =:strOppID];
    }
    //[SELECT AdditionalCity,AdditionalCountry,AdditionalLatitude,AdditionalLongitude,AdditionalName,AdditionalPostalCode,AdditionalState,AdditionalStreet,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingName,BillingPostalCode,BillingState,BillingStreet,ContactId,CreatedById,CreatedDate,Description,Discount,Email,ExpirationDate,Fax,GrandTotal,Id,IsDeleted,IsSyncing,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LineItemCount,Name,OpportunityId,Phone,Pricebook2Id,QuoteNumber,QuoteToCity,QuoteToCountry,QuoteToLatitude,QuoteToLongitude,QuoteToName,QuoteToPostalCode,QuoteToState,QuoteToStreet,ShippingCity,ShippingCountry,ShippingHandling,ShippingLatitude,ShippingLongitude,ShippingName,ShippingPostalCode,ShippingState,ShippingStreet,Status,Subtotal,SystemModstamp,Tax,TotalPrice FROM Quote WHERE OpportunityId = '12']
    
    public void OppQuote(){
        if(strOppID!=null && strOppID!='')
            lstQuote = [SELECT AdditionalCity,AdditionalCountry,AdditionalLatitude,AdditionalLongitude,AdditionalName,AdditionalPostalCode,AdditionalState,AdditionalStreet,BillingCity,BillingCountry,BillingLatitude,BillingLongitude,BillingName,BillingPostalCode,BillingState,BillingStreet,ContactId,CreatedById,CreatedDate,Description,Discount,Email,ExpirationDate,Fax,GrandTotal,Id,IsDeleted,IsSyncing,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,LineItemCount,Name,OpportunityId,Phone,Pricebook2Id,QuoteNumber,QuoteToCity,QuoteToCountry,QuoteToLatitude,QuoteToLongitude,QuoteToName,QuoteToPostalCode,QuoteToState,QuoteToStreet,ShippingCity,ShippingCountry,ShippingHandling,ShippingLatitude,ShippingLongitude,ShippingName,ShippingPostalCode,ShippingState,ShippingStreet,Status,Subtotal,SystemModstamp,Tax,TotalPrice FROM Quote WHERE OpportunityId =:strOppID];
    }

}