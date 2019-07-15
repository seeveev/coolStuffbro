public class Phani {

}
/* ***************************************
* 10/22/2017 created phanieshwar.kondagadapa@highmark.com
**************************************** */
/*public class CreateChildCase_Handler {
    public static void createChildCase(list<case> cases){
        // To get all the records with PO.
        list<case> parentCases =[Select id, Purchase_Order__c from case 
                                 where Purchase_Order__c != null];
        list<case> updateCases = new list<case>();
        if(parentCases.size()>0){
            for(case cs : cases){
                for(case parentCase :parentCases){
                    if(cs.Purchase_Order__c == parentCase.Purchase_Order__c){
                        cs.ParentId = parentCase.Id;
                    }
                }               
            }
        }
    }
}*/