public class treenodes1 {

    public treenodes1() {
        //Create an Object
        //objHirarchy = new ObjHirarchyTemp__c();
        lstHierarchy = new List<hierarchy__c>();
        lstSelectedUserHierarchy = new List<hierarchy__c>();
        
        //Apply Account Hirarchy by Defalt, which may change in next relase
        strSearchCriteria='Account';
        strSearchByValue='BTN';
                            
    }

    public List<String> lstRegion                                 {get;set;}
    public List<String> lstState                                  {get;set;}
    public List<String> lstCity                                   {get;set;}
    public List<String> lstCLLI                                   {get;set;}
    public List<String> lstServiceLocation                        {get;set;}
    public List<String> lstGYAN                                   {get;set;}
    public List<String> lstSummaryMaster                                  {get;set;}
    public List<String> lstGroupBilling                           {get;set;}
    public List<hierarchy__c> lstHierarchy                        {get;set;}
    public List<hierarchy__c> lstHierarchyUniqueValues                        {get;set;}
    public set<String> setHierarchyUniqueNames              {get;set;} 
    public List<hierarchy__c> lstSelectedUserHierarchy      {get;set;}
    public List<String> lstLocation                         {get;set;}
    public List<String> lstAccount                          {get;set;}
    public List<clsHirarchy> lstclsHirarchy                       {get;set;}
    
    public String strColumnName                             {get;set;}
    public String strColumnValue                            {get;set;}
    public String strSearchCriteria                         {get;set;}
    public String strSearchBy                               {get;set;}
    //public ObjHirarchyTemp__c objHirarchy                               {get;set;}
    public Customer_Account__c objCustomerAccount       {get;set;}
    public List<clsNodes> objList {get;set;}
    public String strSelectedName                       {get;set;}
    public String strGANValue                       {get;set;}
    public String strSearchByValue                              {get;set;}
    public String strCity       {get;set;}
    public String strState      {get;set;}
    public String strQuery;
    public String currentTab                                                            {get;set;}
    public String strSelectedSummary                                                           {get;set;}
    public String strSelectedPhone                                                          {get;set;}
    public string str_BLANK='blank';
    public String strSummaryViewURL             {get;set;}
   
    public boolean bolShowSearchResult          {get;set;}
    public boolean bolShowTree  {get;set;}
    public boolean bolShowSummaryView           {get;set;}

    public boolean bolSecondLevel       {get;set;}      //Use for Tree coloring  (Summary View)
    public boolean bolThirdLevel        {get;set;}      //Use for Tree coloring  (BTN Search)
    public boolean bolShowOrderButton        {get;set;}  
    
