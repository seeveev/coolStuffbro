global with sharing class MyWSDLResource {
 
    //global static MyUserDefinedClass echoMyType(MyUserDefinedClass ic) {
    webService static MyWSDLResource.ResponseClass oppDetailsUpdate(MyUserDefinedClass ic){
    	
    	SterlingQuote__c objxml;
    	
    	//For Response
     	ResponseClass objRC = new ResponseClass();
        objRC.OpportunityId = ic.OpportunityId;
        objRC.CPQQuoteId = ic.CPQQuoteId;
        //objRC.SFAQuoteId = ic.SFAQuoteId;
        
		try{
	        System.debug('*** in method ' + ic);
	        //Check Wether Opporutnity is available or not
	        List<Opportunity> lstOpp = [select id, name from Opportunity where id=:ic.OpportunityId];
	        if(lstOpp.size()==0){
	        	objRC.isSuccessFailure = 'Failure';
	        	return objRC;
	        }
  
	        //if(ic.DMLOperation=='Insert'){
	        //SterlingQuote__c objxml = new SterlingQuote__c();    //Create a dummy Quote
	        objxml = new SterlingQuote__c();    //Create a dummy Quote
			List<SterlingQuote__c> lstSQ = [SELECT Account__c,AdditionalAddress__c,AdditionalName__c,ApprovalType__c,BillingAddress__c,BillingName__c,Contact__c,CPQQuoteId__c,CreatedById,CreatedBy__c,CreatedDate,Description__c,Discount__c,Email__c,ExpediteIncluded__c,ExpirationDate__c,Fax__c,GrandTotal__c,Id,IsDeleted,IsSyncing__c,LastModifiedById,LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineItemCount__c,Name,Name__c,Note__c,OpportunityId__c,OwnerId,Phone__c,QuoteToAddress__c,QuoteToName__c,QuoteType__c,Quote_Number__c,SFAQuoteId__c,ShippingAddress__c,ShippingHandling__c,ShippingName__c,Status_Date__c,SubmittedBy__c,Subtotal__c,SystemModstamp,Tax__c FROM SterlingQuote__c WHERE CPQQuoteId__c =:ic.CPQQuoteId AND OpportunityId__c =:lstOpp[0].id];
	        if(lstSQ.size()>0) objxml = lstSQ[0];    //If the record is already available then use the existing one
	
	       //Assign all XML values
	        objxml.OpportunityId__c = ic.OpportunityId;
	        objxml.SFAQuoteId__c = ic.SFAQuoteId;
	        objxml.CPQQuoteId__c = ic.CPQQuoteId;
	        objxml.ApprovalType__c= ic.ApprovalType;
	        objxml.ExpediteIncluded__c = ic.ExpediteIncluded;
	        objxml.SubmittedBy__c = ic.SubmittedBy;
	        update objxml;    //it will act as insert and upate
	        
	        List<SterlingQuoteItem__c> lstSQI = new List<SterlingQuoteItem__c>();
	        //Insert SerlingQuoteLneItem value
	        System.debug('*** in ic.products ' + ic.products);
	        ProductsClass objProc = ic.products;
	        List<ProductClass> lstProducts = objProc.product;
	            //if(lstProducts.size()>0)
	            //Delete the existing  
                List<SterlingQuoteItem__c> lstDelQI = [select id from SterlingQuoteItem__c where SterlingQuote__c =:objxml.id];
                if(!lstDelQI.isEmpty()) delete lstDelQI;
	                
	            for(ProductClass objPC:lstProducts){

	                System.debug('*** Products ' + objPC);
	                SterlingQuoteItem__c objSQ = new SterlingQuoteItem__c();
	                
	               // List<SterlingQuoteItem__c> lstSqiv = [SELECT AddressDescription__c,AddressText__c,AddressType__c,AdjustedMRC__c,AdjustedNRC__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,CPQLineNumber__c,CreatedById,CreatedBy__c,CreatedDate,DataRegion__c,Description__c,DiscountType__c,GFItem__c,Id,IsAddressQualified__c,IsContracted__c,IsDeleted,IsNewConstruction__c,IsPromoProduct__c,IsTerm__c,IsZAddressRequired__c,ItemCode__c,LastActivityDate,LastModifiedById,LastModifiedBy__c,LastModifiedDate,LastReferencedDate,LastViewedDate,LineNumber__c,ListPrice__c,Locality__c,MetroEQualificationType__c,Name,NetworkDistance__c,NPA__c,NumInstallments__c,NXX__c,PercentageDiscountAmount__c,Postcode__c,Product2__c,ProductCode__c,ProductInterval__c,PromoDiscountAmount__c,PromoExpirationDate__c,PromoName__c,PromotionId__c,PSKU__c,Quantity__c,RequestedDueDate__c,ScheduleId__c,ServiceControlNumber__c,ServiceDate__c,ServiceSequenceNumber__c,SKU__c,StandardMRC__c,StandardNRC__c,StateOrProvince__c,Status_Date__c,Status__c,SterlingQuote__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,Subtotal__c,SystemModstamp,TermEndDateMismatch__c,TermEndDate__c,TermLength__c,TotalPrice__c,UnitPrice__c,unit_Designator__c,unit_number__c,WireCenter__c FROM SterlingQuoteItem__c where CPQLineNumber__c=:objPC.CPQLineNumber];
	                //if(lstSqiv.size()>0) objSQ = lstSqiv[0];
	                
	                //objSQ.SterlingQuote__c = objxml.id;
	                objSQ.AddressDescription__c = objPC.AddressDescription;
	                objSQ.NetworkDistance__c = objPC.NetworkDistance;
	                objSQ.DataRegion__c = objPC.DataRegion;
	                objSQ.ScheduleId__c= objPC.ScheduleId;
	                objSQ.IsNewConstruction__c= objPC.IsNewConstruction;
	                objSQ.ItemCode__c= objPC.ItemCode;
	                objSQ.SKU__c= objPC.SKU;
	                objSQ.Quantity__c= objPC.Quantity;
	                objSQ.GFItem__c= objPC.GFItem;
	                objSQ.StandardMRC__c= objPC.StandardMRC;
	                objSQ.StandardNRC__c= objPC.StandardNRC;
	                objSQ.AdjustedMRC__c= objPC.AdjustedMRC;
	                objSQ.AdjustedNRC__c= objPC.AdjustedNRC;
	                objSQ.NumInstallments__c= objPC.NumInstallments;
	                objSQ.Description__c= objPC.Description;
	                objSQ.IsContracted__c= objPC.IsContracted;
	                objSQ.RequestedDueDate__c= objPC.RequestedDueDate;
	                objSQ.ProductInterval__c= objPC.ProductInterval;
	                objSQ.IsAddressQualified__c= objPC.IsAddressQualified;
	                objSQ.MetroEQualificationType__c= objPC.MetroEQualificationType;
	                objSQ.IsPromoProduct__c= objPC.IsPromoProduct;
	                objSQ.IsZAddressRequired__c= objPC.IsZAddressRequired;      
	                
	                //-------------- Address Type
	                /*AddressTypeClass objAddressType = objPC.AddressType;
	          		ServiceAddressClass objADServiceAdd = objAddressType.ServiceAddress;	//service address
	    			UnitClass objADUnitClass = objADServiceAdd.Unit;	//Unit tag
	          		ExchangeClass objADExchangeClass = objADServiceAdd.Exchange;	//Exhagne tab
					objSQ.StreetName__c = objADServiceAdd.StreetName;	//Plz add Additinal
					
	          		PostalAddressClass objADPostalAdd = objAddressType.PostalAddress;	//postal address
	          		AddressTextClass objADPostalAddText = objADPostalAdd.AddressText;	//addrestext tab*/
	          		
	          		AddressTypeClass objAddressType = objPC.AddressType;
	          		ServiceAddressClass objADServiceAdd = objAddressType.ServiceAddress;	//service address
	    			List<UnitClass> objADUnitClass = objADServiceAdd.Unit;	//Unit tag
	          		List<ExchangeClass> objADExchangeClass = objADServiceAdd.Exchange;	//Exhagne tab
					
					for(Integer i=0;i<objADUnitClass.size();i++){
						UnitClass objUC = objADUnitClass[i];
						if(i==0){
							//Map fields
							//objSQ.Number1__c = objUC.Number;
							//objSQ.Designator1__c = objUC.Designator;
						}
						if(i==2){
							//Map fields
							//objSQ.Number2__c = objUC.Number;
							//objSQ.Designator2__c = objUC.Designator;
						}
					}
					
					
					objSQ.StreetName__c = objADServiceAdd.StreetName;	//Plz add Additinal
					
					
					
					
	          		PostalAddressClass objADPostalAdd = objAddressType.PostalAddress;	//postal address
	          		AddressTextClass objADPostalAddText = objADPostalAdd.AddressText;	//addrestext tab
					
	          		
	                //---------------------------             
	                //update objSQ;
	                upsert objSQ;
	               
	               ZaddressesClass objZaddMain = objPC.Zaddresses;
	               System.debug('*** objZaddMain ' + objZaddMain );
	               List<ZaddressClass> objZadSub = objZaddMain.Zaddress;
	               System.debug('*** objZadSub ' + objZadSub );
	               
	               List<ZAddress__c> lstZ = new List<ZAddress__c>();
	               for(ZaddressClass objZC:objZadSub){
		               
		               AddressTypeClass objAddType = objZC.AddressType;
		               System.debug('*** objAddType ' + objAddType );
		               ServiceAddressClass objSerAdd = objAddType.ServiceAddress;
		               System.debug('*** objSerAdd ' + objSerAdd );
		               PostalAddressClass objPostalAdd = objAddType.PostalAddress;
		               System.debug('*** objPostalAdd ' + objPostalAdd );
		               
		               ZAddress__c objZ = new ZAddress__c();
		               objZ.StreetNrFirst__c = objSerAdd.StreetNrFirst;
		               objZ.StreetName__c = objSerAdd.StreetName;
		               objZ.StreetSubDescription__C = objSerAdd.StreetSubDescription;
		               objZ.StreetSuffix__c = objSerAdd.StreetSuffix;
		               objZ.StreetDirection__c = objSerAdd.StreetDirection;
		               objZ.Subdivision__c = objSerAdd.Subdivision;
		               objZ.Locality__c= objSerAdd.Locality;
		               objZ.StateOrProvince__c = objSerAdd.StateOrProvince;
		               objZ.Postcode__c = objSerAdd.Postcode;
		               objZ.BuildingName__c = objSerAdd.BuildingName;
		               objZ.BuildingNumber__c= objSerAdd.BuildingNumber;
		               objZ.BuildingSubNumber__c= objSerAdd.BuildingSubNumber;
		               objZ.SterlingQuoteItem__c = objSQ.id;
		               
		               lstZ.add(objZ);
		               
		               //insert objZ;
	               }
	               if(!lstZ.isempty()){
	               		//Delete the Exising REcords
	               		List<ZAddress__c> lstZAdd = [select id, name from ZAddress__c where SterlingQuoteItem__c =:objSQ.id];
	               		if(!lstZAdd.isEmpty()) delete lstZAdd;
	               		
	               		insert lstZ;
	               }
	               
	               //Insert ZAddresses
	               NotesClass objNotes = ic.Notes;
	               List<NoteClass> objNote = objNotes.Note;
					
					List<Note> lstNoteT = new List<Note>();
					for(NoteClass objNC:objNote){
					   List<Note> lstN = [select id, Body, Title, ParentID from Note where Title=:objNC.NoteId];
					   if(!lstN.isEmpty()){
					   	   Note objNoteT = new Note();
			               objNoteT = lstN[0];
			               objNoteT.Body = objNC.TextBody;//Blob.valueOf(objNote.TextBody);
			               objNoteT.Title = objNC.NoteId;
			               objNoteT.ParentId = objSQ.id;
			               lstNoteT.add(objNoteT);
					   }
					}	
					if(!lstNoteT.isEmpty()) update lstNoteT;
					
	          		//webservice PromotionsClass Promotions;
	          		PromotionsClass objPromotions = objPC.Promotions;
	          		List<PromotionClass> objPromotion = objPromotions.Promotion;
	          		
	          		List<promotionss__c> lstPro = new List<promotionss__c>();
					for(PromotionClass objProT:objPromotion){
					   //List<promotionss__c> lstPRoT = [select id, IsTerm__c, promo_id__c from promotionss__c where promo_id__c=:objProT.PromotionId];
					   //if(!lstPRoT.isEmpty()){
					   		promotionss__c objPro = new promotionss__c();
					   //	   objPro = lstPRoT[0];
			               if(objProT.IsTerm=='true')
			          			objPro.Isterm__c=true;
			          		else
			          			objPro.Isterm__c=false;
			          		objPro.promo_id__c = objProT.PromotionId;
			          		objPro.SterlingQuoteItem__c = objSQ.id;
			               lstPro.add(objPro);
					   //}
					}	
					if(!lstPro.isEmpty()){
						List<promotionss__c> lstPRoTDel = [select id, IsTerm__c, promo_id__c from promotionss__c where SterlingQuoteItem__c=:objSQ.id];
						if(!lstPRoTDel.isEmpty()) delete lstPRoTDel;
						
						insert lstPro;
					}
	        	}
	        	
	        	if(ic.isCPQDelete==true){
	        		List<SterlingQuoteItem__c> lstSqivDel = [SELECT id FROM SterlingQuoteItem__c where CPQLineNumber__c=:ic.CPQQuoteIDDelete];
		        	if(!lstSqivDel.isEmpty()) delete lstSqivDel;
	        	}
	        	
	        	System.debug('*** lstSQI ' + lstSQI);
	        objRC.SFAQuoteId = objxml.id;
	        objRC.isSuccessFailure = 'Success';
		}catch(Exception ae){
			objRC.SFAQuoteId = objxml.id;
			objRC.isSuccessFailure = 'Failure';
		}
        return objRC;
    }
    
     webService static MyWSDLResource.ResponseClass oppDetailsInsert(MyUserDefinedClass ic){
     	
     	//For Response
     	SterlingQuote__c objxml;
     	ResponseClass objRC = new ResponseClass();
        objRC.OpportunityId = ic.OpportunityId;
        objRC.CPQQuoteId = ic.CPQQuoteId;
        //objRC.SFAQuoteId = ic.SFAQuoteId;
	        
		try{
	        System.debug('*** in method ' + ic);
	        //Check Wether Opporutnity is available or not
	        List<Opportunity> lstOpp = [select id, name from Opportunity where id=:ic.OpportunityId];
	        if(lstOpp.size()==0){
	        	objRC.isSuccessFailure = 'Failure';
	        	return objRC;
	        }
	        
	        //Chedk if Quote availab ein product
        	 //set<String> lstSKU = new set<String>();
        	 ProductsClass objProcTemp = ic.products;
	        List<ProductClass> lstProductsTemp = objProcTemp.product;
	        for(ProductClass objPC:lstProductsTemp){
	        	//lstSKU.add(objPC.SKU);
	        	/*List<Product2> lstPro2 = [select id, name FROM Product2 where sku__c=:objPC.SKU];
		        if(lstPro2.isEmpty()){
		        	objRC.isSuccessFailure = 'Failure';
	        		return objRC;
		        }*/
	        }
	        
	        //if(ic.DMLOperation=='Insert'){
	        //SterlingQuote__c objxml = new SterlingQuote__c();    //Create a dummy Quote
	        objxml = new SterlingQuote__c();    //Create a dummy Quote
			List<SterlingQuote__c> lstSQ = [SELECT Account__c,AdditionalAddress__c FROM SterlingQuote__c WHERE SFAQuoteId__c =:ic.SFAQuoteId AND CPQQuoteId__c =:ic.CPQQuoteId AND OpportunityId__c =:lstOpp[0].id];
	        if(lstSQ.size()>0){
	        	objRC.isSuccessFailure = 'Failure';
	        	return objRC;
	        }
	        
	       //Assign all XML values
	        objxml.OpportunityId__c = ic.OpportunityId;
	        objxml.SFAQuoteId__c = ic.SFAQuoteId;
	        objxml.CPQQuoteId__c = ic.CPQQuoteId;
	        objxml.ApprovalType__c= ic.ApprovalType;
	        objxml.ExpediteIncluded__c = ic.ExpediteIncluded;
	        objxml.SubmittedBy__c = ic.SubmittedBy;
	        insert objxml;    //it will act as insert and upate
	        
	        List<SterlingQuoteItem__c> lstSQI = new List<SterlingQuoteItem__c>();
	        //Insert SerlingQuoteLneItem value
	        System.debug('*** in ic.products ' + ic.products);
	        ProductsClass objProc = ic.products;
	        List<ProductClass> lstProducts = objProc.product;
	            //if(lstProducts.size()>0)
	            
	            for(ProductClass objPC:lstProducts){
	            	
	                System.debug('*** Products ' + objPC);
	                SterlingQuoteItem__c objSQ = new SterlingQuoteItem__c();
	                objSQ.SterlingQuote__c = objxml.id;
	                objSQ.AddressDescription__c = objPC.AddressDescription;
	                objSQ.NetworkDistance__c = objPC.NetworkDistance;
	                objSQ.DataRegion__c = objPC.DataRegion;
	                objSQ.ScheduleId__c= objPC.ScheduleId;
	                objSQ.IsNewConstruction__c= objPC.IsNewConstruction;
	                objSQ.ItemCode__c= objPC.ItemCode;
	                objSQ.SKU__c= objPC.SKU;
	                objSQ.Quantity__c= objPC.Quantity;
	                objSQ.GFItem__c= objPC.GFItem;
	                objSQ.StandardMRC__c= objPC.StandardMRC;
	                objSQ.StandardNRC__c= objPC.StandardNRC;
	                objSQ.AdjustedMRC__c= objPC.AdjustedMRC;
	                objSQ.AdjustedNRC__c= objPC.AdjustedNRC;
	                objSQ.NumInstallments__c= objPC.NumInstallments;
	                objSQ.Description__c= objPC.Description;
	                objSQ.IsContracted__c= objPC.IsContracted;
	                objSQ.RequestedDueDate__c= objPC.RequestedDueDate;
	                objSQ.ProductInterval__c= objPC.ProductInterval;
	                objSQ.IsAddressQualified__c= objPC.IsAddressQualified;
	                objSQ.MetroEQualificationType__c= objPC.MetroEQualificationType;
	                objSQ.IsPromoProduct__c= objPC.IsPromoProduct;
	                objSQ.IsZAddressRequired__c= objPC.IsZAddressRequired;  
	                
	                //-------------- Address Type
	                AddressTypeClass objAddressType = objPC.AddressType;
	          		ServiceAddressClass objADServiceAdd = objAddressType.ServiceAddress;	//service address
	    			List<UnitClass> objADUnitClass = objADServiceAdd.Unit;	//Unit tag
	          		List<ExchangeClass> objADExchangeClass = objADServiceAdd.Exchange;	//Exhagne tab
					objSQ.StreetName__c = objADServiceAdd.StreetName;	//Plz add Additinal
					
	          		PostalAddressClass objADPostalAdd = objAddressType.PostalAddress;	//postal address
	          		AddressTextClass objADPostalAddText = objADPostalAdd.AddressText;	//addrestext tab
					
	          		
	                //---------------------------      
	                insert objSQ;
	               
	               ZaddressesClass objZaddMain = objPC.Zaddresses;
	               System.debug('*** objZaddMain ' + objZaddMain );
	               List<ZaddressClass> objZadSub = objZaddMain.Zaddress;
	               System.debug('*** objZadSub ' + objZadSub );
	               
	               List<ZAddress__c> lstZ = new List<ZAddress__c>();
	               for(ZaddressClass objZC:objZadSub){
		               
		               AddressTypeClass objAddType = objZC.AddressType;
		               System.debug('*** objAddType ' + objAddType );
		               ServiceAddressClass objSerAdd = objAddType.ServiceAddress;
		               System.debug('*** objSerAdd ' + objSerAdd );
		               PostalAddressClass objPostalAdd = objAddType.PostalAddress;
		               System.debug('*** objPostalAdd ' + objPostalAdd );
		               
		               ZAddress__c objZ = new ZAddress__c();
		               objZ.StreetNrFirst__c = objSerAdd.StreetNrFirst;
		               objZ.StreetName__c = objSerAdd.StreetName;
		               objZ.StreetSubDescription__C = objSerAdd.StreetSubDescription;
		               objZ.StreetSuffix__c = objSerAdd.StreetSuffix;
		               objZ.StreetDirection__c = objSerAdd.StreetDirection;
		               objZ.Subdivision__c = objSerAdd.Subdivision;
		               objZ.Locality__c= objSerAdd.Locality;
		               objZ.StateOrProvince__c = objSerAdd.StateOrProvince;
		               objZ.Postcode__c = objSerAdd.Postcode;
		               objZ.BuildingName__c = objSerAdd.BuildingName;
		               objZ.BuildingNumber__c= objSerAdd.BuildingNumber;
		               objZ.BuildingSubNumber__c= objSerAdd.BuildingSubNumber;
		               objZ.SterlingQuoteItem__c = objSQ.id;
		               
		               lstZ.add(objZ);
	               }
	               if(!lstZ.isempty()){
	               		//Delete the Exising REcords
	               		List<ZAddress__c> lstZAdd = [select id, name from ZAddress__c where SterlingQuoteItem__c =:objSQ.id];
	               		if(!lstZAdd.isEmpty()) delete lstZAdd;
	               		
	               		insert lstZ;
	               }
	               
	               
	               //Insert ZAddresse
	               
	               NotesClass objNotes = ic.Notes;
	               List<NoteClass> objNote = objNotes.Note;
					
					List<Note> lstNoteT = new List<Note>();
					for(NoteClass objNC:objNote){
					   	   Note objNoteT = new Note();
			               objNoteT.Body = objNC.TextBody;//Blob.valueOf(objNote.TextBody);
			               objNoteT.Title = objNC.NoteId;
			               objNoteT.ParentId = objSQ.id;
			               lstNoteT.add(objNoteT);
					}	
					if(lstNoteT.size()>0) insert lstNoteT;
	               
	               PromotionsClass objPromotions = objPC.Promotions;
	          		List<PromotionClass> objPromotion = objPromotions.Promotion;
	          		
	          		List<promotionss__c> lstPro = new List<promotionss__c>();
					for(PromotionClass objProT:objPromotion){
					   		promotionss__c objPro = new promotionss__c();
			               if(objProT.IsTerm=='true')
			          			objPro.Isterm__c=true;
			          		else
			          			objPro.Isterm__c=false;
			          		objPro.promo_id__c = objProT.PromotionId;
			          		objPro.SterlingQuoteItem__c = objSQ.id;
			               lstPro.add(objPro);
					}	
					if(!lstPro.isEmpty()){
						List<promotionss__c> lstPRoTDel = [select id, IsTerm__c, promo_id__c from promotionss__c where SterlingQuoteItem__c=:objSQ.id];
						if(!lstPRoTDel.isEmpty()) delete lstPRoTDel;
						
						insert lstPro;
					}
	        	}
	        	System.debug('*** lstSQI ' + lstSQI);
	        
	        
	        objRC.SFAQuoteId = objxml.id;
	        objRC.isSuccessFailure = 'Success';
		}catch(Exception ae){
			objRC.SFAQuoteId = objxml.id;
			objRC.isSuccessFailure = 'Failure';
		}
        return objRC;
    }
    
    global class ResponseClass {
           webservice String OpportunityId {get; set;} 
           webservice String SFAQuoteId;
           webservice String CPQQuoteId;
           webservice String isSuccessFailure;     
    }
    
    global class MyUserDefinedClass {

           webservice  String OpportunityId {get; set;} 
           webservice String SFAQuoteId;
           webservice String CPQQuoteId;
           webservice boolean ExpediteIncluded{get; set;}
           webservice String ApprovalType{get;set;}
           webservice String SubmittedBy{get;set;}
           webservice ProductsClass products;
           webservice NotesClass Notes;
           webservice String isSuccessFailure;
           webservice Decimal CPQQuoteIDDelete;
           webservice boolean isCPQDelete;
          // webservice String DMLOperation;
           
    }
    
    global class ProductClass{
        webservice String AddressDescription;
        webservice String NetworkDistance;
        webservice String DataRegion;
        webservice Decimal CPQLineNumber;
        webservice String ScheduleId;
        webservice Boolean IsNewConstruction;
        webservice String ItemCode;
        webservice String SKU;
        webservice Decimal Quantity;
        webservice Boolean GFItem;
        webservice Decimal StandardMRC;
        webservice Decimal StandardNRC;
        webservice Decimal AdjustedMRC;
        webservice Decimal AdjustedNRC;
        webservice Decimal NumInstallments;
        webservice String Description;
        webservice Boolean IsContracted;
        webservice Date RequestedDueDate;
        webservice Decimal ProductInterval;
        webservice Boolean IsAddressQualified;
        webservice String MetroEQualificationType;
        webservice Boolean IsPromoProduct;
        webservice Boolean IsZAddressRequired;
        webservice ZaddressesClass Zaddresses;
        webservice PromotionsClass Promotions;
        webservice DiscountClass Discount;
        webservice AddressTypeClass AddressType;
        
    }
    
    global class ProductsClass{
        webservice List<ProductClass> product;
    }
    
    global class AddressTypeClass{
        webservice ServiceAddressClass ServiceAddress;
        webservice CitizensServiceAddress CitizensServiceAddress;
        webservice PostalAddressClass PostalAddress;
        
    }
    global class ServiceAddressClass{
        webservice String StreetNrFirst;
        webservice String StreetName;
        webservice String StreetSubDescription;
        webservice String StreetSuffix;
        webservice String StreetDirection;
        webservice String Subdivision;
        webservice String Locality;
        webservice String StateOrProvince;
        webservice String Postcode;
        webservice String BuildingName;
        webservice String BuildingNumber;
        webservice String BuildingSubNumber;
        webservice String WireCenter;
        webservice String ServiceSequenceNumber;
        webservice String ServiceControlNumber;
        webservice List<UnitClass> Unit;
        webservice List<ExchangeClass> Exchange;
    }
    global class PostalAddressClass{
        webservice String Locality;
        webservice String StateOrProvince;
        webservice String Country;
        webservice String Postcode;
        webservice AddressTextClass AddressText;
    }
     global class UnitClass{
       webservice String UnitNumber;
       webservice String Designator;
   }
    global class ExchangeClass{
        webservice String NPA;
        webservice String NXX;
    }
    global class AddressTextClass{
        webservice String AddressText;
        webservice String SequenceNumber;
    }
    
    global class CitizensServiceAddress {
    	webservice String StateOrProvince {get;set;}
		webservice String Country {get;set;}
		webservice String County {get;set;}
		webservice String StreetNrFirst {get;set;}
		webservice String StreetNrFirstSuffix {get;set;}
		webservice String StreetName {get;set;}
		webservice String StreetType {get;set;}
		webservice String StreetSuffix {get;set;}
		webservice String StreetNrLast {get;set;}
		webservice String StreetNrLastSuffix {get;set;}
		webservice String Locality {get;set;}
		webservice String Postcode {get;set;}
		webservice String StreetNrFirstPrefix {get;set;}
		webservice String StreetNrLastPrefix {get;set;}
		webservice String StreetNamePrefix {get;set;}
		webservice String StreetNameSuffix {get;set;}
		webservice String Subdivision {get;set;}
		webservice String StreetSubDescription {get;set;}
		webservice String StreetDirection {get;set;}
		webservice String StreetPostDirection {get;set;}
		webservice String BuildingName {get;set;}
		webservice String BuildingNumber {get;set;}
		webservice String BuildingSubNumber {get;set;}
		webservice AddressUnit[] Unit {get;set;}
		webservice String SubLocation {get;set;}
		webservice String Community {get;set;}
		webservice String AddressID {get;set;}
		webservice String LocalityID {get;set;}
		webservice String WireCenter {get;set;}
		webservice Exchange Exchange {get;set;}
		webservice CommonLanguageLocationId CommonLanguageLocationId {get;set;}
		webservice CodeDescriptionPair TaxingDistrict {get;set;}
		webservice String PhysicalMapPageNumber {get;set;}
		webservice String PhysicalMapSector {get;set;}
		webservice String MileageZone {get;set;}
		webservice Boolean ServiceOverrideFlag {get;set;}
		webservice GlobalPosition GlobalPosition {get;set;}
		webservice Boolean HSICapableFlag {get;set;}
		webservice String PricingSegmentIndicator {get;set;}
		webservice Boolean ReadyForServiceFlag {get;set;}
		webservice Integer ServiceSequenceNumber {get;set;}
		webservice Integer ServiceControlNumber {get;set;}
		webservice AdditionalAddressInfo[] AdditionalAddressInfo {get;set;}
		webservice LineCardHistory[] LineCardHistory {get;set;}
		webservice DataSourceEnvironment DataSourceEnvironment {get;set;}
		webservice Boolean HomeOwnerAssociationFlag {get;set;}
		webservice Boolean LocalFranchiseAgreementFlag {get;set;}
		webservice Boolean FiberProductCapableFlag {get;set;}
		webservice Line[] Line {get;set;}
		webservice CommonLanguageLocationId CentralOfficeCLLI {get;set;}
		webservice InternetInfoType InternetInfo {get;set;}
		webservice Boolean ConnectedLineCardsFoundFlag {get;set;}
		webservice LineCard LineCardInfo {get;set;}
		webservice Boolean FiberVideoAvailableFlag {get;set;}
		webservice String Ethernet {get;set;}
		webservice String IncorporatedIndicator {get;set;}
    }
    global class LineCard {
		webservice Boolean AdvisedCustomerOfChargesFlag {get;set;}
		webservice Cable[] Cable {get;set;}
		webservice String CardStationRemarks {get;set;}
		webservice String CarrierCableOfficeCode {get;set;}
		webservice String CarrierPair {get;set;}
		webservice String CentralOfficeCardOption {get;set;}
		webservice String CentralOfficeEquipmentType {get;set;}
		webservice String ClassOfService {get;set;}
		webservice Date ConnectDate {get;set;}
		webservice String CustomerName {get;set;}
		webservice Port DigitalSwitchPort {get;set;}
		webservice Date DisconnectDate {get;set;}
		webservice String DisconnectReason {get;set;}
		webservice String FacilityRemarks {get;set;}
		webservice String InstallationRemarks {get;set;}
		webservice String LineCardId {get;set;}
		webservice String LineEquipmentNumber {get;set;}
		webservice String OfficeId {get;set;}
		webservice String OtherCarrierNumber {get;set;}
		webservice Port Port {get;set;}
		webservice String PremiseRemarks {get;set;}
		webservice String RingCode {get;set;}
		webservice String SecondCircuit {get;set;}
		webservice String SheathPair {get;set;}
		webservice String SpecialCircuit {get;set;}
		webservice Port Splitter {get;set;}
		webservice TelephoneNumber TelephoneNumber {get;set;}
		webservice String TelephoneNumberPortingStatus {get;set;}
		webservice String FromTerminalCount {get;set;}
		webservice String ToTerminalCount {get;set;}
		webservice String ThirdCircuit {get;set;}
		webservice LineTreatment[] LineTreatment {get;set;}
		webservice DigitalSubscriberLineAccessMultiplexer[] DigitalSubscriberLineAccessMultiplexer {get;set;}
		webservice Port[] FiberPort {get;set;}
		webservice String PairCountFrom {get;set;}
		webservice String PairCountTo {get;set;}
    }
    global class DigitalSubscriberLineAccessMultiplexer {
		webservice String OfficeId;
		webservice CommonLanguageLocationId CommonLanguageLocationId;
		webservice String ManagementIp;
		webservice String CentralOfficeEquipmentLineEquipmentNumber;
		webservice String DataLinkConnectionID;
		webservice String EquipmentCardType;
		webservice String EquipmentDescription;
		webservice String NetworkVirtualCircuitIdentifier;
		webservice String NetworkVirtualPathIdentifier;
		webservice Port Port;
		webservice String ProvisioningSpeed;
		webservice String ServiceIndicator;
		webservice String SubscriberVirtualCircuitIdentifier;
		webservice String SubscriberVirtualPathIdentifier;
		webservice String NetworkToNetworkCircuit;
		webservice String InfoSpeedVirtualCircuitIdentifier;
		webservice String InfoSpeedVirtualPathIdentifier;
		webservice String Device;
		webservice String ManagementIpV6;
    }
	global class LineTreatment {
		webservice String LineTreatmentId;
		webservice String LocationNumber;
		webservice Integer SequenceNumber;
	}
    global class TelephoneNumber {
		webservice String Number_x {get;set;}
		webservice NorthAmericanTelephoneNumber NorthAmericanNumber;
		webservice String Extension;
    }
	global class NorthAmericanTelephoneNumber {
		webservice String NPA;
		webservice String NXX;
		webservice String Station;
	}
    global class Port {
		webservice String CustomersCarrierNameAbbreviation;
		webservice CommonLanguageLocationId CommonLanguageLocationId;
		webservice String Data;
		webservice Integer PortId;
		webservice Integer SequenceNumber;
		webservice String Type_x;
		webservice TerminalKey OpticalNetworkTerminalKey;
		webservice String VoiceSourceId;
		webservice String VoiceDestinationId;
		webservice String DataSourceId;
		webservice String DataDestinationId;
		webservice String DataVirtualPathVirtualCircuit;
		webservice String ProvisioningSpeed;
		webservice String PacketDestinationId;
    }
	global class TerminalKey {
		webservice String ModelNumber;
		webservice String SerialNumber;
		webservice String VendorId;
	}
    global class Cable {
		webservice String CableId;
		webservice String OfficeCode;
		webservice Frog[] Frog;
		webservice String FrogCountPerCablePair;
		webservice String FromBindingPost;
		webservice String Pair;
		webservice String RouteLeadForCableTerminal;
		webservice Integer SequenceNumber;
		webservice Terminal FromTerminal;
		webservice String ToBindingPost;
		webservice String Exchange;
    }
    global class Terminal {
		webservice String TerminalId;
		webservice TerminalKey Key;
		webservice String OfficeId;
		webservice String Location;
    }
    global class Frog {
		webservice String FrogRemark;
		webservice String FrogType;
		webservice String FroggedOnCable;
		webservice String FroggedOnCableOfficeCode;
		webservice String FroggedOnPair;
		webservice Terminal FromTerminal;
		webservice Integer SequenceNumber;
		webservice Terminal ToTerminal;
    }
    global class InternetInfoType {
		webservice Boolean ADSLCapableFlag {get;set;}
		webservice String ADSLCapableReason {get;set;}
		webservice Boolean SDSLCapableFlag {get;set;}
		webservice String SDSLCapableReason {get;set;}
		webservice Boolean HSIAvailableFlag {get;set;}
		webservice String HSIAvailabilityDescription {get;set;}
		webservice Boolean FiberProductCapableFlag {get;set;}
		webservice String ModemOwnership {get;set;}
		webservice ConnectionListType Connections {get;set;}
		webservice String AccountSpeed {get;set;}
		webservice String FictitiousId {get;set;}
		webservice String LineCardType {get;set;}
		webservice String OrderedSpeed {get;set;}
		webservice String PlantType {get;set;}
		webservice String HSIPort {get;set;}
		webservice String PortStatus {get;set;}
		webservice String TerminalInformation {get;set;}
		webservice String AvailableMaxProductSpeed {get;set;}
		webservice String HighestAvailableSpeed {get;set;}
		webservice String InServiceHSIConnectionId {get;set;}
		webservice String PrimaryCircuit {get;set;}
		webservice DigitalSubscriberLineAccessMultiplexer DslamInfo {get;set;}
    } 
	global class ConnectionListType {
		webservice ConnectionType[] Connection {get;set;}
	}
	global class ConnectionType {
		webservice String CentralOffice {get;set;}
		webservice CommonLanguageLocationId CentralOfficeClliCode {get;set;}
		webservice String Origination {get;set;}
		webservice CommonLanguageLocationId RemoteOfficeClliCode {get;set;}
		webservice String TerminalId {get;set;}
		webservice String TerminalSpeed {get;set;}
		webservice TechnologyListType Technologies {get;set;}
	}
	global class TechnologyListType {
		webservice TechnologyType[] Technology {get;set;}
	}
	global class TechnologyType {
		webservice String Technology {get;set;}
		webservice String TechnologyGroup {get;set;}
		webservice String TechnologyItem {get;set;}
		webservice String AvailableSpeed {get;set;}
		webservice String AdditionalSpeedInfo {get;set;}
		webservice String MaxDslamSpeed {get;set;}
		webservice String DefaultModem {get;set;}
		webservice String MarketOffering {get;set;}
		webservice String CustomerType {get;set;}
		webservice Boolean PrePaidBroadBandCapableFlag {get;set;}
	}
    global class Line {
		webservice String TransportMedium {get;set;}
		webservice String DropType {get;set;}
		webservice Boolean DroppedFlag {get;set;}
    }
    global class AddressUnit {
		webservice Integer SequenceNumber {get;set;}
		webservice String Designator {get;set;}
		webservice String Number_x {get;set;}
	}
    global class CommonLanguageLocationId {
		webservice String GeographicalCode;
		webservice String GeopoliticalCode;
		webservice String NetworkSiteCode;
		webservice String NetworkEntityCode;
    }
    global class CodeDescriptionPair {
		webservice String Code {get;set;}
		webservice String Description {get;set;}
    }
	global class GlobalPosition {
		webservice String Latitude;
		webservice String Longitude;
		webservice String GeoCode;
	}
	global class Exchange {
		webservice String NPA {get;set;}
		webservice String NXX {get;set;}
	}
	global class AdditionalAddressInfo {
		webservice CharacteristicValue CharacteristicValue {get;set;}
	}
	global class CharacteristicValue {
		webservice String Characteristic {get;set;}
		webservice String Value {get;set;}
		webservice TimePeriod TimePeriod {get;set;}
		webservice CharacteristicValue[] CharacteristicValue {get;set;}
	}
	global class TimePeriod {
		webservice DateTime StartDateTime;
		webservice DateTime EndDateTime;
		webservice String StartDateTimeString;
		webservice String EndDateTimeString;
	}
	global class LineCardHistory {
		webservice Date ConnectDate;
		webservice Date DisconnectDate;
		webservice String PairStatus;
		webservice String DisconnectReason;
		webservice String CustomerName;
		webservice TelephoneNumber TelephoneNumber {get;set;}
	}
	global class DataSourceEnvironment {
		webservice String BillingSystem {get;set;}
		webservice String DataRegion {get;set;}
		webservice Integer DataRegionCode {get;set;}
		webservice String DataSource {get;set;}
		webservice String DataEnvironment {get;set;}
	}
    //------------------------- Z address started
    global class ZaddressesClass{
        webservice List<ZaddressClass> Zaddress;
    }
    
    global class ZaddressClass{
        webservice AddressTypeClass AddressType;
        webservice String IsInFrontierFootprint;        
    }
    //------------------ Z address eneded
    //------------------------- Notes started
    global class NotesClass{
        webservice List<NoteClass> Note;
    }
    global class NoteClass{
        webservice String TextBody;
        webservice String CreatedBy;
        webservice String CreatedDate;
        webservice String NoteId;
    }
    //------------------ Notes eneded
    //------------------------- Promotions started
    global class PromotionsClass{
        webservice List<PromotionClass> Promotion;
    }
    global class PromotionClass{
        webservice String IsTerm;
        webservice String TermLength;
        webservice String TermEndDate;
        webservice String TermEndDateMismatch;
        webservice String PromoName;
        webservice String PromotionId;
        webservice String PSKU;
        webservice String PromoExpirationDate;
        webservice String DiscountAmount;
    }
    //------------------ Promotions eneded
    //------------------------- Discount started
    global class DiscountClass{
        webservice DiscountSubClass Discount;
    }
    global class DiscountSubClass{
        webservice String DiscountType;
        webservice String DiscountAmount;
        webservice String PercentageDiscountAmount;
    }
    //------------------ Discount eneded
}