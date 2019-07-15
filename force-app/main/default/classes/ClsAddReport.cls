public class ClsAddReport {
    public String strAuthor{get;set;}
    public String strDivision{get;set;}
    public custom__c cusRecord;
    public boolean bolShowExisRecod{get;set;}
    public boolean bolSave{get;set;}
    
    public ClsAddReport(ApexPages.StandardController controller) {
        strAuthor = UserInfo.getName();    //Get Uthoer Name
        userdivision__c ObjDiv = [Select u.username__c, u.division__c From userdivision__c u where u.username__c=:UserInfo.getUserId()];
        strDivision=ObjDiv.division__c;
        bolShowExisRecod = true; //Display existing Records
    }
    
    //This will save the record
    public PageReference saveRecord(){
       
        insert cusRecord;    //Insert a new record
        
        bolShowExisRecod = true;
        bolSave = false;
        
        return null;
    }
    
    //This will open a new window to record
    public PageReference NewRecord(){
       bolShowExisRecod = false;
       bolSave = true;
        
        return null;
    }
    //Cancels the window
    public PageReference cancel(){
      bolShowExisRecod = true;
        bolSave = false;
        
        return null;
    }
    public custom__c getCustomRecod(){
        if(cusRecord==null)
            cusRecord = new custom__c();
       
        cusRecord.date__c = System.today();
        return cusRecord;
    }
    
    public List<custom__c> getAllRecord(){
        return [Select c.Notes__c, c.date__c, c.category__c, c.author__c, c.Name, c.Division__c, c.DivisionHide__c, c.CreatedDate From custom__c c where c.OwnerId=:UserInfo.getUserId()];
    }

}