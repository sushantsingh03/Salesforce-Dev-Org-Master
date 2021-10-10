public class AccountTriggerHandler {
    
    public static void handleBeforeInsert(list<Account> newAccList)
    {
        updateAccountInfoBeforeInsert(newAccList);
    }
    
    public static void handleBeforeUpdate(List<Account> newAccountList, List<Account> oldAccountList)
    {
        updateAccountInfo(newAccountList, oldAccountList);
    }
    
    public static void handleAfterUpdate(List<Account> accountList)
    {
        updateRelatedOpportunities(accountList);
    }
    
    public static void handleBeforeDelete (List<Account> accountOldList, Map<ID, Account> accountOldMap)
    {
        checkAccountBeforeDel(accountOldList,accountOldMap);
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------
    
    public static void checkAccountBeforeDel (List<Account> accountOldList, Map<ID, Account> accountOldMap)
    {
        //This is the logic from trigger - AccountDeletion
        for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :accountOldList]) 
        {
            accountOldMap.get(a.Id).addError('Cannot delete account with related opportunities. Please contact your administrator.');   
        }
        
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------
    
    public static void updateAccountInfoBeforeInsert(List<Account> accList)
    {
        Set<id> accOwnerId = new Set<Id>();
        Map<Id,String> ownerName = new Map<Id,String>();
        
        for(Account a : accList)
        {
            accOwnerId.add(a.OwnerId);
        }
        
        for (User u : [Select id,Name from User where id IN :accOwnerId])
        {
            ownerName.put(u.Id,u.Name);    
        }
        
        for (Account a : accList)
        {
            //logic from trigger - AccountsTrigger
            a.ShippingState = a.BillingState;
            
            //This is the logic from the trigger - AccountAddressTrigger
            if ((a.BillingPostalCode!=NULL) && (a.Match_Billing_Address__c!=false))
            {
                a.ShippingPostalCode = a.BillingPostalCode;
            }
            
            //update Sales Rep from account manager
            a.Sales_Rep__c = ownerName.get(a.OwnerId);
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------
    
    public static void updateAccountInfo(List<Account> newAccList, List<Account> oldAccList)
    {
        Set<Id> accOwnerId = new Set<Id>();
        Map<Id,String> newOwner = new Map<Id,String>();
        Map<Id,String> oldOwner = new Map<Id,String>();
        
        for (Account a : newAccList)
        {
            accOwnerId.add(a.OwnerId);
        }
        
        for (User u : [Select Id,Name from User where Id in :accOwnerId])
        {
            newOwner.put(u.Id,u.Name);
        }
        
        for (Account a : oldAccList)
        {
            accOwnerId = new Set<Id>();
            accOwnerId.add(a.OwnerId);
        }
        
        for (User u : [Select Id,Name from User where Id in :accOwnerId])
        {
            oldOwner.put(u.Id,u.Name);
        }
        
        for (Account acc : newAccList)
        {
            
            //logic to update sales rep on account update and owner change
            Boolean ownerNotChanged = oldOwner.containsKey(acc.OwnerId);
            
            if (!ownerNotChanged)
            {
                acc.Sales_Rep__c = newOwner.get(acc.OwnerId);
            }
            
            System.debug('New Account Name is : ' +acc.Name);
            
            //This is the logic from the trigger - AccountAddressTrigger
            //Start
            if ((acc.BillingPostalCode!=NULL) && (acc.Match_Billing_Address__c!=false))
            {
                acc.ShippingPostalCode = acc.BillingPostalCode; } 
            //end
        }
        
        for (Account acc1 : oldAccList)
        {
            System.debug('Old Account Name is : ' +acc1.Name);
        }
        
        //update Sales Rep Name if the account owner is changed - 
        
       	
        
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------
    
    public static void updateRelatedOpportunities(List<Account> accList)
    {
        // This is the logic from triggers - SoqlTriggerBulk & DmlTriggerBulk 
        
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        
        List<Opportunity> relatedOpps = [Select id,name, probability from Opportunity where AccountId in :accList];
        
        for (Opportunity opp : relatedOpps)
        {
            if ((opp.Probability >= 50) && (opp.Probability < 100))
            {
                opp.Description = 'This description has been inserted from the updateRelatedOpportunities method of the AccountTriggerHandlerClass';
                oppToUpdate.add(opp);
            }
        }
        
        update oppToUpdate;
        
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------------------
    
}