@isTest
public class AccountTriggerHandlerTest {
    
    @testSetup
    private static void testSetup()
    {
        List<Account> accList = new List<Account>();
        for (Integer i = 0;i<2;i++)
        {
            Account a = new Account();
            a.Name = 'TestAccount' + i;
            a.BillingCity = 'Varanasi';
            a.BillingCountry = 'India';
            if(i==0)
            {
                a.Match_Billing_Address__c = true;
            }
            
            accList.add(a);
        }
        
        insert accList;
    }
    
    @isTest
    private static void testHandlerMethod()
    {
        Account a = [Select id,name,BillingCity,BillingCountry,Match_Billing_Address__c from Account where name='Test1'];
        
        Test.startTest();
        a.Match_Billing_Address__c = true;
        update a;
        Test.stopTest();
        
        Account updatedAcc = [Select id,name,BillingCity,BillingCountry,Match_Billing_Address__c from Account where id =: a.Id ];
        system.assertEquals(a.BillingCity, updatedAcc.ShippingCity);
        
    }
    
}