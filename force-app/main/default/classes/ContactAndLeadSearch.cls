public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String name)
    {
        List<List< SObject>> search1 = [FIND :name IN ALL FIELDS RETURNING Contact(FirstName,LastName,Department),Lead(Name) ];
        
        Contact[] con = (Contact[])search1[0];
        for (Contact con1 : con)
        {
            System.debug(con1.lastname);
        }
        
        Lead[] leads = (Lead[])search1[1];
        for (Lead lead1 : leads)
        {
            system.debug(lead1.name);
        }
        return search1;
    }

}