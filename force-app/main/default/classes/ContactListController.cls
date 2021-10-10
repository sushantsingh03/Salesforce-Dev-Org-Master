public class ContactListController {
    
    @AuraEnabled
    public static List<Contact> getContactList (String accountId)
    {
        List<Contact> conList = new List<Contact>([Select Id, firstName, lastName, name, email, phone from Contact where Email != null AND AccountId =: accountId]); 
        return conlist;
        
    }
    
    @AuraEnabled
    public static Contact createContact (Contact con, Id AccountId)
    {
        con.AccountId = AccountId;
        insert con;
        return con;
    }

}