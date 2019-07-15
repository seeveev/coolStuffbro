global class ProductCatlog{
    
    //webService static ProductcreateClass Productcreate(ProductcreateClass IC){
    webService static ResponseClass Productcreate(ProductcreateClass IC){
   		
   		//Find the Duplicate values
   		map<String, String> mapDupItem = new map<String,String>();
   		List<String> lstDupItem = new List<String>();
   		 ProductcreateClass objRC = IC;
    	for(ItemsListclass objLI:objRC.ItemList){
    		if(mapDupItem.get(objLi.ItemId)==null)
    			mapDupItem.put(objLi.ItemId,objLi.ItemId);
    		else
    			lstDupItem.add(objLi.ItemId);
    		
    		
    		System.debug('*** ietam ' + objLI.Item);
  		}
   		
   		System.debug('*** dp list ' + lstDupItem.size() + '   ' + lstDupItem);
   		ResponseClass objRes = new ResponseClass();
   		if(lstDupItem.size()>0){
   			objRes.isSuccessFailure='Failure';
   			objRes.Message = lstDupItem;
   		}else{
   			objRes.isSuccessFailure='Success';
   		}
   		
   		List<ProductcreateClass> lstP = new List<ProductcreateClass>();
   		lstP.add(IC);
   		
   		//ProductCatlogBatch b = new ProductCatlogBatch(lstP); 
		//database.executebatch(b,10);
   		
   		
   		
   		/*Database.executeBatch(new ProductCatlogBatch(lstP), 10);*/
   
    /*ProductcreateClass objRC = IC;
    List<Product2> lstProduct2 = new List<Product2>();
    List<PricebookEntry> lstPriceBook = new List<PricebookEntry>();
    List<Pricebook2> lstPB = [SELECT Id,Name FROM Pricebook2 WHERE Name = 'Standard'];

    for(ItemsListclass objLI:objRC.ItemList){
      Product2 objProduct2 = new Product2(); 
      objProduct2.SKU__c= objLi.ItemId;
         
          PrimaryInfoclass objPInfo = objLI.PrimaryInformation;
          objProduct2.Name=objPInfo.ShortDescription;
          objProduct2.UnitPrice__c=objPInfo.UnitCost;
          
          lstProduct2.add(objProduct2);
          
          if(lstProduct2.size()==999){
                insert lstProduct2;
            //Insert Price Book
             for(Product2 objp:lstProduct2){
              PricebookEntry objpb = new PricebookEntry();
              //objpb.Name = objp.name;
              objpb.UnitPrice = Decimal.valueof(objp.UnitPrice__c);
              objpb.Product2Id = objp.id;
              objpb.Pricebook2Id = lstPB[0].id;
              lstPriceBook.add(objpb);
          }
          }
    if(lstProduct2.size()>0){
        insert lstProduct2;  
       
    }
    
            lstProduct2.clear();
            lstPriceBook.clear();
          }
        return objRC;*/
        return objRes;
    }
     
     
     
    webService static ProductcreateClass ProductUpdate(ProductcreateClass IC){ 
    	ProductcreateClass objRC = IC;
    	List<String> lstItemID = new List<String>();
    	map<String,Product2> mapProduct = new map<String,Product2>();
    	
    	//Get the Unique Item IDs
    	for(ItemsListclass objLI:objRC.ItemList){
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
    	
	    for(ItemsListclass objLI:objRC.ItemList){
	    	if(mapProduct.get(objLi.ItemId)!=null){
			      Product2 objProduct2 = mapProduct.get(objLi.ItemId);
			      objProduct2.SKU__c= objLi.ItemId;
			         
		          PrimaryInfoclass objPInfo = objLI.PrimaryInformation;
		          objProduct2.Name=objPInfo.ShortDescription;
			          
		          lstProduct2.add(objProduct2);
			          
		          if(lstProduct2.size()==999){
		            update lstProduct2;
		            lstProduct2.clear();
		          }
	    	}
	    }
	    
	    if(lstProduct2.size()>0){
	        update lstProduct2;  
	    }
    	
    /*List<Product2> lstProduct2 = new List<Product2>();
    for(ItemsListclass objLI:objRC.ItemList){
      Product2 objProduct2 = new Product2(); 
      objProduct2.SKU__c= objLi.ItemId;
         
          PrimaryInfoclass objPInfo = objLI.PrimaryInformation;
          objProduct2.Name=objPInfo.ShortDescription;
          
          lstProduct2.add(objProduct2);
          
          if(lstProduct2.size()==999){
            Update lstProduct2;
            lstProduct2.clear();
          }
    }
    
    if(lstProduct2.size()>0){
        Update lstProduct2;  
    }*/
            return objRC;
      }  
     
     
     
     
       global class ResponseClass {
           webservice String isSuccessFailure;
           //webservice String Message;
           webservice List<String> Message;
           
               
    }
    
     
      global class ProductcreateClass{
         webservice List<ItemsListclass> ItemList{get;set;}
      }
      global class  ItemsListclass{
         webservice String ItemId{get;set;}
         webservice String Item{get;set;}
         webservice PrimaryInfoclass PrimaryInformation{get;set;}
      }
      global class  PrimaryInfoclass{
         webservice String ShortDescription{get;set;}
         webservice String UnitCost{get;set;}
      }    
          
          
}