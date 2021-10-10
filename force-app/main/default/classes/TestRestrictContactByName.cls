@istest
public class TestRestrictContactByName {
    
    @isTest public static void testResult()
    {
    Contact con = new Contact(FirstName='Sushant',LastName='Invalidname');
    	Test.startTest();
        Database.SaveResult result = database.insert(con,false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+con.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
        
    }
    

}