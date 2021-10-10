@isTest
public class TestSetupUtilityClass {
    
    @TestSetup
    private static void setup ()
    {
        List<Account> accList = new List<Account>();
        
        for (Integer i = 0;i<2;i++)
        {
            Account a = new Account();
            a.Name = 'Test' + i;
            a.Rating = 'Warm';
            a.BillingPostalCode = '221010';
            a.Match_Billing_Address__c = true;
            accList.add(a);
        }
        
        insert accList;
        
        Opportunity opp = new Opportunity();
        opp.AccountId = accList.get(0).id;
        opp.Name = 'Testing Oppty Deletion';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        insert opp;
    }
    
    @isTest
    private static void testmethod1()
    {
        Account a = [Select id,Name,Phone,Rating from Account where Name='Test0'];
        a.Phone = '123454667';
        a.Rating = 'Hot';
        update a;
    }
    
    @isTest
    private static void testMethod2()
    {
        Account a = [Select id,name,Rating from Account where Name='Test1'];
        system.assertEquals(a.BillingPostalCode, a.ShippingPostalCode);
    }
    
    @isTest
    private static void testMethod3()
    {
        Opportunity opp = [Select id,AccountId,Name from Opportunity where Name='Testing Oppty Deletion'];
        Id accIid = opp.AccountId;
        Account acc = [Select id, name from Account where id = :accIid ];
        test.startTest();
        try
        {
            delete acc;
        }
       
        
        catch(Exception e)
        {
            system.assert(e.getMessage().contains('Cannot delete account with related opportunities. Please contact your administrator.'));
        } 
        test.stopTest();
    }
}