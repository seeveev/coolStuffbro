public class commandlink {
Public String myparam{get;set;}
public static String strhier = 'SELECT Account_id__c,billing_id__c,BTN_Phone__c,Circuit_Id__c,City__c,CLLI__c,Company_ID__c,Company_name__c,CreatedById,CreatedDate,GAN__c,Id,IsDeleted,LastModifiedById,LastModifiedDate,Level__c,Location_Id__c,Name,Name__c,OwnerId,Region__c,Service_Location__c,State__c,Summary_Id__c,Summary_master_phone__c,SystemModstamp,WTN_ID__c,WTN__c FROM hierarchy__c';
public List<hierarchy__c> lsthier{get; set;}
Public List<A_R_info__c> lstarinfo{get;set;}
public String strbutton { get; set; }
Public String strsearchtext {get; set;}
public boolean bolShowSearchResult          {get;set;}
public static A_R_info__c objarinfo{get;set;}
public String strSearchByValue{ get; set;}
public static String strSearchByStandardValues='Name,Billing Id,Telephone';
public String strQuery1;
public String msg  { get; set;}
    public String strCity       {get;set;}
    public String strState      {get;set;}


   public boolean bolCityState        {get;set;}
    public PageReference showCityState() {
        System.debug('from city state ' + strSearchByValue);
        if(strSearchByValue=='Name') 
            bolCityState = true;
        else
            bolCityState = false;
        
        bolShowSearchResult=false; //Hide the search result
     //   strColumnValue = '';//clean the existing value
     //   strFilterButtonName='Show Filter';      //set the default value
        
        //setHirar=null;        //For putting data into Pagination level
        /*if(strSearchByValue.equals('Company Name'))
            setHirar = new ApexPages.StandardSetController(new List<Account>());
        else
            setHirar = new ApexPages.StandardSetController(new List<hierarchy__c>());*/
                
                
        return null;
    }






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
    
     public PageReference newopp() {
      // PageReference secondPage = new PageReference ('/006/e?retURL=%2F001L0000006nVEq&accid=001L0000006nVEq&ent=Opportunity&opp3=chanti');
              PageReference secondPage = new PageReference ('/006/e?retURL=%2F{!Account.Id}&accid={!Account.Id}&ent=Opportunity&opp3={!Account.Name}');

        secondPage.setRedirect(true);        
        return secondPage; 
            }


    public PageReference strbutton() {
    
             bolShowSearchResult=true;    
        if(strSearchByValue==null || strSearchByValue==''){      
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select search by value'));
                    
                    return null;
            }
   if(strsearchtext==null || strsearchtext==''){      
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'Please Select search by'));
                    return null;
            }
   
    
  // String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + Strsearchtext + '%\'';
     //  lsthier= Database.query(strQuery);
                        System.debug('***** search value ' + strSearchByValue);

if(strSearchByValue.equals('Billing Id')){

  //strQuery = strHirarchyQuery + ' WHERE WTN__c LIKE \'%' + strColumnValue + '%\' OR WTN__c LIKE \'%' + strPhoneNumberOnly + '%\' ORDER BY Name__c ASC NULLS LAST LIMIT 49999';
      strQuery1 = strhier + ' WHERE billing_id__c LIKE \'%'+ Strsearchtext +'%\'' ;
        //String strQuery = 'Select Name__c, BTN_Phone__c from hierarchy__c where Name__c LIKE \'%' + Strsearchtext + '%\'';
        }else{
                if(strSearchByValue.equals('Name')){
      strQuery1 = strhier + ' WHERE Name__c LIKE \'%'+ Strsearchtext +'%\'' ;
        }
             else{
                if(strSearchByValue.equals('Telephone')){
      strQuery1 = strhier + ' WHERE BTN_Phone__c LIKE \'%'+ Strsearchtext +'%\'' ;
        }              
}
            }
            System.debug('***** query ' +strQuery1);

        if(strQuery1!=null)
            lsthier= Database.query(strQuery1);
                   System.debug('***** phone ' + Strsearchtext);
              if(lsthier.size()==0){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,' No Data Found'));

              return null;
      }
            objarinfo = new A_R_info__c();
            lstarinfo= [SELECT Account_Id__c,AdjC_LocalSvc__c,Adjustments__c,Balance__c,Billing_Number__c,Billing_Seq_No__c,Bill_Cycle__c,Bill_Date__c,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,Last_Pay_Date__c,Library_id__c,Name,Net_Bill__c,OwnerId,Payment__c,Phone_Number__c,Prior_Bill__c,P_P_O_C_C__c,Seq_No__c,SystemModstamp,Toll_Charges__c,Total_Taxes__c FROM A_R_info__c where Account_Id__c=:lsthier[0].Account_id__c];
       if(lstarinfo.size()>0)
          objarinfo=lstarinfo[0];
                return null;

}

public String method()
{
//assign value to that property
msg=' My message will be here ';
return msg;
}


  public PageReference searchSelectedUserData() {
     // List<hierarchy__c> Lsthier = [Select Name__c, BTN_Phone__c,billing_id__c from hierarchy__c Where id=: myparam];
// PageReference pageRef= new PageReference ('/006/e?retURL=%2F001U000000Ddgem&accid=001U000000Ddgem&ent=Opportunity&opp3=chanti');
//  PageReference pageRef= new PageReference ('/006/e?retURL=%2F{!Account.Id}&accid={!Account.Id}&ent=Opportunity&opp3={!Account.Name}');

PageReference pageRef = new PageReference('/apex/detailinfo1?detailID=' + Apexpages.currentPage().getParameters().get('myparam'));
                   System.debug('***** pageRef ' + pageRef);

        return pageRef;
    }

}