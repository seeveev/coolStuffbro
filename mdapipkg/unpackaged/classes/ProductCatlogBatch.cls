global class ProductCatlogBatch implements Database.batchable<WS_SFA_ManageProductCatalog.ProductcreateClass>{ 
    global final List<WS_SFA_ManageProductCatalog.ProductcreateClass> lstProdCl;
    
    global ProductCatlogBatch(List<WS_SFA_ManageProductCatalog.ProductcreateClass> IC){
        lstProdCl = IC;
    }
    
   global Iterable<WS_SFA_ManageProductCatalog.ProductcreateClass> start(Database.BatchableContext info){ 
       return lstProdCl; 
   }     
   
   global void execute(Database.BatchableContext info, List<WS_SFA_ManageProductCatalog.ProductcreateClass> scope){

       for(WS_SFA_ManageProductCatalog.ProductcreateClass objProd : scope){ 
        
            WS_SFA_ManageProductCatalog.ProductcreateClass objRC = objProd;
            List<String> lstItemID = new List<String>();
            map<String,Product2> mapProduct = new map<String,Product2>();
            
            //Get the Unique Item IDs
            for(WS_SFA_ManageProductCatalog.ItemsListclass objLI:objRC.ItemList){
                lstItemID.add(objLI.ItemId);
            }
            
            //Get allthe records
            List<Product2> lstupdateProduct = [select id, name, SKU__c from Product2 where SKU__c in:lstItemID];
            //Move to Map
            for(Product2 objP:lstupdateProduct){
                mapProduct.put(objP.SKU__c,objP);
            }
            
            //Update the values now
            List<Product2> lstProduct2 = new List<Product2>();
            List<PricebookEntry> lstPriceBook = new List<PricebookEntry>();
            List<Pricebook2> lstPB = [SELECT Id,Name FROM Pricebook2 WHERE Name = 'Standard'];
    
            for(WS_SFA_ManageProductCatalog.ItemsListclass objLI:objRC.ItemList){
                Product2 objProduct2;
                if(mapProduct.get(objLi.ItemId)!=null)
                      objProduct2 = mapProduct.get(objLi.ItemId);
                else
                     objProduct2 = new Product2();

                //Assign Values and add to list
                objProduct2.SKU__c= objLi.ItemId;
                WS_SFA_ManageProductCatalog.PrimaryInfoclass objPInfo = objLI.PrimaryInformation;
                objProduct2.Name=objPInfo.ShortDescription;
                lstProduct2.add(objProduct2);
                
                //Insert Price Book
                 for(Product2 objp:lstProduct2){
                        PricebookEntry objpb;
                      //PricebookEntry objpb = new PricebookEntry();
                      List<PricebookEntry> lstObjpd = [select id, name from PricebookEntry where Product2Id=:objp.id];
                      if(lstObjpd.isempty())
                        objpb = new PricebookEntry();
                      else
                        objpb = lstObjpd[0];
                        
                      //objpb.Name = objp.name;
                      System.debug('***** objp.UnitPrice__c ' + objp.UnitPrice__c);
                      if(objp.UnitPrice__c!=null) 
                        objpb.UnitPrice = Decimal.valueof(objp.UnitPrice__c);
                      else
                        objpb.UnitPrice=0;
                      objpb.Product2Id = objp.id;
                      objpb.Pricebook2Id = lstPB[0].id;
                      lstPriceBook.add(objpb);
                 }
                
            }
            
            if(lstPriceBook.size()>0) upsert lstPriceBook;  
            if(lstProduct2.size()>0) upsert lstProduct2;  
       }
   }    
    
   global void finish(Database.BatchableContext info){
   } 
}