public class zaddressRadioCtrl {
    public String strID {get;set;}
    public String strPopMsg    {get;set;}
    public List<zAddSub> lstDisList    {get;set;}
    public List<zAddSub> lstSelRec    {get;set;}
    public String strURL    {get;set;}
    public String strSelID    {get;set;}
    
    public zaddressRadioCtrl(ApexPages.StandardController controller) {
        strID = apexpages.currentpage().getparameters().get('qli');
        strURL='test';
        lstDisList =  new List<zAddSub>();
        lstSelRec  =  new List<zAddSub>();
        //Get list of ZAddressses
        List<ZAddress__c> lstA = [SELECT AddressText__c,AddressType__c,BuildingName__c,BuildingNumber__c,BuildingSubNumber__c,Country__c,CreatedById,CreatedDate,Id,IsDeleted,IsInFrontierFootprint__c,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Locality__c,Name,NPA__c,NXX__c,OwnerId,Postcode__c,Quote_Line_Item_Number__c,Quote_Line_Number__c,ServiceControlNumber__c,ServiceSequenceNumber__c,StateOrProvince__c,SterlingQuoteItem__c,StreetDirection__c,StreetName__c,StreetNrFirst__c,StreetSubDescription__c,StreetSuffix__c,Subdivision__c,SystemModstamp,unit_Designator__c,unit_number__c,WireCenter__c,Z_Service_Address__c FROM ZAddress__c WHERE SterlingQuoteItem__c=:strID ];
        for(ZAddress__c objz:lstA ){
            zAddSub objza = new zAddSub();
            objza.bolSelected = false;
            objza.objZAdd= objZ;
            objza.strID = objZ.id;
            lstDisList.add(objza);
        }
        
    }
    //public void showPopup(){
    
    //}
    public class zAddSub{
        public Boolean bolSelected    {get;set;}
        public String strID    {get;set;}
        public ZAddress__c objZAdd {get;set;}
    }
    
    public boolean displayPopup {get; set;}     
    public pageReference  closePopup() {        
        displayPopup = false;   
        
        //Save Record to DB
        ZAddress__c objZ = new ZAddress__c(id=lstSelRec[0].objZAdd.id);
        objZ.BuildingName__c = strPopMsg;
        upsert objZ;
        
        //String concate the given values
   /*     String strURL = 'https://c.na12.visual.force.com/alocNpanxx='+ objZ.name +'&alocStreet='+ objZ.BuildingNumber__c;
        pageReference pg = new pageReference(strURL);
        pg.setRedirect(true);
        return pg; */
        return null;
         
    }     
    public pageReference showPopup() {
         lstSelRec.clear();
         
          for(zAddSub objzs : lstDisList){
                if(objzs.bolSelected==true){
                    lstSelRec.add(objzs);
                }
            }
        //strSelID = apexpages.currentpage().getparameters().get('tt');
        System.debug('**** lstSelRec ' +lstSelRec + '    ' + lstSelRec.size() + '     strSelID  ' + strSelID );
        
       /* if(lstSelRec.size()==0){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select only one address'));
            return null;
        }
         
         displayPopup = true; 
           
         ZAddress__c objZ = new ZAddress__c(id=lstSelRec[0].objZAdd.id);
         strURL = 'https://c.na12.visual.force.com/alocNpanxx='+ objZ.name +'&alocStreet='+ objZ.BuildingNumber__c;
         System.debug('**** strURL  ' +strURL );
        
        pageReference pg = new pageReference(strURL);
         pg.setRedirect(true);*/
        //return pg; 
       return null;
      
        
    /*    if(lstSelRec.size()>1){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select only one address'));
            return null;
        }
         */
      //  displayPopup = true;    
      //  return null;
    }
    public String getURLVal(){
        System.debug('**** strURL 1 ' +strURL );
        return strURL;
    }
}