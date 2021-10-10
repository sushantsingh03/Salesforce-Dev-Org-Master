public class AccountHandler 
{
    
    public static List<Account> insertAccount(Integer numberOfNewAccounts)
    {
        
        Integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        while (counter <= numberOfNewAccounts)
        {
            Account acme = new Account();
            acme.Name = 'Acme Inc ' +counter;
            acme.AccountNumber = 'A000' +counter;
            addAccounts.add(acme);
            
            counter = counter + 1;
    	}
        
        insert addAccounts;
        return addAccounts;

	}
    
}
    
    //Already existing code in this file
    /* try{
            Account ac = new Account (Name = name);
            insert ac;
            return ac;
        }
        catch (DMLException e)
        {
            system.debug('Caught : '+e.getMessage());
            return null;
        } */