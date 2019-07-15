public class mysearch {

    public List<Hierarchy__c> lsthir {get;set;}

    public LIST<hierarchy__c> getHierarchy1() {
         List<Hierarchy__c> lsthir = new List<hierarchy__c>();
                    lsthir =[Select Name__c,BTN_Phone__c from hierarchy__c  ];
        return null;
    }


    public String getBolShowSearchResult() {
        return null;
    }


//public static LIST<hierarchy__c> hierarchy() {get;set;}
     public LIST<hierarchy__c> getHierarchy() {
                    List<Hierarchy__c> lsthir = new List<hierarchy__c>();
                    lsthir =[Select Name__c,BTN_Phone__c from hierarchy__c  ];
    
        return lsthir ;
    }


    public String getRecords() {
    LIST<Account> result = new List<Account>();
             result =[Select name from Account];
                return null;

    }
    //public List<Hierarchy__c> lsthir = new List<hierarchy__c>();

    public PageReference hierarchyname() {
   // PageReference pageRef = new PageReference();
  //  List<Hierarchy__c> lsthir = new List<hierarchy__c>();
     lsthir =[Select Name__c,BTN_Phone__c from hierarchy__c];
    return null;
    }

    public PageReference currentpage() {
    PageReference pageRef = ApexPages.currentPage();

        return pageref;
    }


    public String getStrColumnValue() {
        return null;
    }

    public String getStrColumnValue {get;set;}
    public PageReference searchdata() {
        PageReference pageRef = new PageReference('https://c.na12.visual.force.com/apex/TreeViewDemo3?sfdc.tabName=01rU0000000DUIV');
    //  PageReference pageRef = ApexPages.currentPage().getParameters().get('Id')
      
     //  return [SELECT Id, Name FROM Account
       //         WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
        return pageref;
    }

}