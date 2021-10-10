/* This annotation is to mark this class as a test class */
@isTest  
                                           
public with sharing class ApexHoursUnitTests {

    //Test method Creating an account with all the required fields

    @isTest
    static void accountTest()
    {
        Account acc = new Account (Name = 'Test 1');
        insert acc;
    }

    //Test method to create an account and related contact record

    @isTest
    static void contactTest()
    {
        Account acc = new Account (Name = 'Test 2');
        insert acc;

        Contact con = new Contact (LastName = 'TestContact Test 2', AccountId = acc.id);
        insert con;
    }

    @isTest
    static void opportunityTest()
    {
        Account acc = new Account(Name = 'Test 3');
        insert acc;

        Opportunity opp = new Opportunity (Name = 'TestOpportunity Test 3', AccountId = acc.id, CloseDate= Date.newInstance(2021, 12, 12), StageName = 'Closed Won');
        insert opp;
    }
    
}