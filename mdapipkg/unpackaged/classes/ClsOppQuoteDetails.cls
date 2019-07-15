global class ClsOppQuoteDetails {
    global class ClsOppQuoteID{
        public String strOppID    {get;set;}
        public List<Quote> lstQuoteID    {get;set;}
    }
    
    webService static ClsOppQuoteID oppDetails() {
        List<Opportunity> lstOpp= [Select id, name from Opportunity];
        
        List<Quote> lstQuote = [select id, name from Quote where OpportunityId=:lstOpp[0].id];
        
        ClsOppQuoteID objOppQ = new ClsOppQuoteID();
        objOppQ.strOppID = lstOpp[0].id;
        objOppQ.lstQuoteID = lstQuote;
        
        return objOppQ;
    }
}