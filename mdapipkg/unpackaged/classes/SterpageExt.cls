public class SterpageExt
 {
      public SterlingQuoteItem__c SterlingQuoteItem {get;set;}
        public List<ProcessInstanceWorkitem> lstProIns    {get;set;}
        
   public Apexpages.Standardcontroller controller {get;set;}
     
     
    public String lastname {get {return lastname;}         
        set;
    } 
    
    public String firstname {get {return firstname;}         
        set;
    } 
  
    public String userselected {get {return userselected;} 
        set ;
    }
    
    private SterlingQuoteItem__c ICB;
  
  
  
 
        public String strOverride {get;set;} //VJ
  
        public PageReference SaveOver() {
              upsert objSQi;
              strOverride = objSQi.Id;
              system.debug('*****objsqi '+strOverride );
  
        return new Pagereference('/apex/QuoteLineItem?id='+strOverride);

    }

    public SterlingQuote__c sterlingQuote       {get;set;}
    public SterlingQuoteItem__c objSQi    {get;set;}
    public SterpageExt(ApexPages.StandardController controller) {
 
        objSQi = [SELECT AddressDescription__c,AddressText__c,AddressType__c,ICBTerritories_c__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,CPQLineNumber__c,CreatedById,CreatedBy__c,CreatedDate,DataRegion__c,Description__c,DiscountType__c,Discount_DiscountAmountDiscountAmount__c,GFItem__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,LastActivityDate,LastModifiedById,LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDate__c,ScheduleId__c,ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateOrProvince__c,Status_Date__c,Status__c,SterlingQuote__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,Subtotal__c,SystemModstamp,TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,unit_Designator__c,unit_number__c,WireCenter__c FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id') ];
        strOverride = apexpages.currentpage().getparameters().get('id');
        sterlingQuote = [Select id,RecordTypeid,RecordType.Name,IsSyncing__c,QuoteType__c,OpportunityId__c from SterlingQuote__c where id=:objSQi.SterlingQuote__c ]; //VJ

        if(objSQi.StateOrProvince__c == 'AK')
            objSQi.ICBTerritories_c__c='Arizona';
        
        lstProIns = new List<ProcessInstanceWorkitem>();
        lstProIns = [SELECT Id FROM ProcessInstanceWorkitem WHERE ProcessInstance.TargetObjectId = :objSQi.id AND ProcessInstance.Status = 'Pending'];
        
        
        //SterlingQuoteItem = new SterlingQuoteItem__c();
        //SterlingQuoteItem = objSQi;
       // SterlingQuoteItem = [SELECT AddressDescription__c,Jeopardy__c,URL__c,City__c, State__c , Country__c, Zipcode__c,CPE_NRC_Price__c,Renewal_MRR__c,CPE_Gross_Margin__c , AddressText__c,AddressType__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,CPQLineNumber__c,CreatedById,CreatedBy__c,CreatedDate,DataRegion__c,Description__c,DiscountAmount__c,DiscountType__c,GFItem__c,ICBApprovalRouting__c,ICBOriginatorPhone__c,ICBOriginator__c,ICBPriority__c,ICBProductLine__c,ICBProjectName__c,ICBSalesManager__c,ICBSalesRepresentative__c,ICBRegion__c,SterlingQuote__c,ICBCustomerName__c,ICBTerritories__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,LastActivityDate,LastModifiedById,LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDate__c,ScheduleId__c,ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateOrProvince__c,Status_Date__c,Status__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,Subtotal__c,SystemModstamp,TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,unit_Designator__c,unit_number__c,WireCenter__c FROM SterlingQuoteItem__c where id=:apexpages.currentpage().getparameters().get('id') ];

   
     }
       void getuserinfo(string ICB) {
           list<user> lookupuser=new list<user>();
           lookupuser=[select lastname,firstname from user where id=:ICB] ;
             
           if (lookupuser.size()>0) {
                lastname=lookupuser[0].lastname;   
                firstname=lookupuser[0].firstname;                         
           }
    }
    
              
     public PageReference SaveOverrideButton()     {       
                
        try {
                update  this.objSQi; 
                System.debug('Important '+this.objSQi);   
        }
        catch (Exception e) {
                system.debug ('bbbbbbbbb' + e );        
        } 
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        req1.setObjectId(objSQi.id);
        Approval.ProcessResult result = Approval.process(req1); 
        PageReference pageRef = new PageReference('/apex/QuoteLineItem');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
    } 
    
    
  /*  public PageReference SaveOverrideButton()     {       
        try {
                update  ICB;    
        }
        catch (Exception e) {
                system.debug ('bbbbbbbbb' + e );        
        } 
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        req1.setObjectId(apexpages.currentpage().getparameters().get('id'));
        Approval.ProcessResult result = Approval.process(req1); 
        PageReference pageRef = new PageReference('/apex/sterlingpageoverride');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
   
    } 
    */
    
    public PageReference Edit() {
      //  strOverride=null;
        
        //https://cs8.salesforce.com/a1fL00000003MCt/e?retURL=https%3A%2F%2Fc.cs8.visual.force.com%2Fapex%2FQuoteLineItem%3Fid%3Da1fL00000003MCt%26sfdc.override%3D1%26core.apexpages.devmode.url%3D1
        PageReference pg = new PageReference('/'+strOverride +'/e?retURL=https%3A%2F%2F'+System.URL.getSalesforceBaseURL().getHost()+'%2Fapex%2FQuoteLineItem%3Fid%3D'+strOverride +'%26sfdc.override%3D1%26core.apexpages.devmode.url%3D1');
        
        return pg;
     }
    
        
    public PageReference BackCustom() {
        return new PageReference('/apex/sterlingquotepageoverride?id='+objSQi.SterlingQuote__c+'&sfdc.override=1');
    }
     
     public boolean displayPopup {get; set;}     
    
    public pagereference closePopup() {        
        displayPopup = false;   
        System.debug('**** strq ' + objSQi );
                //update  SterlingQuoteItem; 
                update objSQi;
        
        //PUt the approval process code ehre. a
        
        // Create an approval request for the account
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();  
        req1.setComments('Submitted for Approval');
        req1.setObjectId(objSQi.id);
        Approval.ProcessResult result = Approval.process(req1); 
        
        PageReference pageRef = new PageReference('/apex/QuoteLineItem');
        pageRef.getParameters().put('id',apexpages.currentpage().getparameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
       // return null;
   
    }     
    public void showPopup() {        
        displayPopUp = true; 
        
           
    }
    public void cancelpopup(){
     displayPopup = false;      
    }
    
      public Map<String, String> stateToStateCodes = new Map<String, String>{
                                                    'Alabama' =>'AL'.toLowerCase(),
                                                    'Alaska' =>'AK'.toLowerCase(),
                                                    'Arizona' =>'AZ'.toLowerCase(),
                                                    'Arkansas' =>'AR'.toLowerCase(),
                                                    'California' =>'CA'.toLowerCase(),
                                                    'Colorado' =>'CO'.toLowerCase(),
                                                    'Connecticut' =>'CT'.toLowerCase(),
                                                    'Delaware' =>'DE'.toLowerCase(),
                                                    'Florida' =>'FL'.toLowerCase(),
                                                    'Georgia'=>'GA'.toLowerCase(),
                                                    'Hawaii'=>'HI'.toLowerCase(),
                                                    'Idaho'=>'ID'.toLowerCase(),
                                                    'Illinois'=>'IL'.toLowerCase(),
                                                    'Indiana'=>'IN'.toLowerCase(),
                                                    'Iowa'=>'IA'.toLowerCase(),
                                                    'Kansas'=>'KS'.toLowerCase(),
                                                    'Kentucky'=>'KY'.toLowerCase(),
                                                    'Louisiana'=>'LA'.toLowerCase(),
                                                    'Maine'=>'ME'.toLowerCase(),
                                                    'Maryland'=>'MD'.toLowerCase(),
                                                    'Massachusetts'=>'MA'.toLowerCase(),
                                                    'Michigan'=>'MI'.toLowerCase(),
                                                    'Minnesota'=>'MN'.toLowerCase(),
                                                    'Mississippi'=>'MS'.toLowerCase(),
                                                    'Missouri'=>'MO'.toLowerCase(),
                                                    'Montana'=>'MT'.toLowerCase(),
                                                    'Nebraska'=>'NE'.toLowerCase(),
                                                    'Nevada'=>'NV'.toLowerCase(),
                                                    'New Hampshire'=>'NH'.toLowerCase(),
                                                    'New Jersey'=>'NJ'.toLowerCase(),
                                                    'New Mexico'=>'NM'.toLowerCase(),
                                                    'New York'=>'NY'.toLowerCase(),
                                                    'North Carolina'=>'NC'.toLowerCase(),
                                                    'North Dakota'=>'ND'.toLowerCase(),
                                                    'Ohio'=>'OH'.toLowerCase(),
                                                    'Oklahoma'=>'OK'.toLowerCase(),
                                                    'Oregon'=>'OR'.toLowerCase(),
                                                    'Pennsylvania'=>'PA'.toLowerCase(),
                                                    'Rhode Island'=>'RI'.toLowerCase(),
                                                    'South Carolina'=>'SC'.toLowerCase(),
                                                    'South Dakota'=>'SD'.toLowerCase(),
                                                    'Tennessee'=>'TN'.toLowerCase(),
                                                    'Texas'=>'TX'.toLowerCase(),
                                                    'Utah'=>'UT'.toLowerCase(),
                                                    'Vermont'=>'VT'.toLowerCase(),
                                                    'Virginia'=>'VA'.toLowerCase(),
                                                    'Washington'=>'WA'.toLowerCase(),
                                                    'West Virginia'=>'WV'.toLowerCase(),
                                                    'Wisconsin'=>'WI'.toLowerCase(),
                                                    'Wyoming'=>'WY'.toLowerCase()
                                                    };
    
    
    
    
    
    
    
    
    
    
    
    
    
     
}