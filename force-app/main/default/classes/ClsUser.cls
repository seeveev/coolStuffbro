public class ClsUser {
    public String strEmailID {get; set;}
    
    public ClsUser(ApexPages.StandardController controller) {

    }
    
    public void UpdateUserExternalID(){
        User usrInfo = [Select FirstName, LastName from User where Email=: strEmailID ];
        if(usrInfo!=null){
            usrInfo.NCSC_Eternal_ID__c = usrInfo.FirstName + ' ' + usrInfo.LastName;
            update usrInfo;
        }
    }

}