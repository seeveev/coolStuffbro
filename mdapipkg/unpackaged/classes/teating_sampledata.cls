public with sharing class teating_sampledata {

    public teating_sampledata() {

    }

    public list<Account> samplevalue{get;set;}
    
    public teating_sampledata(ApexPages.StandardSetController controller) {

    }
public list<account> getsamplevalue(){
  list<account> xyz =[select id, name from account limit 2];
  system.debug('************' +xyz);
  return xyz;
  
  
}


}