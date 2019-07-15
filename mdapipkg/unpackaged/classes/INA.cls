public class INA {
        public String str {get;set;} //VJ

    public INA(ApexPages.StandardController controller) {
        str = apexpages.currentpage().getparameters().get('id');
    }
public pagereference INA(){

return null;
}
}