public class opportunitypage {
public static opportunity objOpp{get;set;}
LIST <Opportunity> lstOpp = [SELECT AccountId,id,name FROM Opportunity where id='006U000000Dm49K'];
 
    public opportunitypage(ApexPages.StandardController controller) {

 
 
    }

}