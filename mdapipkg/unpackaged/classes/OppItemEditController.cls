public with sharing class OppItemEditController {
    
    public String strSearchProduct {get;set;}
    public List<clsSelectedProducts> lstClsSelectedProducts {get;set;}
    public List<clsSelectedProducts> lstClsSelectedProductsToDB {get;set;}
    public String strOpportunityID {get;set;}
    public boolean bolShowRecords  {get;set;}
    public SterlingQuote__c objSteQuote    {get;set;}
    
    
    public OppItemEditController(ApexPages.StandardController controller) {
        //Get the information and display on UI
        lstClsSelectedProducts = getAllOrSelectedProducts();
        objSteQuote = new SterlingQuote__c();
    }
    
    //This metho will get only the search Products
    public void getOnlySearchProducts(){
        if(strSearchProduct==null||strSearchProduct==''){
            //Get all the results without any criteria
            lstClsSelectedProducts = getAllOrSelectedProducts();
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Info, 'No Search Criteria Entered')); 
        }else{
            lstClsSelectedProducts = getAllOrSelectedProducts();
        }   
    }
    
    //This metho will get only the selected Products
    public void getOnlySelectedProducts(){
        //Create a List to display on UI
        lstClsSelectedProductsToDB = new List<clsSelectedProducts>();
        //Loop through all the selected products
        for(clsSelectedProducts objSelProTemp: lstClsSelectedProducts){
            System.debug('***** objSelProTemp.bolIsSelected ' + objSelProTemp.bolIsSelected);
            if(objSelProTemp.bolIsSelected==true){
                System.debug('***** In IF Condioin');
                lstClsSelectedProductsToDB.add(objSelProTemp);
            }
        }
        bolShowRecords=true;    //to display the pageblock
        System.debug('***** lstClsSelectedProductsToDB' + lstClsSelectedProductsToDB.size());
    }
    
    //Save the records to DB
    public PageReference saveProducts(){
        //Dispaly Product
        displayPopup = true;
    
        /*if(lstClsSelectedProductsToDB.size()>0){
            strOpportunityID = ApexPages.currentPage().getParameters().get('oppId');
            List<OpportunityLineItem> lstOpportunityLineItem = new List<OpportunityLineItem>();
            
            for(clsSelectedProducts objProd2: lstClsSelectedProductsToDB){
                OpportunityLineItem objLineItem = new OpportunityLineItem();
                objLineItem.OpportunityId = strOpportunityID;
                objlineitem.Quantity = Decimal.valueOf(objProd2.strQuantity);
                objLineItem.TotalPrice = 100;
                PriceBookEntry pbe = [select Id from PriceBookEntry where name =: objProd2.strProductName limit 1];
                objLineItem.PricebookEntryId = pbe.Id;
            
                lstOpportunityLineItem.add(objLineItem);
            }
            insert lstOpportunityLineItem;
        }
        
        PageReference objPG=new PageReference('/' + strOpportunityID);//redirect to opportunity
        return objPG;*/
        return null;
    }
     public PageReference saveProducts1(){
        //Dispaly Product
        displayPopup = true;
    
        if(lstClsSelectedProductsToDB.size()>0){
        
            strOpportunityID = ApexPages.currentPage().getParameters().get('oppId');
            List<OpportunityLineItem> lstOpportunityLineItem = new List<OpportunityLineItem>();
            
            for(clsSelectedProducts objProd2: lstClsSelectedProductsToDB){
                OpportunityLineItem objLineItem = new OpportunityLineItem();
                objLineItem.OpportunityId = strOpportunityID;
                objlineitem.Quantity = Decimal.valueOf(objProd2.strQuantity);
                objLineItem.TotalPrice = Decimal.valueOf(objProd2.strQuantity)*Decimal.valueOf(objProd2.strMRC);
                PriceBookEntry pbe = [select Id from PriceBookEntry where name =: objProd2.strProductName limit 1];
                objLineItem.PricebookEntryId = pbe.Id;
            
                lstOpportunityLineItem.add(objLineItem);
            }
            insert lstOpportunityLineItem;
        }
        
        PageReference objPG=new PageReference('/' + strOpportunityID);//redirect to opportunity
        return objPG;
        return null;
    }
    public PageReference saveQuoteAndItem(){
        
        
        if(lstClsSelectedProductsToDB.size()>0){
            strOpportunityID = ApexPages.currentPage().getParameters().get('oppId');
            
            //Create Quote
            objSteQuote.OpportunityId__c = strOpportunityID;
            //System.debug('**** strQuote ' + objSteQuote);
            insert objSteQuote;

            List<SterlingQuoteItem__c> lstSteQuoteLineItem = new List<SterlingQuoteItem__c>();
            
            for(clsSelectedProducts objProd2: lstClsSelectedProductsToDB){
                SterlingQuoteItem__c objLineItem = new SterlingQuoteItem__c();
                objLineItem.Product2__c = objProd2.ProductID;
                objLineItem.name=objProd2.strProductName;
                objLineItem.SterlingQuote__c=objSteQuote.id;
                system.debug('**** objProd2.objSQI.DiscountType__c ' + objProd2.objSQI.DiscountType__c);
                objLineItem.DiscountType__c = objProd2.objSQI.DiscountType__c;
                //objLineItem.LineNumber__c = objProd2.objSQI.LineNumber__c;
                //System.debug('**** objLineItem ' + objLineItem + '     ' + objProd2.ProductID);
                lstSteQuoteLineItem.add(objLineItem);
            }
            insert lstSteQuoteLineItem;
        }
        
        PageReference objPG=new PageReference('/' + strOpportunityID);//redirect to opportunity
        return objPG;
    }
    //This metho will get the Result
    public List<clsSelectedProducts> getAllOrSelectedProducts(){
        
        List<Product2> lstObjProduct2 = new List<Product2>();
        List<clsSelectedProducts> lstObjClsSelectedProducts = new List<clsSelectedProducts>(); //Create the List
        
        /*if(strSearchProduct!=null && strSearchProduct!=''){
            List<Npa_Nxx_Tariff__c> lstObjNPANXXTraff = [Select Tariff_code__c, Name, Id, Environment__c From Npa_Nxx_Tariff__c where Name=: strSearchProduct];
            List<String> strTrafficeCode = new List<String>();
            for(Npa_Nxx_Tariff__c objValTemp:lstObjNPANXXTraff ){   //Take all the Traffice node into List<string>
                strTrafficeCode.add(objValTemp.Tariff_code__c);
            }
            lstObjProduct2 = [Select id, Tariff_Code__c, SnEcode__c, Name, Description From Product2 where Tariff_Code__c IN:strTrafficeCode];
        }else{
            lstObjProduct2 = [Select id, Tariff_Code__c, SnEcode__c, Name, Description From Product2];
        }*/
        String s = '%' + strSearchProduct + '%'; 
        if(strSearchProduct!=null && strSearchProduct!=''){
            lstObjProduct2 = [Select id, Tariff_Code__c, SnEcode__c, Name, Description From Product2  WHERE Name LIKE :s];
        }else{
            lstObjProduct2 = [Select id, Tariff_Code__c, SnEcode__c, Name, Description From Product2];
        }
        
        //Add the values to Wrapper class
        if(lstObjProduct2.size()>0){
            
            //Get all the Product IDs'
            List<ID> lstProdID = new List<ID>();
            for(Product2 objP:lstObjProduct2){
                lstProdID.add(objp.id);
            }
            
            //Get the Price for PRoducts
            Map<String,PricebookEntry> mapProPRice = new Map<String, PricebookEntry>();
            List<PricebookEntry> lstPB = [SELECT Name,Pricebook2Id,Product2Id,ProductCode,UnitPrice,UseStandardPrice FROM PricebookEntry where Product2Id IN:lstProdID];
            if(lstPB.isEmpty()) return null;
            for(PricebookEntry objPB:lstPB){
                mapProPRice.put(objPB.Name,objPB);
            }
            
            for(Product2 objProduct2Temp: lstObjProduct2){
                clsSelectedProducts objSelProd = new clsSelectedProducts(); //Create the Object Values
                System.debug('***** objProduct2Temp ' + objProduct2Temp.Name);
                objSelProd.ProductID = objProduct2Temp.id;
                objSelProd.strProductName = objProduct2Temp.Name;
                objSelProd.strTrafficCode = objProduct2Temp.Tariff_code__c;
                objSelProd.strSECode = objProduct2Temp.SnEcode__c;
                objSelProd.strProductDesc = objProduct2Temp.Description;
                
                if(objProduct2Temp.Name=='GenWatt Diesel 200kW' ||objProduct2Temp.Name=='GenWatt Diesel 10kW'){
                    //objSelPRod.strRenewalMRC='0.00';
                    objSelPRod.strMRC = String.valueof(mapProPRice.get(objProduct2Temp.Name).UnitPrice);
                }else{
                    objSelPRod.strRenewalMRC  = String.valueof(mapProPRice.get(objProduct2Temp.Name).UnitPrice);
                }
                
               // objSelProd.strMRC1 = objProduct2Temp.Item_Rate__c;
                objSelProd.bolIsSelected=false;
                
                lstObjClsSelectedProducts.add(objSelProd);  //Add to List
            }
        }
        return lstObjClsSelectedProducts;
    }
    
    //this is used to display information
    public class clsSelectedProducts{
        public String strProductName        {get;set;}
        public id ProductID                 {get;set;}
        public String strSECode             {get;set;}
        public String strProductDesc        {get;set;}
        public String strProductCategory    {get;set;}
        public String strTrafficName        {get;set;}
        public String strTrafficCode        {get;set;}
        public String strQuantity           {get;set;}
        public String strTerm               {get;set;}
        public String strRenewalMRC         {get;set;}
        public String strMRC                {get;set;}
        public String strCPENRC             {get;set;}
        public String strNRC                {get;set;}
        public SterlingQuoteItem__c objSQI        {get;set;}
        public boolean bolIsSelected        {get;set;}
        
        public clsSelectedProducts(){
            objSQI = new SterlingQuoteItem__c();
        }
    }
    
    public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    /*public void showPopup() {        
        displayPopup = true;    
    }*/
    
}