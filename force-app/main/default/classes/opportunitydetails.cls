public class opportunitydetails {
    public Opportunity objOpp    {get;set;}
    public boolean bolReadOnly    {get;set;}
    
    public opportunitydetails(ApexPages.StandardController controller) {
        objOpp = new Opportunity();
        bolReadOnly=false;
    }

}