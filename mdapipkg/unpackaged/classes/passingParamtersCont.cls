public class passingParamtersCont {

    public PageReference prepareURL() {
        SterlingQuoteItem__c objSQI = [select id, name from SterlingQuoteItem__c where id='a0OU0000007w3Hr'];
    
        PageReference pg = new PageReference('/id='+objSQI.id + '&name=' + objSQI.name);
        
        return pg;
    }

}