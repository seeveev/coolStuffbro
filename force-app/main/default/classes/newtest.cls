public class newtest {
    public Account newAccount { get; set; }
    
    public newtest(ApexPages.StandardController stdController)
    {
        newAccount = (Account)stdController.getRecord();
        system.debug('****** newAccount : '+newAccount.Name);
    }
    
    
    
}