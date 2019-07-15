public class hierarchy {
      public static List<hierarchy__c> lsthierarchy {get;set;}
    public String getLsthierarchy() {
     
     lsthierarchy = [select GAN__c from hierarchy__c];
    
    
        return null;
    }

}