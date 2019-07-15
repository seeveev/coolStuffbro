@RestResource(urlMapping='/myMethodRest1/*')
global with sharing class MyOwnTypeRestResource1 {

    @HttpPost
    global static ProductcreateClass echoMyType(ProductcreateClass ic) {
    //global static MyUserDefinedClass echoMyType(MyUserDefinedClass ic) {
    
        System.debug('*** in method ' + ic);
        //System.debug('**** in ' + ic.Products);
        //Check Wether Opporutnity is available or not
        /*List<Opportunity> lstOpp = [select id, name from Opportunity where id=:ic.OpportunityId];
        if(lstOpp.size()>0){
        
            SterlingQuote__c objxml = new SterlingQuote__c();    //Create a dummy Quote
            //List<SterlingQuote__c> lstSQ = [SELECT Id FROM SterlingQuote__c WHERE CPQQuoteId__c =:ic.CPQQuoteId AND OpportunityId__c =:ic.OpportunityId];
            List<SterlingQuote__c> lstSQ = [SELECT Id FROM SterlingQuote__c WHERE id=:ic.SFAQuoteId AND OpportunityId__c =:ic.OpportunityId];
            if(lstSQ.size()>0){
                objxml = lstSQ[0];    //If the record is already available then use the existing one
            }
            
            //Assign all XML values
            objxml.OpportunityId__c = ic.OpportunityId;
            objxml.SFAQuoteId__c = ic.SFAQuoteId;
            objxml.CPQQuoteId__c = ic.CPQQuoteId;
            objxml.ApprovalType__c= ic.ApprovalType;
            objxml.ExpediteIncluded__c = ic.ExpediteIncluded;
            
            upsert objxml;    //it will act as insert and upate
            
            List<SterlingQuoteItem__c> lstSQI = new List<SterlingQuoteItem__c>();
            //Insert SerlingQuoteLneItem value
            System.debug('*** in ic.products ' + ic.products);
            ProductsClass objProc = ic.products;
            List<ProductClass> lstProducts = objProc.product;
            for(ProductClass objPC:lstProducts){
                System.debug('*** Products ' + objPC);
                SterlingQuoteItem__c objSQ = new SterlingQuoteItem__c();
                objSQ.SterlingQuote__c = objxml.id;
                objSQ.AddressDescription__c = objPC.AddressDescription;
                objSQ.NetworkDistance__c = objPC.NetworkDistance;
                objSQ.DataRegion__c = objPC.DataRegion;
                lstSQI.add(objSQ);
                
                //INsert ZAddresses
            ZaddressesClass objZaddMain = objPC.Zaddresses;
             System.debug('*** objZaddMain ' + objZaddMain );
            ZaddressClass objZadSub = objZaddMain.Zaddress;
             System.debug('*** objZadSub ' + objZadSub );
            AddressTypeClass objAddType = objZadSub.AddressType;
             System.debug('*** objAddType ' + objAddType );
            ServiceAddressClass objSerAdd = objAddType.ServiceAddress;
             System.debug('*** objSerAdd ' + objSerAdd );
            PostalAddressClass objPostalAdd = objAddType.PostalAddress;
             System.debug('*** objPostalAdd ' + objPostalAdd );
            
            ZAddress__c objZ = new ZAddress__c();
            objZ.StreetNrFirst__c = objSerAdd.StreetNrFirst;
            insert objZ;
                
            }
            
            System.debug('*** lstSQI ' + lstSQI);
            if(lstSQI.size()>0)
                insert lstSQI;
            
            
        
        }*/
        return ic;
        
    }
    
      global class ProductcreateClass{
         webservice List<ItemsListclass> ItemList{get;set;}
      }
      global class  ItemsListclass{
         webservice String Item{get;set;}
         //webservice PrimaryInfoclass PrimaryInformation{get;set;}
      }
    
    
    global class MyUserDefinedClass {

           global String OpportunityId {get; set;} 
           global String SFAQuoteId;
           global String CPQQuoteId;
           global boolean ExpediteIncluded{get; set;}
           global String ApprovalType{get;set;}
           global ProductsClass products;
           //global AddressTypeClass AddressType;
           
    }
    
    global class ProductClass{
        global String AddressDescription;
        global String NetworkDistance;
        global String DataRegion;
        global ZaddressesClass Zaddresses;
    }
    
    global class ProductsClass{
        global List<ProductClass> product;
    }
    
    global class AddressTypeClass{
        global ServiceAddressClass ServiceAddress;
        global PostalAddressClass PostalAddress;
        
    }
    global class ServiceAddressClass{
        global String StreetNrFirst;
        global String StreetName;
        global String StreetSubDescription;
        global String StreetSuffix;
        global String StreetDirection;
        global String Subdivision;
        global String Locality;
        global String StateOrProvince;
        global String Postcode;
        global String BuildingName;
        global String BuildingNumber;
        global String BuildingSubNumber;
        global String WireCenter;
        global String ServiceSequenceNumber;
        global String ServiceControlNumber;
        //global UnitClass Unit;
        global ExchangeClass Exchange;
    }
    global class PostalAddressClass{
        global String Locality;
        global String StateOrProvince;
        global String Country;
        global String Postcode;
        global AddressTextClass AddressText;
    }
    //global class UnitClass{
    //    global String Number;
    //    global String Designator;
    //}
    global class ExchangeClass{
        global String NPA;
        global String NXX;
    }
    global class AddressTextClass{
        global String AddressText;
        global String SequenceNumber;
    }
    //------------------------- Z address started
    global class ZaddressesClass{
        global ZaddressClass Zaddress;
    }
    
    global class ZaddressClass{
        global AddressTypeClass AddressType;
        global String IsInFrontierFootprint;
        
    }
    //------------------ Z address eneded
}