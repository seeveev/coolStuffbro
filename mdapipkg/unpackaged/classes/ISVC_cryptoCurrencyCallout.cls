public class ISVC_cryptoCurrencyCallout {
    public list<cryptoCurrency> cryptoResp{get;set;}
    
    public ISVC_cryptoCurrencyCallout(){
        cryptoResp =   createcryptoCurrency();
    }
    
    @AuraEnabled
    public static list<cryptoCurrency> createcryptoCurrency(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.coinmarketcap.com/v1/ticker/?limit=10');
        req.setHeader('Content-Type','application/json');
        req.setMethod('GET');
        list<cryptoResponse> cryptoRes = new list<cryptoResponse>();
        HttpResponse res;
        res = http.send(req);
        cryptoRes = (List<cryptoResponse>) System.JSON.deserialize(res.getBody(), List<cryptoResponse>.class);

        List<cryptoCurrency> cryptoCurrencys = new List<cryptoCurrency>();

        for(cryptoResponse c :cryptoRes){
            cryptoCurrency jr = new cryptoCurrency();
            jr.name = c.name;
            jr.id = c.id;
            jr.rank = c.rank;
            jr.price_usd = c.price_usd;
            jr.percent_change_1h = c.percent_change_1h ;
            cryptoCurrencys.add(jr);
        }
        return cryptoCurrencys;
    }
    
    public class cryptoCurrency {
        public String id{get;set;}
        public String name{get;set;}
        public String rank{get;set;}
        public String price_usd{get;set;}
        public String percent_change_1h{get;set;}
    }
}