@isTest (seeAllData='true')
public class EMP_Search_ControllerTest {
	public static testMethod void EMP_Search_ControllerTest () {
		
		/*List<FeedItem> results = new List<FeedItem>();
		List<FeedComment> resultscomment = new List<FeedComment>();
		List<CollaborationGroup> Groups = new List<CollaborationGroup>();
		Id [] fixedSearchResults= new Id[1];
		fixedSearchResults[0] = '001x0000003G89h';
		Test.setFixedSearchResults(fixedSearchResults);
		List<List<SObject>> searchList = [FIND 'test' IN ALL FIELDS RETURNING FeedItem(id,title)];*/
		
		
		
		
		//Create account
		Account portalAccount = new Account(Name = 'TestAccount');
		insert(portalAccount);

		//Create contact
		Contact portalContact = new Contact(FirstName = 'Test', Lastname = 'con', AccountId = portalAccount.Id, Email = 'con@vicky.com');
		insert(portalContact);
		 
		//Create communityUser
  Profile portalProfile = [SELECT Id FROM Profile where Name = 'Customer Community User' Limit 1];
   
  User communityUser = new User(
        Username = System.now().millisecond() + 'test12345@test.com',
        ContactId = portalContact.Id,
        ProfileId = portalProfile.Id,
        Alias = 'test1234',
        Email = 'test12345@vicky.com',
        EmailEncodingKey = 'UTF-8',
        LastName = 'ltest',
        CommunityNickname = 'test12345',
        TimeZoneSidKey = 'America/Los_Angeles',
        LocaleSidKey = 'en_US',
        LanguageLocaleKey = 'en_US'
    );
  insert(communityUser);
		
		NetworkMember membership = [SELECT networkID, memberID FROM NetworkMember  WHERE memberID = :communityUser.id];
		System.debug('@Developer --> membership:' + membership);
			
			CollaborationGroup oCG = new CollaborationGroup(
			Name = 'testGroup',	//Group name must be unique
			CanHaveGuests = false,
			IsArchived = false,
			IsAutoArchiveDisabled = false,
			NetworkId = membership.networkID,
		 CollaborationType = 'public'
		 
		);
		insert oCG;
		System.debug('@Developer --> oCG:' + oCG);
		
		FeedItem oFI = new FeedItem();
			oFI.ParentId = oCG.Id;
			oFI.Title = 'test';
			oFI.Body = 'test body';
			oFI.Type = 'TextPost';
			insert oFI;
			System.debug('@Developer --> oFI :' + oFI );
		
		
		FeedComment oFC = new FeedComment();
		oFC.CommentBody = 'legal test';
		oFC.FeedItemId = oFI.Id;
		insert oFC;
	 System.debug('@Developer --> oFC :' + oFC );
			
		system.runAs(communityUser){
		 test.startTest();
		 System.debug('@Developer --> Network.getNetworkId():' + Network.getNetworkId());
			 ApexPages.currentPage().getParameters().put('str','test');
			 EMP_Search_Controller cont = new EMP_Search_Controller();
		 test.stopTest();
		}
	
	 
	 
	 /**************
	 test.startTest();
		 ApexPages.currentPage().getParameters().put('str','hello');
		 EMP_Search_Controller cont = new EMP_Search_Controller();
	 test.stopTest();
	 ******************/
	}
	
}