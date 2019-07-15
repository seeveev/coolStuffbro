// -- classroom

public class MECHGROUP 
{
    public list<Testing__c> ph {get;set;} //variable declarion
    public string strVijay {get;set;}   // sd;lkflkjas;ldkfj23rioewrfrpeowjfdscx weeifojdskclnxm
    public Integer numbers {get;set;}
    public boolean conditions {get;set;} // true, false 
    
    public MECHGROUP() // Teacher --- constructor, first thing to execute when a class is called.. 
    {
        ph = phani(); // phani funtion return value is getting stored in ph
    }
    
    public String madhu()
    {
        string s = 'i am shooping';
        return s;
    }
    
   
    public list<Testing__c> Phani()
    {
		// soql query --- more than one 
		ph =[ select Name, CreatedById, createddate,Country__c from Testing__c ];
        return ph;
    }
    
}