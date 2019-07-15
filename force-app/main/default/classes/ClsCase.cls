public class ClsCase {

    public Integer typeVal{get; set;}
    public String typeValDropDown {get; set;}
    public Integer RandVal;
    public String strQuery;
    public String strAddIDs;
    List<Case> custom;
    Set<Integer> My_String;  
    public List<Case> customRetr;
    public List<SearchResult__c> CFR;    //Find variable
    public List<SearchResult__c> CFRPrintRes;
    public String strVPr;
    public String strVPrQuery;
    public List<Case> CFRSearchResult;    //Find variable
    //public String strFinVal{get; set;}
    private String qp;
    custom__c fromDate;
    custom__c toDate;
    
    public ClsCase(ApexPages.StandardController controller) {
        this.qp = ApexPages.currentPage().getParameters().get('qp');
         System.debug('**************** qp value in cons ' + qp);
    }
     public custom__c getFromDate(){
        if(fromDate==null)
            fromDate = new custom__c();
        return fromDate;
    }
    
    public custom__c getToDate(){
        if(toDate==null)
            toDate = new custom__c();
        return toDate;
    }

    public List<Case> getcustoms() {
    
        System.debug('****************' + typeVal);
        strAddIDs=null;
        if(typeVal>0)
        {
           System.debug('**************** In If Cond.,' + typeVal + ' Type vaue : ' + typeValDropDown);
           //strQuery = 'Select c.type, c.CaseNumber,c.Subject, c.Priority From Case c limit ' + typeVal;
           //System.debug('**************** ' + strQuery  );
 //          custom = Database.query(strQuery);
           custom = [Select c.Not_Applicable__c, c.Yes__c, c.NO__c, c.type, c.CaseNumber,c.Subject, c.Priority From Case c where c.Type=:typeValDropDown and (c.CreatedDate>=:fromDate.date__c and c.CreatedDate<=:toDate.date__c)];

           System.debug('**************** count ' + custom.size() );
            //System.debug('Random numbers between 1 and 100 are');
            customRetr=new List<Case>();
             My_String = new Set<Integer>();

            for(Integer i=0; i < 50; i++){
                RandVal = Math.round(Math.random()*typeVal);
                //System.debug('Random Number ['+ (i+1) + '] : ' + RandVal );
                if(My_String.contains(RandVal))
                {
                }
                else
                {
                     if(RandVal < custom.size())//if(RandVal < typeVal)
                    {
                        System.debug('IN if rand [' + RandVal);
                        customRetr.add(custom.get(RandVal));
                        My_String.add(RandVal);
                        strAddIDs = strAddIDs + ',\'' + custom.get(RandVal).id + '\'';
                        
                       // System.debug('***************** countains ' + RandVal);
                        //System.debug('***************** get countains ' + custom.get(RandVal) + ' IDValue ' + custom.get(RandVal).id + ' val :: ' + strAddIDs);
                        //System.debug('***************** get customRetr' + customRetr);
                        
                    }
                }               
            }
        }
        return customRetr;

    }
    //Call this method on search button to insert a new reocrd in custom object
    public void InsertFindResult()
    {
         Integer lastCreated;
            List<SearchResult__c> records = [Select s.Name, s.LastModifiedDate From SearchResult__c s order by CreatedDate DESC limit 1];
            if(records.size() > 0)
                lastCreated = integer.ValueOf(records[0].Name);
            else
                lastCreated=1;
            
             System.debug('***************** last create value' + lastCreated );
            
            //Insert into object
            SearchResult__c sr = new SearchResult__c();
            sr.Name = String.ValueOf(lastCreated+1);
            strAddIDs=strAddIDs.replace('null,','');
            sr.FindResult__c = strAddIDs;
            insert sr;
           
    }
    public List<SelectOption> getTypeDD() {

            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('-- Select One --', '-- Select One --'));
            
            Set<String> uniqueCustomObjectSet = new Set<String>();
            for(Case sl:[Select c.type From Case c]){
                    uniqueCustomObjectSet.add(sl.type);
            }
            List<String> uniqueCustomObjectList = new List<String>(uniqueCustomObjectSet);
            
            for(integer i=0; i<uniqueCustomObjectList.size(); i++){
                  //  options.add(new SelectOption(uniqueCustomObjectList[i],uniqueCustomObjectList[i]));
            }
    
    return options;
    
    }
    
    //This is for Find Page
    //public PageReference recordID(SearchResult__c sr)
    //{
     //   return null;
    //}
    public List<Case> getFindStoreResult() {
    this.qp = ApexPages.currentPage().getParameters().get('qp');
        System.debug('**************** qp value ' + qp);
        //CFRSearchResult = [Select c.Not_Applicable__c, c.Yes__c, c.NO__c, c.type, c.CaseNumber,c.Subject, c.Priority From Case c where c.id in('500U0000000UnbUIAS','500U0000000UnbZIAS','500U0000000UnbPIAS')];
       
        CFRPrintRes = [Select s.FindResult__c From SearchResult__c s where s.id=:qp];
        if(CFRPrintRes.size()>0)
                strVPr = CFRPrintRes[0].FindResult__c;
        else
                strVPr = null;
        System.debug('************ strVPr ' + strVPr);
        strVPrQuery = 'Select c.Not_Applicable__c, c.Yes__c, c.NO__c, c.type, c.CaseNumber,c.Subject, c.Priority From Case c where c.id in(' + strVPr + ')';
        System.debug('************ strVPrQuery ' + strVPrQuery);
        CFRSearchResult = Database.query(strVPrQuery);//[Select c.Not_Applicable__c, c.Yes__c, c.NO__c, c.type, c.CaseNumber,c.Subject, c.Priority From Case c where c.id in(:strVPr)];
        //CFRSearchResult = [Select c.Not_Applicable__c, c.Yes__c, c.NO__c, c.type, c.CaseNumber,c.Subject, c.Priority From Case c where c.id in(:strVPr)];
        return CFRSearchResult;

    }
    public PageReference PageFindResult()
    {
        return Page.CaseFindPage;
    }
    public PageReference BackToSearch()
    {
        return Page.CaseSearchPage;
    }
    public List<SearchResult__c> getFindResult() {
        
        CFR = [Select c.id, c.Name, c.FindResult__c From SearchResult__c c];
        return CFR;
    }


}