    public String strHirarchyQuery = 'SELECT Account_id__c,billing_id__c,BTN_Phone__c,Circuit_Id__c,City__c,CLLI__c,Company_ID__c,Company_name__c,CreatedById,CreatedDate,GAN__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Level__c,Location_Id__c,Name,Name__c,OwnerId,Region__c,Service_Location__c,State__c,Summary_Id__c,Summary_master_phone__c,SystemModstamp,WTN_ID__c,WTN__c FROM hierarchy__c ';
    public String strSearchByStandardValues='GAN,Customer Name,BTN,WTN,Summary Master TN';
    public String strStates='AK,AL,AR,AZ,CA,CO,CT,DE,FL,GA,HI,IA,ID,IL,IN,KS,KY,LA,MA,MD,ME,MI,MN,MO,MS,MT,NC,ND,NE,NH,NJ,NM,NV,NY,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VA,VT,WA,WI,WV,WY';
    //the followig metho will get the search based on search criteria
    public Pagereference searchData(){
                        String strPhoneNumberOnly='';
            System.debug('**************** strSearchCriteria ' + strSearchCriteria + '  strSearchByValue ' + strSearchByValue + ' strColumnValue ' + strColumnValue + ' strCity ' + strCity + ' strstae' + strState);
            
            //For Rendering
            bolShowSearchResult=false;
            bolShowTree=false;
            bolShowSummaryView=false;
            bolShowOrderButton=false; //for buttons
            if(strSearchCriteria==null){        //This is for Hirarchy
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select View Hirearchy'));
                    return null;
            }
            if(strSearchByValue==null || strSearchByValue==''){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select Search By Value'));
                    return null;
            }
            
            if(strColumnValue==null || strColumnValue==''){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Enter Search Text'));
                    return null;
            }

            strColumnName = getSearchColumnNames(strSearchByValue);//;'Name__c';//
            
            //If Search by phone then change the text
            if(strSearchByValue.equals('BTN')||strSearchByValue.equals('Summary Master TN')||strSearchByValue.equals('WTN')){
                strColumnValue = strColumnValue.replace('(', '');
                strColumnValue = strColumnValue.replace(')', '');
                strColumnValue = strColumnValue.replace('-', '');
                strColumnValue = strColumnValue.replace(' ', '');
                System.debug('***** phone len ' + strColumnValue.length() + '  ' + strColumnValue);
                strPhoneNumberOnly=strColumnValue;      //To store only Number
                
                if(strColumnValue.length()==1)
                    strColumnValue='('+strColumnValue.substring(0,1);
                else if(strColumnValue.length()==2)
                    strColumnValue='('+strColumnValue.substring(0,2);
                else if(strColumnValue.length()==3)
                    strColumnValue='('+strColumnValue.substring(0,3);
                else if(strColumnValue.length()==4)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 4);
                else if(strColumnValue.length()==5)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 5);
                else if(strColumnValue.length()==6)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 6);
                else if(strColumnValue.length()==7)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 6) + '-' + strColumnValue.substring(6, 7);
                else if(strColumnValue.length()==8)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 6) + '-' + strColumnValue.substring(6, 8);
                else if(strColumnValue.length()==9)
                    strColumnValue='('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 6) + '-' + strColumnValue.substring(6, 9);                
                else if(strColumnValue.length()==10){
                    //7566706754
                    strColumnValue = '('+strColumnValue.substring(0, 3) + ') ' +strColumnValue.substring(3, 6) + '-' + strColumnValue.substring(6, 10);
                    
                }
                
                System.debug('***** phone ' + strColumnValue);
            }
            
            
            if(strSearchByValue.equals('Customer Name')){
                 if(strCity!=null && strState!=null && strCity!='' && strState!=''){
                    strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' AND City__c=\''+ strCity + '\' AND State__c=\''+ strState +'\' LIMIT 999';
                 }else if(strCity!=''&& strCity!=null){
                        strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' AND City__c=\''+ strCity + '\' LIMIT 999';
                 }else if(strState!=''&& strState!=null){
                        strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' AND State__c=\''+ strState +'\' LIMIT 999';
                 }else{
                        strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' LIMIT 999';
                 }
            }else{
                //the following IF condition is to check only phone numbers without any brackets eg., (212) 123-8765
                if((strSearchByValue.equals('BTN')||strSearchByValue.equals('Summary Master TN')||strSearchByValue.equals('WTN')) && strPhoneNumberOnly!='' && strPhoneNumberOnly!=null)
                    strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' OR ' + strColumnName + ' LIKE \'' + strPhoneNumberOnly + '%\' LIMIT 999';
                else
                    strQuery = strHirarchyQuery + ' WHERE ' + strColumnName + ' LIKE \'' + strColumnValue + '%\' LIMIT 999';
            }
            
            lstHierarchy = Database.query(strQuery);
            if(lstHierarchy.size()==0){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No Data Available for search criteria'));
                return null;
            }
            
            //for Rendering
            bolShowSearchResult=true;
            bolShowTree=false;
            bolShowSummaryView=false;
            
            //For Tree Coloring
            if(strSearchByValue.equals('Customer Name')){
                bolSecondLevel=false; bolThirdLevel=false;
            }else if(strSearchByValue.equals('Summary Master TN')){
                bolSecondLevel=true; bolThirdLevel=false;
            }else if(strSearchByValue.equals('BTN') || strSearchByValue.equals('WTN')){
                bolSecondLevel=true; bolThirdLevel=true;
            }

            
            if(strSearchByValue.equals('Customer Name')||strSearchByValue.equals('GAN')){      //Only for Customer Search get the unique values
                //Get the Unique Values
                setHierarchyUniqueNames = new set<String>();
                for(hierarchy__c hi:lstHierarchy){//Loop through all the records to get unique values
                    setHierarchyUniqueNames.add(hi.Name__c);
                }
                System.debug('****** setHierarchyUniqueNames ' + setHierarchyUniqueNames.size() + '  ' + setHierarchyUniqueNames);
                
                //Store allthe unique records into TempHirarchyList
                //lstHierarchyUniqueValues=lstHierarchy;
                lstHierarchyUniqueValues=new List<hierarchy__c>();
                for(String setUniq:setHierarchyUniqueNames){
                    //Loop through all the records
                     for(hierarchy__c hi:lstHierarchy){//Loop through all the records to get unique values
                        if(hi.Name__c==setUniq){
                            lstHierarchyUniqueValues.add(hi);
                            break;
                        }
                    }
                }
                lstHierarchy.clear();
                lstHierarchy=lstHierarchyUniqueValues;
            }
            if(strSearchByValue.equals('BTN')||strSearchByValue.equals('Summary Master TN')){      //Only for Customer Search get the unique values
                
                //Get the Unique Values
                setHierarchyUniqueNames = new set<String>();
                for(hierarchy__c hi:lstHierarchy){//Loop through all the records to get unique values
                    if(strSearchByValue.equals('BTN'))
                        setHierarchyUniqueNames.add(hi.Name__c+hi.BTN_Phone__c);
                    else if(strSearchByValue.equals('Summary Master TN'))
                        setHierarchyUniqueNames.add(hi.Name__c+hi.Summary_master_phone__c);
                    
                }
                System.debug('***  setHierarchyUniqueNames ' + setHierarchyUniqueNames);
                lstHierarchyUniqueValues=new List<hierarchy__c>();
                String strVal='';
                for(String setUniq:setHierarchyUniqueNames)
                    strVal=strVal+setuniq;
                
                for(hierarchy__c hi:lstHierarchy){
                    String strNam;
                    if(strSearchByValue.equals('BTN'))
                        strNam = hi.Name__c+hi.BTN_Phone__c;
                    else if(strSearchByValue.equals('Summary Master TN'))
                        strNam = hi.Name__c+hi.Summary_master_phone__c;
                    
                    if(strVal.contains(strNam))
                        lstHierarchyUniqueValues.add(hi);
                    
                }
                
                /*for(String setUniq:setHierarchyUniqueNames){
                    //Loop through all the records
                     for(hierarchy__c hi:lstHierarchy){//Loop through all the records to get unique values
                        if(strSearchByValue.equals('BTN')){
                            if(hi.Name__c+hi.BTN_Phone__c==setUniq){
                                lstHierarchyUniqueValues.add(hi);
                                break;
                            }
                        }else if(strSearchByValue.equals('Summary Master TN')){
                            if(hi.Name__c+hi.Summary_master_phone__c==setUniq){
                                lstHierarchyUniqueValues.add(hi);
                                break;
                            }
                        }
                    }
                }*/
                system.debug('**** lstHierarchyUniqueValues ' + lstHierarchyUniqueValues);
                lstHierarchy.clear();
                lstHierarchy=lstHierarchyUniqueValues;
            }
            
            //the following code is for Pagination
            //---------------------- Pagiation Starts -----------------
            //if(setHirar == null) {
                //setHirar = new ApexPages.StandardSetController(Database.getQueryLocator(strQuery));
                setHirar = new ApexPages.StandardSetController(lstHierarchy);
            //}
            // sets the number of records in each page set  
            if(strColumnValue.isNumeric())
                setHirar.setPageSize(500);
            else
                setHirar.setPageSize(200);

            lstHierarchy.clear();
            lstHierarchy = setHirar.getRecords();
            
            //---------------------- Pagiation Ens -----------------
            
            
            System.debug('******** bolShowSearchResult ' + bolShowSearchResult + '  bolShowTree ' + bolShowTree + ' bolShowSummaryView ' + bolShowSummaryView);
                
            return null;
    }
    //------------- for Pagination -------------
    public ApexPages.StandardSetController setHirar{get; set;}   
    
    //for Paginatino
    public List<hierarchy__c> getHierarchy() {
        
        if(setHirar!=null){
            return (List<hierarchy__c>) setHirar.getRecords();
        }
        return null;
    }
    //------------- for Pagination ends -------------
    
    //The following method will get the Picklist Values
    public List<selectOption> getaccts() {
        //Get the List Values
        List<String> lstSelValues=strSearchByStandardValues.split(',');
        
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        for(String strVal:lstSelValues){
                options.add(new selectOption(strVal, strVal)); 
        }
        return options; //return the picklist options
    }
    
    //The following method will show button
    public Boolean showButtonOperation(){
        String strPhone = Apexpages.currentPage().getParameters().get('childValue');
        List<hierarchy__c> lstHir = Database.query(strHirarchyQuery + ' where BTN_Phone__c=\'' + strPhone + '\' and Name__c=\'' + strSelectedName + '\' limit 1');
        System.debug('*** lstHir ' + lstHir);
        if(lstHir.size()>0){
            hierarchy__c objHir = lstHir[0];
            System.debug('*** in If cond ' + objHir);
            if(objHir.Summary_master_phone__c==null || objHir.Summary_master_phone__c==''){
                if(objHir.WTN__c==objHir.BTN_Phone__c)
                    return true;
                else
                    return false;
            }else{
                return false;
            }
        }
        
        return false;
    }
    
    //The following method will create a Dynamic URL
    public void PrepareSummaryViewURL(){
        strSummaryViewURL = '/apex/SummaryPage?childValue='+ Apexpages.currentPage().getParameters().get('childValue') +'&srcCriteria=' + strSearchCriteria+ '&searchLevel=2';
         System.debug('**** strURL ' + strSummaryViewURL + ' objList ' + objList);
         /*if(objList.size()==1)
             bolShowOrderButton=true;
         else
             bolShowOrderButton=false;*/
        bolShowOrderButton=showButtonOperation();
        //return strSummaryViewURL;
    }
    
    //The following method will create a Dynamic URL for BTN Search
    public void PrepareBTNViewURL(){
        strSummaryViewURL = '/apex/SummaryPage?childValue='+ Apexpages.currentPage().getParameters().get('childValue') +'&srcCriteria=' + strSearchCriteria + '&searchLevel=3';
         System.debug('**** strURL ' + strSummaryViewURL);
        //return strSummaryViewURL;
        
        bolShowOrderButton=showButtonOperation();
    }
    //The following method will create a Dynamic URL
    public void PrepareSummaryNameURL(){
        strSummaryViewURL = '/apex/SummaryPage?childValue='+ Apexpages.currentPage().getParameters().get('childValue') +'&srcCriteria=' + strSearchCriteria + '&custName=' + strSelectedName + '&searchLevel=1';
         System.debug('**** strURL ' + strSummaryViewURL);
        //return strSummaryViewURL;
        
        bolShowOrderButton=showButtonOperation();
    }
    //The following method will get the Picklist Values
    public List<selectOption> getState() {
        List<selectOption> options = new List<selectOption>(); 
        options.add(new selectOption('', '- None -')); 
        
        List<String> strVal = strStates.split(',');
        for(String strHirStateTemp:strVal){
            options.add(new selectOption(strHirStateTemp, strHirStateTemp)); 
        }
        
        //Get all the Unique States from DB
        /*List<hierarchy__c> lstHierarchyState = Database.query(strHirarchyQuery + ' Limit 999');
        set<String> uniqueStates = new set<String>();
        for(hierarchy__c objHirStateTemp:lstHierarchyState){
            if(objHirStateTemp.State__c!=null && objHirStateTemp.State__c!='')
                uniqueStates.add(objHirStateTemp.State__c);
        }
        
        //To store the Unique State names
        for(String strHirStateTemp:uniqueStates){
            options.add(new selectOption(strHirStateTemp, strHirStateTemp)); 
        }
        
        /*for(hierarchy__c objHirStateTemp:lstHierarchyState){
                if(objHirStateTemp.State__c!=null && objHirStateTemp.State__c!='')
                        options.add(new selectOption(objHirStateTemp.State__c, objHirStateTemp.State__c)); 
        }*/
        return options; //return the picklist options
    }
    
    //The followign method will get the Radio Buttons
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Account','Account Hierarchy View  ')); 
        //options.add(new SelectOption('Location','Location Hirarchy View')); //Will Enable in next phase
        return options; 
    }

    public void objCustomerAccountInfo(){
        
    }
        
    //the following method will get the column Names
    public String getSearchColumnNames(String strName){
        if(strName.equals('GAN')) return 'GAN__c';
        if(strName.equals('BTN')) return 'BTN_Phone__c';
        if(strName.equals('Order Number')) return 'BTN_Phone__c';
        if(strName.equals('Trouble Ticket Number')) return 'BTN_Phone__c';
        if(strName.equals('Circuit ID')) return 'Circuit_id__c';
        if(strName.equals('CLLI')) return 'CLLI__c';
        if(strName.equals('Product')) return 'BTN_Phone__c';
        if(strName.equals('USI')) return 'BTN_Phone__c';
        if(strName.equals('Summary Master TN')) return 'Summary_master_phone__c';
        if(strName.equals('Customer Name')) return 'Name__c';
        if(strName.equals('WTN')) return 'WTN__c';
        
        
        return null;
    }
    
    public class clsHirarchy{
            public String strLevel1                             {get;set;}
            public List<clsNodes> lstLevel2                 {get;set;}
    }
    
    public class clsNodes{
        public String strLevel2Name                             {get;set;}
        public List<String> lstLevel2Labels               {get;set;}
    }
    //the following method will get the details based on selected user
    public void searchSelectedUserData(){
            String strSelRecordName = Apexpages.currentPage().getParameters().get('recID');
            //strSelectedName = strSelRecordName;       //Used at Tree Level
            System.debug('**** strSelRecordName ' + strSelRecordName + '  strSearchCriteria ' + strSearchCriteria);
            //split the paramters and pull the ID seperatelly
            List<String> lstParamValue = strSelRecordName.split('~');
            //Get the records based on ID
            hierarchy__c objHierarchy = [select id, name,Summary_master_phone__c,BTN_Phone__c,Circuit_id__c from hierarchy__c where id=:lstParamValue[1] limit 1];
            //strSelectedSummary=objHierarchy.summary_phone__c;   //These two variables are used to color on tree structure
            if(objHierarchy.Summary_master_phone__c==null || objHierarchy.Summary_master_phone__c==''){
               // strSelectedSummary=str_BLANK;   //These two variables are used to color on tree structure
                if(objHierarchy.BTN_Phone__c!=null)
                        strSelectedSummary =objHierarchy.BTN_Phone__c;
                    else
                        strSelectedSummary =objHierarchy.Circuit_id__c;
            }else
                strSelectedSummary=objHierarchy.Summary_master_phone__c;   //These two variables are used to color on tree structure
            
            if(objHierarchy.BTN_Phone__c!=null)
                strSelectedPhone =objHierarchy.BTN_Phone__c;
            else
                strSelectedPhone =objHierarchy.Circuit_id__c;
                                
           strSelectedName = lstParamValue[0];     //Used at Tree Level
           strGANValue = lstParamValue[2];
                
            //strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + strSelRecordName + '\'';
            if(strSearchByValue.equals('Customer Name')){
                
                if(strCity!=null && strState!=null && strCity!='' && strState!=''){
                    strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + lstParamValue[0] + '\' AND City__c=\''+ strCity + '\' AND State__c=\''+ strState +'\' LIMIT 999';
                 }else if(strCity!=''&& strCity!=null){
                        strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + lstParamValue[0] + '\' AND City__c=\''+ strCity + '\'  LIMIT 999';
                 }else if(strState!=''&& strState!=null){
                        strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + lstParamValue[0] + '\' AND State__c=\''+ strState +'\'  LIMIT 999';
                 }else{
                        strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + lstParamValue[0] + '\'  LIMIT 999';
                 }
                 
                 //For Tabs data
                strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria+ '&custName=' + strSelectedName + '&searchLevel=1';
            
            }else{
                strQuery = strHirarchyQuery + ' WHERE Name__c=\'' + lstParamValue[0] + '\'  LIMIT 999';
                //For Tabs data
                if(strSearchByValue.equals('GAN'))
                    strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria+ '&custName=' + strSelectedName + '&searchLevel=1';
                else if(strSearchByValue.equals('BTN')||strSearchByValue.equals('WTN'))
                    strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria+ '&searchLevel=3';
                else if(strSearchByValue.equals('Summary Master TN'))
                    strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria+ '&searchLevel=2';
                else
                    strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria;
            
            }
            
            System.debug('**** strQuery ' + strQuery);
            lstSelectedUserHierarchy = Database.query(strQuery);
            
            //If Location Search
            if(strSearchCriteria=='Location'){

                    
            }       //end of Location Search
            
            //If Account Search
            if(strSearchCriteria=='Account'){
                
                //lstclsHirarchy = new List<clsHirarchy>();
                lstLocation = new List<String>();
                //lstLocation.add('Customer Name');
                //lstLocation.add('Summary Master');
                lstLocation.add('Customer');
                lstLocation.add('Accounts');

                objList= new List<clsNodes>();
                //Ge the unique Summary Master
                Set<String> setFirstLevel = new Set<String>();
                for(hierarchy__c objHirTemp:lstSelectedUserHierarchy){
                        if(objHirTemp.Summary_master_phone__c!=null && objHirTemp.Summary_master_phone__c!='')
                            setFirstLevel.add(objHirTemp.Summary_master_phone__c);
                        else{
                                System.debug('******* objHirTemp.BTN_Phone__c ' + objHirTemp.BTN_Phone__c + '   objHirTemp.Circuit_id__c ' +objHirTemp.Circuit_id__c );
                                if(objHirTemp.BTN_Phone__c!=null || objHirTemp.BTN_Phone__c!='')
                                        setFirstLevel.add(objHirTemp.BTN_Phone__c);
                                else if(objHirTemp.Circuit_id__c!=null || objHirTemp.Circuit_id__c!='')
                                        setFirstLevel.add(objHirTemp.Circuit_id__c);
                        }
                            //setFirstLevel.add(str_BLANK);                   //If summary phone is blank, then create an empty folder
                            System.debug('***** setFirstLevel ' + setFirstLevel);
                            setFirstLevel.remove(null);
                            System.debug('***** setFirstLevel12 ' + setFirstLevel);
                }
                //Loop through each and every phone and get btn phone and circuti ID
                for(String strUniqueSummary:setFirstLevel){
                        clsNodes objClsNodes = new clsNodes();
                        objClsNodes.strLevel2Name=strUniqueSummary;
                        set<String> setStrPhoneVal = new set<String>();
                        for(hierarchy__c objHirTemp2:lstSelectedUserHierarchy){
                                //Add to blank values       
                                if(objHirTemp2.Summary_master_phone__c==strUniqueSummary){
                                    setStrPhoneVal.add(objHirTemp2.BTN_Phone__c);
                                    setStrPhoneVal.add(objHirTemp2.Circuit_id__c);
                                }
                        }
                        objClsNodes.lstLevel2Labels=new List<String>(setStrPhoneVal);
                        //Add to Main List
                        objList.add(objClsNodes);
                }
            }
            System.debug('**** objList ' + objList);
            
            //For Tabs data
           //strSummaryViewURL = '/apex/SummaryPage?childValue='+ strSelectedPhone  +'&srcCriteria=' + strSearchCriteria+ '&custName=' + strSelectedName;
            
            //for Rendering
                    bolShowSearchResult=false;
                    bolShowTree=true;
                    bolShowSummaryView=true;
            //PrepareSummaryViewURL();
            
    }       //End of Account Search
    
    public PageReference redirectToOrderURL(){
        String orderURL = '/apex/Order?sfdc.tabName=01rL0000000Cnph&btnPhone='+strSelectedPhone;
        PageReference p = new PageReference(orderURL);
        return p;    
    }
    
    
    
}