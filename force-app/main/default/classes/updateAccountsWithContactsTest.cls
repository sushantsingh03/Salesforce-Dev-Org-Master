@isTest
public class updateAccountsWithContactsTest {
    
    @isTest
    private static void testUpdateAccount()
    {
        Account acc = new Account ();
        acc.Name = 'Test Account';
        acc.Rating = '';
        acc.Description = '';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Sushant';
        con.LastName = 'TestSingh';
        con.AccountId = acc.Id;
        insert con;
        
        UpdateAccountsWithContacts.updateAccount();
        
        Account updatedAcc = [Select id,name,Rating,Description from Account where id =: acc.Id];
        system.assertEquals('Hot', updatedAcc.Rating);
        system.assertEquals('This is updated from class - UpdateAccountsWithContacts', updatedAcc.Description);
    }

}