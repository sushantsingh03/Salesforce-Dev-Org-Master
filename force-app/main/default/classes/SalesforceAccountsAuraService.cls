public class SalesforceAccountsAuraService {
    
    @AuraEnabled
    public static list<Account> showAccounts()
    {
        list<Account> accList = new List<Account>([Select Id,Name,Owner.Name,AnnualRevenue,BillingCountry,AccountNumber,Phone,Primary_Contact__r.Name from Account LIMIT 100]); 
        
        return accList;
    }
    
    @AuraEnabled
    public static List<Contact> getContactList (String accountId)
    {
        List<Contact> conList = new List<Contact>([Select Id,FirstName,LastName,Name,Phone,Email,MailingAddress,Is_Primary_Contact__c from Contact where AccountId =: accountId]); 
        return conlist;
        
    }
    
    @AuraEnabled
    public static list<Account> searchAccount (String accountName)
    {
        String name =  + accountName + '%';
        return [SELECT Id,Name,Owner.Name,AnnualRevenue,BillingCountry,AccountNumber,Phone,Primary_Contact__r.Name FROM Account WHERE name LIKE :name];
    }
    
    @AuraEnabled
    public static void updatePrimaryContactOnAccount (String contactId)
    {	
        Contact con = [Select Id,FirstName,LastName,Name,Phone,Email,MailingAddress,Is_Primary_Contact__c,AccountId from Contact where id =: contactId];
        Id accountId = con.AccountId;
        Account acc = [Select Id,Name,Owner.Name,AnnualRevenue,BillingCountry,AccountNumber,Phone,Primary_Contact__r.Name from Account where id=: accountId]; 
        acc.Primary_Contact__c = con.Id;
        update acc;
    }
}