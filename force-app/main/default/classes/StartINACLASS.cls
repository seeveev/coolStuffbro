public class StartINACLASS{
    public String strID {get;set;}
    public String strPopMsg    {get;set;}
    public List<zAddSub> lstDisList    {get;set;}
    public List<zAddSub> lstSelRec    {get;set;}
    public string paramval{get;set;}
   // public List<Control_Call__c> INAURL {get;set;}
     public List<SterlingQuoteItem__c> SQI {get;set;}
     public List<ZAddress__c> lstobjz {get;set;}
    public StartINACLASS(ApexPages.StandardController controller) {
        strID = apexpages.currentpage().getparameters().get('qli');
        
        lstDisList =  new List<zAddSub>();
        lstSelRec  =  new List<zAddSub>();
        //Get list of ZAddressses
        SterlingQuoteItem__c SQI = [SELECT id,
        StreetNrFirst__c,
        StreetDirection__c,
        StreetName__c, 
        StreetSuffix__c,
        StreetSubDescription__c,
        locality__c,
        NPA__c, NXX__c, 
         
        StateorProvince__c, 
        Postcode__c, 
         
        BuildingNumber__c,
        BuildingSubNumber__c FROM SterlingQuoteItem__c where Id=:strID limit 1];
        List<ZAddress__c> lstA = [SELECT BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,Country__c,CreatedById,CreatedDate,Id,IsDeleted,IsInFrontierFootprint__c,Locality__c,Name,NPA__c,NXX__c,OwnerId,Postcode__c,ServiceControlNumber__c,ServiceSequenceNumber__c,StateOrProvince__c,SterlingQuoteItem__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,SystemModstamp,unit_Designator__c,unit_number__c,WireCenter__c FROM ZAddress__c WHERE SterlingQuoteItem__c=:strID ];
        for(ZAddress__c objz:lstA ){
            zAddSub objza = new zAddSub();
           // objza.bolSelected = false;
            objza.objZAdd= objZ;
            lstDisList.add(objza);
            system.debug('$$$$$$$$$$$'+lstDisList);
        }
        
    }
    //public void showPopup(){
    
    //}
    public class zAddSub{
        public Boolean bolSelected    {get;set;}
        public ZAddress__c objZAdd {get;set;}
    }
    
    public boolean displayPopup {get; set;}    
 //   ZAddress__c  objZad=  [SELECT BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,Country__c,CreatedById,CreatedDate,Id,IsDeleted,IsInFrontierFootprint__c,Locality__c,Name,NPA__c,NXX__c,OwnerId,Postcode__c,ServiceControlNumber__c,ServiceSequenceNumber__c,StateOrProvince__c,SterlingQuoteItem__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,SystemModstamp,unit_Designator__c,unit_number__c,WireCenter__c FROM ZAddress__c WHERE id =:paramval]; 
    public pageReference  closePopup() {        
         displayPopup = true;   
        //Save Record to DB
         ZAddress__c objZ = new ZAddress__c(id=paramval);
         system.debug('***** '+strPopMsg + '   ' + paramval +'     ' + apexpages.currentpage().getparameters().get('paramval'));
         objZ.Circuit_Price_QuoteId__c = strPopMsg;
         upsert objZ;
         system.debug('***** objZ '+objZ);
         pageReference pg = new pageReference('/apex/QuoteLineItem?id='+strID);
         pg.setRedirect(true);
          return pg;
         
    }     
   
   public pageReference showPopup() {
         system.debug('$$$$$$$$$$$$$$$$'+lstSelRec);
         displayPopup = true; 
            return null;
    } 

 public pageReference showPopup1() {
        system.debug('$$$$$$$$$$$$$$$$ par '+paramval);
        displayPopup = true; 
     //   ZAddress__c objZ = new ZAddress__c(id=paramval);
      
         lstobjz =[SELECT BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,Country__c,CreatedById,CreatedDate,Id,IsDeleted,IsInFrontierFootprint__c,Locality__c,Name,NPA__c,NXX__c,OwnerId,Postcode__c,ServiceControlNumber__c,ServiceSequenceNumber__c,StateOrProvince__c,SterlingQuoteItem__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,SystemModstamp,unit_Designator__c,unit_number__c,WireCenter__c FROM ZAddress__c WHERE id=:paramval]; 
          system.debug('########'+lstobjz);
        
        
        SQI = [SELECT id,
        StreetNrFirst__c,
        StreetDirection__c,
        StreetName__c, 
        StreetSuffix__c,
        StreetSubDescription__c,
        locality__c,
        NPA__c, NXX__c, 
         
        StateorProvince__c, 
        Postcode__c, 
         
        BuildingNumber__c,
        BuildingSubNumber__c FROM SterlingQuoteItem__c where Id=:strID limit 1];
        // String concate the given values
     //   String strURL ='http://j2apptest11.czncorp.com:8080/ina/CPQNotesEdit.action?action=new&alocNpanxx=123456&alocStreet=180%20South%20Clinton%20Ave&alocFloor=2&alocSuite=100&alocCity=Rochester&alocState=NY&alocZip=14604&zlocNpanxx=456789&zlocStreet=1225%20West%20Henrietta%20Blvd&zlocFloor=1&zlocSuite=100&zlocCity=Henrietta&zlocState=NY&zlocZip=14526 ';
         string  Outid = ApexPages.currentPage().getParameters().get('id');
         string CCName = 'INA';
     //    INAURL = [Select URL_Value__c FROM Control_Call__c where URL_Name__c =:CCName];
    //     string baseUrl =   INAURL[0].URL_Value__c;
         string a2street;
         string z2street;
         string strUrl;
         string a2Floor = SQI[0].BuildingNumber__c;
         string a2suite = SQI[0].BuildingSubNumber__c;
         string z2Floor = lstobjz[0].BuildingNumber__c;
         string z2suite = lstobjz[0].BuildingSubNumber__c;
         if (SQI[0].StreetDirection__c != null) 
            a2street = a2street + ' ' + SQI[0].StreetDirection__c;
            system.debug('A2Street D 1 ------ ' + a2street);
            a2street = a2street + ' ' + SQI[0].StreetName__c;
            if (SQI[0].StreetSuffix__c != null)
            a2street = a2street + ' ' + SQI[0].StreetSuffix__c;
            if (SQI[0].StreetSubDescription__c != null) 
            a2street = a2street + ' ' + SQI[0].StreetSubDescription__c;
            
            if (lstobjz[0].StreetNrFirst__c != null) 
            z2street = lstobjz[0].StreetNrFirst__c;
            if (lstobjz[0].StreetDirection__c != null)
             z2street = z2street + ' ' + lstobjz[0].StreetDirection__c;
            z2street =  z2street + ' ' +lstobjz[0].StreetName__c;
            if (lstobjz[0].StreetSuffix__c != null)
             z2street = z2street + ' ' + lstobjz[0].StreetSuffix__c;
            if (lstobjz[0].StreetSubDescription__c != null) 
            z2street = z2street + ' ' + lstobjz[0].StreetSubDescription__c;
           if (a2floor!= null)
        strUrl = strUrl+'&alocFloor='+a2floor;
        if (a2suite != null)
        strUrl = strUrl +'&alocSuite='+a2suite;
        if (z2floor != null)
        strUrl = strUrl+'&zlocFloor='+z2floor;
        if (z2suite != null)
         strUrl = strUrl +'&zlocSuite='+z2suite;
            
  //       strUrl =baseUrl+'&alocNpanxx='+SQI[0].NPA__c+SQI[0].NXX__c+'&alocStreet='+a2street+'&alocCity='+SQI[0].locality__c+'&alocState='+SQI[0].StateOrProvince__c+'&alocZip='+SQI[0].Postcode__c+'&zlocNpanxx='+lstobjz[0].NPA__c+''+lstobjz[0].NXX__c+'&zlocStreet='+z2street+'&zlocCity='+lstobjz[0].Locality__c+'&zlocState='+lstobjz[0].StateOrProvince__c+'&zlocZip='+lstobjz[0].Postcode__c;
         
       //  String strURL = 'http://j2apptest11.czncorp.com:8080/ina/CPQNotesEdit.action?action=new&alocNpanxx='+SQI.NPA__c+SQI.NXX__c+'&alocStreet='+ SQI.StreetNrFirst__c+SQI.StreetDirection__c+''+SQI.StreetName__c+''+SQI.StreetSuffix__c+'&alocFloor='+SQI.BuildingNumber__c+'&alocSuite='+SQI.BuildingSubNumber__c+'&alocCity='+SQI.locality__c+'&alocState='+SQI.StateOrProvince__c+'&alocZip='+SQI.Postcode__c+'&zlocNpanxx='+lstobjz.NPA__c+''+lstobjz.NXX__c+'&zlocStreet='+ lstobjz.StreetNrFirst__c+''+lstobjz.StreetDirection__c+''+lstobjz.StreetName__c+''+lstobjz.StreetSuffix__c+'&zlocFloor='+lstobjz.BuildingNumber__c+'&zlocSuite='+lstobjz.BuildingSubNumber__c+'&zlocCity='+lstobjz.Locality__c+'&zlocState='+lstobjz.StateOrProvince__c+'&zlocZip='+lstobjz.Postcode__c;
         system.debug('url parsing'+strURL);
         system.debug(''+strURL); 
        pageReference pg = new pageReference(strURL);
      //  pg.setRedirect(true);
        //return pg;
        return null;
     }
}