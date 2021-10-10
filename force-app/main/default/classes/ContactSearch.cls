public class ContactSearch {
    
    public static List<Contact> searchForContacts (String lastName, String postalcode )
    {
        List<Contact> con1 = new List<Contact>();
        for (Contact[] conn : [Select id,name from Contact where lastName = :lastname and MailingPostalCode = :postalcode])
        {
            con1.add(conn[0]);
        }
        return con1;
    }

}