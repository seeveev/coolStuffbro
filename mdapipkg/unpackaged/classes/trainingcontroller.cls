public class trainingcontroller {
    public list<opportunity> getsection(){
    List<Opportunity> Opp =[select id from Opportunity];
    
    return Opp;
    }


    public trainingcontroller(ApexPages.StandardController controller) {

    }

}