public class ClsCustomV3 {
    Integer intLoop;
    public String authorVal {get; set;}
    public String categoryVal {get; set;}
    public String divisionVal {get; set;}
    public String strLikeString;
    
    public String keyVal {get; set;}
    public String strQuery;
    public String strKeySearch{get; set;}
    public String strKeyCompare;
    public boolean bolDisplaySaveButt{get; set;}
    public boolean bolShowAuthor{get;set;}
    public boolean bolErrorMsg{get;set;}
    public String strShowCategory{get;set;}
    public String strDivOnReport{get;set;}
    public Date fDt{get; set;}
    public Date tDt{get; set;}
    public set<String> setCat{get;set;}
    public List <String> lstTitle{get;set;}
    public List<List<custom__c>> lstOut;
        public List<List<custom__c>> lstFinalOut;
        public boolean bolShowDivision{get;set;}
        public Integer intVal{get;set;}
     public string pass_param{get;set;}
     public String strDivision{get;set;}
     
    //Account account;
    public ClsCustomV3(ApexPages.StandardController controller) { 
        
        //Check the profile Name
        id id1 = userinfo.getProfileId();
                Profile UsPr = [select Name from profile where id = :id1];
        if(UsPr.Name=='System Administrator')   //Show button
                bolShowDivision=true;
        
        bolShowAuthor= true;
        intVal = 0;
        //bolErrorMsg=true;
    }
    
    List<custom__c> custom;
    List<custom__c> customResult;
    custom__c fromDate;
    custom__c toDate;

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
    
