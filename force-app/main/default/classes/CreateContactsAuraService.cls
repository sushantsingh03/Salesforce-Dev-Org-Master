public class CreateContactsAuraService {
    
    @AuraEnabled
    public static void saveContacts(List<Contact> contactList)
    {
        insert contactList;
    }

}