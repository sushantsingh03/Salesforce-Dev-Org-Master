@isTest
private class AccountTriggerTest {
    
    @isTest static void testAccountInsert()
    {
        List<Account> accts = new List<Account>();
        for (Integer i=0;i<200;i++)
        {
            Account acc = new Account (Name = 'Test' + i, BillingState ='CA');
            accts.add(acc);
        }
        
        Test.startTest();
        insert accts;
        Test.stopTest();
        
        //Verifying Test results
        List<Account> accs = [Select ShippingState from Account];
        for(Account a : accs)
        {
        System.assertEquals('CA', a.ShippingState);
        }
    }
    
    

}