    public List<List<custom__c>> getCusList(){
		return null;//getCusListFilter('test');
    }
    public List<List<custom__c>> getCusListFinAndBuss(){
		return null;//getCusListFilter('Financial and Business Solutions(FABS)');
    }
    String strDivisionDivi;
    public List<List<custom__c>> getCusListFilter(){
                lstOut = new List<List<custom__c>>();
                lstFinalOut = new List<List<custom__c>>();
                
                Integer intTitle=0;
                
                //List<custom__c> lstCus = new List<custom__c>();
                if(custom== null) custom= [Select c.Notes__c From custom__c c where c.author__c='abc' limit 10];
                
        //System.debug('****************' + authorVal + '    ' + categoryVal);
        //System.debug('****************' + fromDate.date__c);
        System.debug('**************** strDivisionDivi ' + strDivisionDivi);
        if(authorVal!= null && categoryVal!=null)
        {
            fDt = date.valueOf(fromDate.date__c);//  2011-10-14 00:00:00;
            tDt = date.valueOf(toDate.date__c);//2011-10-14 00:00:00;
            //System.debug('****************' + authorVal + '     ' + authorVal.length());
            
           // showMsg();
           //Get the current user Division to populate on report
           userdivision__c objDivName = [Select u.username__c, u.division__c, u.Name From userdivision__c u where u.username__c=: Userinfo.getUserId() limit 1];
           if(objDivName!=null)
                strDivOnReport = objDivName.division__c;
           else
                strDivOnReport = 'No Division Availabe';
           
           
           //System.debug('**************** divisionVal1 ' + divisionVal);
           if(divisionVal==null)    //apply if null
                divisionVal ='-- Select One --';
           //System.debug('**************** divisionVal2 ' + divisionVal);
                
            if(!divisionVal.equals('-- Select One --')) 
            	strLikeString= divisionVal + '%';
            else
            	strLikeString = strDivisionDivi + '%';
            
            
            
            //System.debug('**** strLikeString ' + strLikeString);
            if(bolDisplaySaveButt==true) authorVal = Userinfo.getUserId();    //if Edit button is cicked
            
           if(bolShowDivision==true && !divisionVal.equals('-- Select One --')){
                        //custom__c objGetDivision= [Select c.Division__c, c.Notes__c, c.category__c From custom__c c where c.Division__c Like :strLikeString limit 1 ];
                        userdivision__c usrdiv = [Select u.division__c From userdivision__c u where division__c<>null and division__c Like :strLikeString limit 1];
                        strDivOnReport=usrdiv.Division__c;
           }
           
            
            //check the valiation fields
            if(authorVal.equals('-- Select One --') && categoryVal.equals('-- Select One --')){

                //Get the list of Categories
                List<custom__c> lstCategory = [Select c.category__c From custom__c c];
                setCat = new set<String>();
                //Read all the values and age the unique values
                for(custom__c objUnVal:lstCategory){
                        setCat.add(objUnVal.category__c);
                }
                lstTitle=new String[setCat.size()];
                //System.debug('**** setCat ' + setCat.size());
                for(String setVal:setCat){
                        //Check the division field 
                        if(divisionVal.equals('-- Select One --'))
                                custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:setVal and (c.date__c >=:fDt and c.date__c<=:tDt) ];
                        else
                                custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:setVal and (c.date__c >=:fDt and c.date__c<=:tDt) and c.Division__c Like :strLikeString ];
                        
                        lstOut.add(custom);
                        lstTitle.set(intTitle,setVal);  //Adding Column Title
                        //System.debug('**** lstTitle ' +intTitle + '     ' + setVal );
                        intTitle++;
                }
                System.debug('**** strLikeString ' + strLikeString);
                System.debug('**************** 1' );
            }else if(authorVal.equals('-- Select One --')){
                //Check the division field 
                if(divisionVal.equals('-- Select One --'))
                        custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:categoryVal and (c.date__c >=:fDt and c.date__c<=:tDt) ];
                else
                        custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:categoryVal and (c.date__c >=:fDt and c.date__c<=:tDt) and c.Division__c Like :strLikeString  ];
                        
                lstOut.add(custom);
                System.debug('**************** 2' );
            }else if(categoryVal.equals('-- Select One --')){
                //Get the list of Categories
                List<custom__c> lstCategory = [Select c.category__c From custom__c c];
                setCat = new set<String>();
                //Read all the values and age the unique values
                for(custom__c objUnVal:lstCategory){
                        setCat.add(objUnVal.category__c);
                }
                lstTitle=new String[setCat.size()];
                //System.debug('**** setCat ' + setCat.size());
                for(String setVal:setCat){
                        //Check the division field 
                        if(divisionVal.equals('-- Select One --'))
                                custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:setVal and c.OwnerId=:authorVal and (c.date__c >=:fDt and c.date__c<=:tDt) ];
                        else
                                custom= [Select c.Notes__c, c.category__c From custom__c c where c.category__c=:setVal and c.OwnerId=:authorVal and (c.date__c >=:fDt and c.date__c<=:tDt) and c.Division__c Like :strLikeString  ];
                        
                        lstOut.add(custom);
                        lstTitle.set(intTitle,setVal);  //Adding Column Title
                        //System.debug('**** lstTitle ' +intTitle + '     ' + setVal );
                        intTitle++;
                }
                System.debug('**************** 3' );
            }else if(authorVal.length()>0){
                //Check the division field 
                if(divisionVal.equals('-- Select One --'))
                        custom= [Select c.Notes__c, c.category__c From custom__c c where c.OwnerId=:authorVal and c.category__c=:categoryVal and (c.date__c >=:fDt and c.date__c<=:tDt) ];
                else
                        custom= [Select c.Notes__c, c.category__c From custom__c c where c.OwnerId=:authorVal and c.category__c=:categoryVal and (c.date__c >=:fDt and c.date__c<=:tDt) and c.Division__c Like :strLikeString  ];
                
                lstOut.add(custom);
                System.debug('**************** 4' );
            }

            //Apply Key search Filter criteria
            if(strKeySearch<>null && strKeySearch<>''){
                //Loop through all the record
                for(List<custom__c> objTemp: lstOut ){
                        List<custom__c> customResult = new List<custom__c>();
                        //customResult = objTemp;
                        //System.debug('**************** strKeySearch ' + strKeySearch );
                        for(custom__c CusRes : objTemp){
                            strKeyCompare = CusRes.Notes__c;
                            if(strKeyCompare<>null && strKeyCompare<>'')    //compate notes
                            {
                                //System.debug('**************** strKeyCompare ' + strKeyCompare );
                                if(strKeyCompare.contains(strKeySearch)){
                                    //System.debug('**************** strKeyCompare IN ');
                                    customResult.add(CusRes);
                                }
                            }
                        }
                        lstFinalOut.add(customResult);
                }
            }else{
                //If no filtr criteria
                lstFinalOut = lstOut;
            }
        }
        return lstFinalOut;
    }

    public PageReference save() {
            //update custom;
            for(List<custom__c> objTemp: lstFinalOut ){
             update objTemp;
            }
            bolDisplaySaveButt=false;    //hide button
            bolShowAuthor= true;
            return null;
      }
    public List<SelectOption> getAuthor() {

                List<SelectOption> options = new List<SelectOption>();
                options.add(new SelectOption('-- Select One --', '-- Select One --'));
                
                Set<String> uniqueCustomObjectSet = new Set<String>();
                //for(custom__c sl:[Select c.author__c From custom__c c]){
                for(custom__c sl:[Select c.OwnerId From custom__c c]){
                        uniqueCustomObjectSet.add(sl.OwnerId);
                }
                
                List<String> uniqueCustomObjectList = new List<String>(uniqueCustomObjectSet);
                
                for(integer i=0; i<uniqueCustomObjectList.size(); i++){
                        User objUser = [Select u.LastName, u.Id, u.FirstName From User u where u.id=:uniqueCustomObjectList[i]];
                        options.add(new SelectOption(objUser.id, objUser.FirstName + ' ' + objUser.LastName));
                       // System.debug('*** ' + objUser.FirstName + ' ' + objUser.LastName + ' ' + objUser.id);
                }
                 /*for(integer i=0; i<uniqueCustomObjectList.size(); i++){
                        User objUser = [Select u.LastName, u.Id, u.FirstName From User u where u.id=:uniqueCustomObjectList[i]]
                        options.add(new SelectOption(uniqueCustomObjectList[i],uniqueCustomObjectList[i]));
                }*/
        
        return options;
        
        }
        public List<SelectOption> getCategory() {

                List<SelectOption> options = new List<SelectOption>();
                options.add(new SelectOption('-- Select One --', '-- Select One --'));
                
                Set<String> uniqueCustomObjectSet = new Set<String>(); 
                for(custom__c sl:[Select c.category__c From custom__c c]){
                        uniqueCustomObjectSet.add(sl.category__c);
                }
                List<String> uniqueCustomObjectList = new List<String>(uniqueCustomObjectSet);
                
                for(integer i=0; i<uniqueCustomObjectList.size(); i++){
                        options.add(new SelectOption(uniqueCustomObjectList[i],uniqueCustomObjectList[i]));
                }
        
                return options;
        
        }
        //This method will get the unique divisions for DropDownValue on VF Search page
        public List<SelectOption> getDivision() {
                                String strDivisionVal;
                                List<String> strDiv = new List<String>();
                                
                List<SelectOption> options = new List<SelectOption>();
                options.add(new SelectOption('-- Select One --', '-- Select One --'));
                
                Set<String> uniqueCustomObjectSet = new Set<String>();
                
                //Get all divisions from Users
                        //List<User> usr = [Select u.Division From User u where Division<>null];
                        List<userdivision__c> usr = [Select u.division__c From userdivision__c u where division__c<>null];
                        for(userdivision__c usrDiv: usr){
                                strDivisionVal = usrDiv.division__c;
                                //Split the string with ',' value
                                strDiv = strDivisionVal.split(',',2);
                                uniqueCustomObjectSet.add(strDiv[0]);
                                //System.debug('**** strDiv ' + strDiv[0]);
                        }
                        
                        
                List<String> uniqueCustomObjectList = new List<String>(uniqueCustomObjectSet);
                
                for(integer i=0; i<uniqueCustomObjectList.size(); i++){
                        options.add(new SelectOption(uniqueCustomObjectList[i], uniqueCustomObjectList[i]));
                }
            
                return options;
        }
        
        //This method will get the unique divisions to display on VF Search page
        public List<String> getDivisionListValue() {
                String strDivisionVal;
                List<String> strDiv = new List<String>();
                                
                Set<String> uniqueCustomObjectSet = new Set<String>();

                List<userdivision__c> usr = [Select u.division__c From userdivision__c u where division__c<>null];
                for(userdivision__c usrDiv: usr){
                        strDivisionVal = usrDiv.division__c;
                        uniqueCustomObjectSet.add(strDivisionVal);
                }
                        
                List<String> uniqueCustomObjectList = new List<String>(uniqueCustomObjectSet);

                return uniqueCustomObjectList;
        }
        
    public PageReference download() {
        return Page.CusSearchPageDownloadV1;
    }
    
   public void showMsg() {
        if(fdt>tdt)
             bolErrorMsg=true;
        else
             bolErrorMsg=false;
    }
    
    //this functino will work when user click on edit button
    public void editVal(){
        bolDisplaySaveButt=true;
         bolShowAuthor= false;
    }
}