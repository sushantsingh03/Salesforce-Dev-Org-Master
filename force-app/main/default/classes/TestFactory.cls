public with sharing class TestFactory {
    
    public static List<Account> createTestAccounts (Integer numberOfAccounts, Boolean performDML)
    {
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i<numberOfAccounts; i++)
        {
            Account a = new Account();
            a.Name = 'TestFactory' +i;
            a.BillingCountry = 'India';
            a.Match_Billing_Address__c = false;
            accList.add(a);
        }
        
        if(performDML)
        {
            insert accList;
        }
        
        return accList;
    }
    
    public static List<Contact> createTestContacts (Integer numberOfContacts, Boolean performDML, Id accountId)
    {
        List<Contact> conList = new List<Contact>();
        for(Integer i = 0; i<numberOfContacts; i++)
        {
            Contact con = new Contact();
            con.AccountId = accountId;
            con.FirstName = 'Sushant';
            con.LastName='Singh';
            con.Email = 'sushantsingh.0340@gmail.com';
            conList.add(con);
        }
        
        if(performDML)
        {
            insert conList;
        }
        
        return conList;
    } 
}