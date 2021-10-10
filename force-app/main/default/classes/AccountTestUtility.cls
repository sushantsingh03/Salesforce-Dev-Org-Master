@isTest
public class AccountTestUtility 
{   
	//Testing getAllActiveMethod from AccountController class.    
    @isTest
    public static  void testGetAllActiveAccounts() 
    {
        List<Account> accList = AccountController.getAllActiveAccounts();
        Integer count = accList.size();
        system.assertEquals(10, count);
        
    }
    
    /* ----- Testing the insertAccountMethod for AccountHandler class -----*/
    
    @testSetup
    public static void createtestAccountData()
    {
        Account a = new Account();
        a.Name = 'Acme Inc 1';
        a.AccountNumber = 'A0001';
        insert a;
    }
    
    @istest
    public static void testInsertAccount()
    {
        //fetching the test data created using the testSetup method above
        Account a = [Select id,name,AccountNumber From Account where Name='Acme Inc 1' Limit 1];
        
        List<Account> acc = AccountHandler.insertAccount(1);
        Account ac = acc.get(0);
        system.assertEquals(a.Name, ac.Name);
        system.assertEquals(a.AccountNumber, ac.AccountNumber);
    }
    
    //testing the method of the AccountUtils class
    @isTest
    public static void testAccountsByState()
    {
        List<Account> acc = AccountUtils.accountsByState('UK');
        Integer size = acc.size();
        system.assertEquals(1, size);
    }
}