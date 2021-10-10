public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts (Integer numOfContacts, String lastName)
    {
        List<Contact> conlist = new List<Contact>();
        for(integer i=0;i<numOfContacts;i++)
        {
            conlist.add(new Contact (FirstName = 'Test '+i, lastname = lastName));
        }
        return conlist;
    }

}