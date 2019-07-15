public class pagingControllerForUser1  
{   
    public List<User> AllSearchUsers  {get;set;}
   /* public List<User> getAllSearchUsers() 
    {   
        //get   
        //{   
            if(con != null)   
                return (List<User>)con.getRecords();   
            else  
                return null ;   
        //}   
        //set;
     } */  
       
    public User usr {get; set;}   
       
    //Controller   
    public pagingControllerForUser1()   
    {   
        AllSearchUsers = new List<User>() ;   
        usr = new User() ;   
    }   
       
     public PageReference Search()   
    {      
        if(usr.Name != null)   
        {   
            con = new ApexPages.StandardSetController(Database.getQueryLocator([select Id , name , email , phone, Department from User where name = :usr.Name]));   
    
            // sets the number of records in each page set   
            con.setPageSize(5);   
        }   
        else  
        {   
            con = null;   
        }   
        return null ;   
    }   
       
    //Instantiate the StandardSetController   
    public ApexPages.StandardSetController con{get; set;}   
       
    //Boolean to check if there are more records after the present displaying records   
    public Boolean getHasNext()
    {   
        //get   
        //{   
            return con.getHasNext();   
       // }   
        //set;   
    }   
    
    //Boolean to check if there are more records before the present displaying records   
    public Boolean getHasPrevious()   
    {   
        //get   
        //{   
            return con.getHasPrevious();   
        //}   
       // set;   
    }   
    
    //Page number of the current displaying records   
    public Integer getPageNumber()   
    {   
        //get   
        //{   
            return con.getPageNumber();   
        //}   
        //set;   
    }   
  
    //Returns the previous page of records   
    public void previous()   
    {   
        con.previous();   
    }   
    
    //Returns the next page of records   
    public void next()   
    {   
        con.next();   
    }   
    //---------------------- Opportunities ----------------------
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, CloseDate FROM Opportunity]));
            }
            // sets the number of records in each page set   
            setCon.setPageSize(5);
            
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Opportunity> getOpportunities() {
        return (List<Opportunity>) setCon.getRecords();
    }
    //---------------------- Opportunities end ----------------------
    //---------------------- Account ----------------------
    public ApexPages.StandardSetController setAccoutCon {
        get {
            if(setAccoutCon== null) {
                setAccoutCon= new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, Phone FROM Account]));
            }
            // sets the number of records in each page set   
            setAccoutCon.setPageSize(5);
            
            return setAccoutCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Account> getAccounts() {
        return (List<Account>) setAccoutCon.getRecords();
    }
    //---------------------- Account end ----------------------
}