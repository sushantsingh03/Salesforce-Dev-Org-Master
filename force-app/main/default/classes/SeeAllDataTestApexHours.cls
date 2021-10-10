@isTest
public with sharing class SeeAllDataTestApexHours {

    /*
    Create common test data which is required for all test classes
    */

    @isTest (seeAllData = true)
    static void accountTest()
    {
        List<Account> accList = [Select Id,Name,Phone from Account Limit 15];
        system.assertEquals(15, accList.size(), 'There are accounts being fetched from the Salesforce Database');
    }

    @isTest
    static void contactTest()
    {
        Account acc = new Account (Name = 'SeeAllData Test 2', Phone = '333-1212');
        insert acc;

        /*Contact con = new Contact (LastName = 'TestContact Test 2', AccountId = acc.id);
        insert con;*/

        List<Contact> conList = [Select id,name,email,phone from Contact LIMIT 1];
        system.assertEquals(1, conList.size(), 'There are no contacts available in database');
    }
    
    @isTest
    static void loadData()
    {
        List<Account> sObjectList = test.loadData(Account.sobjectType, 'testAccounts');
        Account acc = sObjectList.get(0);
        system.debug(acc);
        system.assertEquals(3, sObjectList.size());
    }
    
}