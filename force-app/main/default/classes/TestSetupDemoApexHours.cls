@isTest

public with sharing class TestSetupDemoApexHours {
    
    @TestSetup
    static void makeData(){

        //create common test accounts

        List<Account> accList = new List<Account>();

        for (Integer i = 1; i<200; i++) //because one batch can have max of 200 records
        {
            Account acc = new Account (Name = 'testSetup Method Test Account - ' +i, phone='999-1110');
            accList.add(acc);
        }

        insert accList;        

    }

    @isTest
    static void testMethod1 ()
    {   
        //fetching the first account from the testSetup method above
        Account acc1 = [Select id from Account WHERE Name='testSetup Method Test Account - 1' LIMIT 1];

        //updating the Account
        acc1.Phone = '555-1212';

        //the below update is local to this method ONLY
        update acc1;

        //Delete the second account

        Account acc2 = [Select id from Account where Name = 'testSetup Method Test Account - 2' LIMIT 1];

        //this deletion is local to this method only
        delete acc2;

        //perform some testing
    }

    @isTest
    static void testMethod2()
    {
        //We will again query data that we have already queried in testMethod1

        // this will prove that modifications done to a record inside a testMethod is local to that testMethod only

        //the same data is available for other testMethods, unmodified
        
        //fetching the first account from the testSetup method above
        Account acc1 = [Select Phone from Account WHERE Name='testSetup Method Test Account - 1' LIMIT 1];


        //verifying that this record coming to this method is unaltered

        system.assertEquals ('999-1110', acc1.phone); 

        //get the second account
        Account acc2 = [Select id from Account where name = 'testSetup Method Test Account - 2' LIMIT 1];

        system.assertNotEquals(null, acc2);

    }


}