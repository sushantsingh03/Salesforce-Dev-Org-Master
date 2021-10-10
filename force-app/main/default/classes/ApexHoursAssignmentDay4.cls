public with sharing class ApexHoursAssignmentDay4 {

    public static void insertAccount ()
    {
            Account acc = new Account ();
            acc.Name = 'ApexHoursAssignmentDay4';
            insert acc;

            Account accId = [SELECT id FROM Account WHERE Name='ApexHoursAssignmentDay4' LIMIT 1];


            List<Contact> conList = new List<Contact>();
            
            for (Integer i = 0; i < 5; i++)
            {
                Contact con = new Contact();
                con.firstName = 'ApexHoursAssignmentDay4 ';
                con.LastName = 'Contact - ' +i;
                con.AccountId=accId.id;
                conList.add(con);
            }

            insert conList;

    }
    
}