public class EMP_Chatter_Controller { 
    
    public String GroupID {get;set;}
    public String GroupSearchText {get;set;}
    public List<ALL_ChatterUtility.FeedItemWrapper> retrieveAllFeeds {get;set;}
    
    public EMP_Chatter_Controller() { }
    
    public String ChatterGroupIdValue {
        get{
            return GroupID;
        }
        set {
            GroupID = value;
            retrieveAllFeeds = new List<ALL_ChatterUtility.FeedItemWrapper>();
            retrieveAllFeeds = ALL_ChatterUtility.retrieveAllPosts(GroupID);
        }
    }
    
    public PageReference groupFeedSearch() {
        retrieveAllFeeds = ALL_ChatterUtility.retrieveAllPosts(GroupID);
        
        system.debug('GroupID = ' + GroupID + ' and GroupSearchText = ' + GroupSearchText +'.');
        PageReference pr = new PageReference('/Employees/');
		
		return pr;
    }
}