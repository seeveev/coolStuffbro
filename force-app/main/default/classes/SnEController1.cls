public class SnEController1 {
public boolean bolSelectAllCheckBox{get;set;} 
public List<PublicGroups> pubGrpList {get;set;}  
public List<Opportunity> grpExpDel {get;set;}
 
    public SnEController1(ApexPages.StandardController controller) {
        pubGrpList = new List<PublicGroups>();
        getSelectedGrps();
    }

    //Wrapper class to allow multi-select of Public Groups
    public class PublicGroups {
        public Opportunity pubGrp{get; set;}
        public Boolean selected {get; set;}
     
        public PublicGroups(Opportunity pbGr){
            pubGrp= pbGr;
            selected = false;
        }    
    }
    
    public List<PublicGroups> getSelectedGrps(){
    
        List<Opportunity> lstGroupMemberRes = [SELECT account.name,LeadSource,Name,StageName FROM Opportunity];
        for(Opportunity grp: lstGroupMemberRes){
            pubGrpList.add(new PublicGroups(grp));
        }

        return pubGrpList;
    }
    
    public String getOut_sne_check() {
        return checked  ; //sne_check.id ;
    }


    public String checked { get; set; }
    
    public SEcode__c sne_check = new SEcode__c(); 
    
    public PageReference CheckOne() {
        
      //  if (checked != NULL){
       //     sne_check = [SELECT Id FROM SEcode__c WHERE Id = :checked ];
            
    //    }
   //     else{
     //       checked = 'Hello';
     //   }
        return null;
    }




    public List<SEcode__c> new_sne_list;
    
    public PageReference Cancel() {
        return null;
    }


    public PageReference Select_SnE() {
        grpExpDel = new List<Opportunity>();
        grpExpDel.clear(); 
        for(PublicGroups pPubGr : pubGrpList){
                if(pPubGr.selected == true){
                    grpExpDel.add(pPubGr.pubGrp); 
                }
         } 
        //print the list name
        if(grpExpDel.size()>0){
            //print hte id value
            for(Opportunity pPubGrID : grpExpDel){
                System.debug('******** pPubGrID ' + pPubGrID.id);
                
            } 

        }
        
        return null;
    }  
    
    public List<SEcode__c> getSnEList() {
        List<SEcode__c> sne_list = new List<SEcode__c>([SELECT id, Category__c, Description__c
                                                            FROM SECode__c]);
        return sne_list ;
    }
}