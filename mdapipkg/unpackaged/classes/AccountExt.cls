public class AccountExt {

    public AccountExt(ApexPages.StandardController controller) {
        acc = (Account) controller.getRecord();
        }
    private final Account acc;
    public list<Contact> getAllContacts(){ 
        Set<id> AccountIds = new set<ID>();
        AccountIds.add(acc.Id);
        for(integer i=0;i<5;i++){
            for(Account a: [select Id from Account where ParentId in :AccountIds])
            AccountIds.add(a.Id);
        }
        return [select FirstName, LastName, Title, Account.Name, Phone, Email from Contact where AccountId in :AccountIds  ];
        } 
}