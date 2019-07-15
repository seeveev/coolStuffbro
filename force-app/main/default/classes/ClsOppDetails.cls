global class ClsOppDetails {
    
    webService static List<Opportunity> oppDetails(String oppID) {
        List<Opportunity> lstOpp;
        lstOpp= [Select id, name from Opportunity where id=:oppID];
        return lstOpp;
    }
}