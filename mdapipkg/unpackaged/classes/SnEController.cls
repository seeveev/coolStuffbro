public class SnEController {
public boolean bolSelectAllCheckBox{get;set;} 
public List<PublicGroups> pubGrpList {get;set;}  
public List<SEcode__c> grpExpDel {get;set;}
 
    public SnEController(ApexPages.StandardController controller) {
        pubGrpList = new List<PublicGroups>();
        getSelectedGrps();
    }

    //Wrapper class to allow multi-select of Public Groups
    public class PublicGroups {
        public SEcode__c pubGrp{get; set;}
        public Boolean selected {get; set;}
     
        public PublicGroups(SEcode__c pbGr){
            pubGrp= pbGr;
            selected = false;
        }    
    }
    
    public List<PublicGroups> getSelectedGrps(){
    
        List<SEcode__c> lstGroupMemberRes = [SELECT id, Category__c, Description__c FROM SECode__c];
        for(SEcode__c grp: lstGroupMemberRes){
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
        grpExpDel = new List<SEcode__c>();
        grpExpDel.clear(); 
        for(PublicGroups pPubGr : pubGrpList){
                if(pPubGr.selected == true){
                    grpExpDel.add(pPubGr.pubGrp); 
                }
         } 
        //print the list name
        if(grpExpDel.size()>0){
            //print hte id value
            for(SEcode__c pPubGrID : grpExpDel){
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