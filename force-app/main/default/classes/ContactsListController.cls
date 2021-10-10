public class ContactsListController {
    
    
    private String sortOrder = 'LastName';
    
    public List<Contact> getContacts()
    {
        List<Contact> conList = new List<Contact>();
        conlist = [Select id,FirstName,LastName,Title,email from Contact order by LastName ];
        return conList;
    }
    
    public void sortByLastName() {
    this.sortOrder = 'LastName';
}
    
public void sortByFirstName() {
    this.sortOrder = 'FirstName';
}
    

}