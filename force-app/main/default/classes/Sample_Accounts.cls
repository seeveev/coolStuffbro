public class Sample_Accounts {
    public list<Account> listName_Nandith{get;set;} 
    public String searchText{get;set;} // getting value from the UI, when user enters it.
   
    public Sample_Accounts(){
    //    listName_Nandith =[ select id, name,description from account];
      //  system.debug('**** listName_Nandith'+listName_Nandith);
    }
    
    // this is a method which is called when we click the button 
    public pageReference searchValue(){
		listName_Nandith = [Select id, Name from Account 
                           	Where Name =: searchText
                           ];
        return null;
    }
    
    
    
    // friend 1 
    public String friend1_methodName(){
        
        return null;
    }    
    
    // friend 2
    public list<Account> friend2(){
        
        return null;
    }
    
    
    
}