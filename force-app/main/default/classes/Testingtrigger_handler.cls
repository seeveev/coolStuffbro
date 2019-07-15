public class Testingtrigger_handler
{ // helper or handler
    
    public static void beforeinsertlogic(list<Testing__c> testingrecords) // masala
    {
        for(Testing__c test: testingrecords)
        {
            if(test.OS_Type__c == 'apple mouse')
            {
                test.country__c = 'USA'; 
            }
        }
    }
    
    public static void beforeupdatelogic(list<Testing__c> testingrecords) //salt
    {
        
    }
        
    public static void afterinsertlogic(list<Testing__c> testingrecords)//chilli powder
    {
        
    }   
    public static void afterupdatelogic(list<Testing__c> testingrecords) // garlic paste
    {
        
    }
}