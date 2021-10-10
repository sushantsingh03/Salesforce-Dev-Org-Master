public class UpdateAccountsWithContacts 

{

    public static void updateAccount()
    {
        Set<Id> accId = new Set<Id>();
        List<Account> accList = new List<Account>();
        
        for (Contact c : [Select id,FirstName,LastName,AccountId from Contact where AccountId != NULL AND FirstName LIKE '%Sushant%'])
        {
            if (!accId.contains(c.AccountId))
            {
                Account a = new Account();
                a.Id = c.AccountId;
                a.Rating = 'HOT';
                a.Description = 'This is updated from class - UpdateAccountsWithContacts';
                accList.add(a);
                accId.add(c.AccountId);
            }
            
        }
        
        if (accList.size()>0 && !accList.isEmpty())
        {
            update accList;
        }
    }  
}