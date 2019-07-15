public with sharing class TripController {
    public String strNewEdit    {get;set;}
    public Trip__c objTrip    {get;set;}
    private String strTripId;
    public List<WrapAdventures> lstAdvWrap {get;set;}
    public List<WrapAdventures> lstWSTenSize {get;set;}
    public Integer intTripLegs {get;set;}
    public Integer intTripLength {get;set;}
    public Integer intAvailTripLegs {get;set;}
    public Integer intAvailTripLength {get;set;}
    
    public string strSelDiff{set;get;}
    transient List<Schema.PicklistEntry> ple = new List<Schema.PicklistEntry>();
    
    public TripController(ApexPages.StandardController controller) {
        strNewEdit='New Trip';
        strTripId = apexpages.currentpage().getparameters().get('id');
        
        if(strTripId==null || strTripId==''){
            objTrip =  new Trip__c();
            strNewEdit='New Trip';
            intTripLegs=0;
            intTripLength=0;
            intAvailTripLegs=20;
            intAvailTripLength=30;
            lstAdvWrap = new List<WrapAdventures>();
            
            //Get all Adventures
            List<Adventure__c> lstAdv = [select id, name, Difficult__c,Group_Size__c,Length_d__c,Location__c,Max_Group_Size__c from Adventure__c];
            for(Adventure__c objAdv : lstAdv ){
                WrapAdventures objWtemp = new WrapAdventures();
                objWtemp.objAdv = objAdv;
                lstAdvWrap.add(objWtemp);
            }
            
            
        }else{
            intTripLegs=0;
            intTripLength=0;
            intAvailTripLegs=20;
            intAvailTripLength=30;
            
            objTrip = [select id, name, Customer__c from Trip__c where id=:strTripId];
            strNewEdit=objTrip.name;
            List<Trip_Leg__c> lstDelTripLeg = [select id, name,Trip__c,Adventure__c from Trip_Leg__c where Trip__c =: objTrip.id];
            
            //Trip Legs
            intTripLegs = lstDelTripLeg.size();
            intAvailTripLegs = intAvailTripLegs-intTripLegs;
            
            
            //Take all Trip legs into Map
            Map<id,id> mapExiTripLeg = new Map<id,id>();
            for(Trip_Leg__c objtl : lstDelTripLeg ){
                mapExiTripLeg.put(objtl.Adventure__c,objtl.Adventure__c);
            }
            
            
            lstAdvWrap = new List<WrapAdventures>();
            List<Adventure__c> lstAdv = [select id, name, Difficult__c,Group_Size__c,Length_d__c,Location__c,Max_Group_Size__c from Adventure__c];
            for(Adventure__c objAdv : lstAdv ){
                WrapAdventures objWtemp = new WrapAdventures();
                objWtemp.objAdv = objAdv;
                if(mapExiTripLeg.get(objAdv.id)!=null){
                    objWtemp.bolSelected=true;
                    intTripLength +=Integer.valueof(objWtemp.objAdv.Length_d__c);
                }
                lstAdvWrap.add(objWtemp);
            }
            
            intAvailTripLength = intAvailTripLength-intTripLength ;
        }
        
        lastPageno = lstAdvWrap.size()/2; // Page size 10 rows
        pageno =1;
        if(lastPageno*2 < lstAdvWrap.size())
            lastPageno++;
        
        if(pageno < lastPageno )
            hasNext = true;
        else 
            hasNext = false;
        
        if(pageno > 1 )
            hasPrevious = true;
        else
            hasPrevious = false;
        
        listToDisplay();
        
    }
    
    public class WrapAdventures{
        public boolean bolSelected    {get;set;}
        public Adventure__c objAdv    {get;set;}
    }
    
    public List<SelectOption> getDiffValues(){
      List<SelectOption> options = new List<SelectOption>();
      options.add(new SelectOption('All', '--Any Difficulty Level--'));
             
      Schema.DescribeFieldResult fieldResult = Adventure__c.Difficult__c.getDescribe();
      ple = fieldResult.getPicklistValues();
     
      
       for( Schema.PicklistEntry f : ple){
          options.add(new SelectOption(f.getLabel(), f.getValue()));
       }       
       return options;
    }
    
    public void forAdventrueRecrods(){
        lstAdvWrap = new List<WrapAdventures>();
        //Get all Adventures
        List<Adventure__c> lstAdv = new List<Adventure__c>();
        if(strSelDiff!='All')
            lstAdv = [select id, name, Difficult__c,Group_Size__c,Length_d__c,Location__c,Max_Group_Size__c from Adventure__c where Difficult__c=:strSelDiff];
        else
            lstAdv = [select id, name, Difficult__c,Group_Size__c,Length_d__c,Location__c,Max_Group_Size__c from Adventure__c];
            
        for(Adventure__c objAdv : lstAdv ){
            WrapAdventures objWtemp = new WrapAdventures();
            objWtemp.objAdv = objAdv;
            lstAdvWrap.add(objWtemp);
        }
        
        lastPageno = lstAdvWrap.size()/2; // Page size 10 rows
        pageno =1;
        if(lastPageno*2 < lstAdvWrap.size())
            lastPageno++;
        
        if(pageno < lastPageno )
            hasNext = true;
        else 
            hasNext = false;
        
        if(pageno > 1 )
            hasPrevious = true;
        else
            hasPrevious = false;
        
        listToDisplay();
    }
    
    public Pagereference pgSaveRecord(){
        //Get all Selected ID
        
        upsert objTrip;
        
        List<Trip_Leg__c> lstTripLeg = new List<Trip_Leg__c>();
        for(WrapAdventures objselW : lstWSTenSize){
            if(objselW.bolSelected ==true){
                Trip_Leg__c objtl = new Trip_Leg__c();
                objtl.Adventure__c = objselW.objAdv.id;
                objtl.Trip__c = objTrip.id;
                lstTripLeg.add(objtl);
            }
        }
        
        //Delete the existig trips
        List<Trip_Leg__c> lstDelTripLeg = [select id, name from Trip_Leg__c where Trip__c =: objTrip.id];
        if(!lstDelTripLeg.isEmpty()) delete lstDelTripLeg;
        
        //Insert new records
        if(!lstTripLeg.isempty()) upsert lstTripLeg;
        
        return null;
    }
    
    //---------- Paginatino starts--------
    Public Boolean hasPrevious {get;set;}
    Public Boolean hasNext {get;set;}
    Public Integer pageno {get;set;}
    Public Integer lastPageno {get;set;}
    
    public PageReference Last() {
        pageno = lastPageno;
        listToDisplay();
        return null;
    }
    public PageReference Next() {
        pageno++;
        listToDisplay();
        return null;
    }
    public PageReference Previous() {
        pageno--;
        listToDisplay();
        return null;
    }
    public PageReference First() {
        pageno = 1;
        listToDisplay();
        return null;
    }

        

    public void listToDisplay(){
        if(pageno < lastPageno )
            hasNext = true;
        else 
            hasNext = false;
            
        if(pageno > 1 )
            hasPrevious = true;
        else
            hasPrevious = false;
            
        lstWSTenSize = new List<WrapAdventures>();
         if(pageNo*2 < lstAdvWrap.size()){
             for (Integer i = ((pageNo*2)-2); i<pageNo*2; i++ ){
                 lstWSTenSize.add(lstAdvWrap[i]);
             }
         }else if(pageNo*10 >= lstAdvWrap.size()){
             for (Integer i = ((pageNo*2)-2); i<lstAdvWrap.size(); i++ ){
                 lstWSTenSize.add(lstAdvWrap[i]);
             }
         } 
    }
    //---------- Paginatino ends--------
}