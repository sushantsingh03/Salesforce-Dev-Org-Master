public class NewAccounts {
    
    public static void sObjectInsert(Integer value)
        
    {
        Integer counter = 1;
        
        //create a list to add our accounts
        List<Account> teaFactoryAccounts = new List<Account>();
        
        while (counter<=value)
        {
            //display the current counter value
            system.debug('Current counter value is : ' +counter);
            
            //Create a new Account
            
            Account store = new Account ();
            store.Name = 'The Tea Factory' + counter;
        	store.AccountNumber = '356281' + counter;
        	teaFactoryAccounts.add(store);
            System.debug('Tea Factory Acoounts');
            
            //increment the counter
            counter+=1;
            system.debug('Value after incrementing Counter : ' +counter);
        }
        
        System.debug('Size of Account List: ' + teaFactoryAccounts.size() );
        System.debug('Elements in Account List: ' + teaFactoryAccounts);
        
        //insert all of the accounts in the list
        
        insert teaFactoryAccounts;
        
    }

}