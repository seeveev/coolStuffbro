public class treenodes {
    
  /*      public treenodes(){
                getListValues();
        }
    

    public class LocationNode{
        public String strLocationName    {get;set;}
    }

    Public List<LocationNode> getLocationNodes(){
        //Create List of Object of wrapper class
        List<LocationNode> lstLocationNode = new List<LocationNode>();
        List<hierarchy__c> lstHierarchy = [select Company_name__c from hierarchy__c ];
        //Loop through all the locations
        for(hierarchy__c objLocation:lstHierarchy ){
            LocationNode obLocNode = new LocationNode();
            obLocNode.strLocationName = objLocation.Company_name__c;
            lstLocationNode.add(obLocNode);
        }
        return lstLocationNode;
    }
    

    public class cNodes{
         public List<Contact> parent {get; set;}
         Public Account gparent {get;set;}
        
         public cNodes(Account  gp, List<Contact> p){
             parent = p;
             gparent = gp;
         }
    }

    
    Public List<cNodes> hierarchy;
    
    Public List<cNodes> getmainnodes(){
        hierarchy = new List<cNodes>();
        List<account> tempparent = [select id, name from account];
        for (Integer i =0; i< tempparent.size() ; i++){
            List<Contact> tempchildren = [Select Id,FirstName,LastName,(Select Id,CaseNumber,Subject from Cases) from Contact where AccountId = :tempparent[i].Id];
            hierarchy.add(new cNodes(tempparent[i],tempchildren));
         }   
        return hierarchy;
    }  
     
    public List<List<String>> objListValues         {get;set;}
    public List<clsNodes> lstNodes        {get;set;}
    
    public class clsNodes{
        public String strName   {get;set;}
        public List<String> lstLevel1     {get;set;}
    }
    
    public List<String> lstLev2           {get;set;}
    public String strVal1               {get;set;}
    public List<String> getTreeInfo(){
        String intlevel = Apexpages.currentPage().getParameters().get('contIdParam');
        System.debug('***** intlevel '  +intlevel + strVal1);
        if(intlevel=='1'){
                List<String> lstValues = new List<String>();
                lstValues.add('Suraj');
                lstValues.add('Yadav');
                return lstValues;
        }
        return null;
    }
    
    
    public void getListValues(){
        lstNodes = new List<clsNodes>();
        clsNodes objClsNodes = new clsNodes();
        objClsNodes.strName='Suraj';

        //for(String strVal:lstNodes){
                List<String> objLevel1 = new List<String>();
                objLevel1.add('Suraj1');
                objLevel1.add('Yadav1');
                objClsNodes.lstLevel1=objLevel1;
        //}
        
        lstNodes.add(objClsNodes);
        
    }*/
}