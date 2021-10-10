trigger activeConAcc on Contact (after insert, after update, after delete, after undelete) {
    
    Set<id> accId = new Set<Id>();
    List<Account> accList = new List<Account>();
    Map<Id,Decimal> accMap = new Map<Id,Integer>();
    
    if (trigger.isAfter)
    {
        if (trigger.isInsert)
        {
            for (Contact c : Trigger.New)
            {
                accId.add(c.AccountId);
            }
            
            for (Account a : [Select Id,Name,Number_of_Active_Contacts__c from Account where id IN :accId])
            {
                accMap.put(a.Id, a.Number_of_Active_Contacts__c);    
            }
            
            for (Contact c : Trigger.New)
            {
                if (c.Stage__c == 'Active')
                {
                    Account a = new Account (id=c.AccountId, Number_of_Active_Contacts__c = accMap.get(c.AccountId) + 1);
                    accList.add(a);
                }
            }
            
            update accList;
        }
    }
    
    if (trigger.isUpdate)
    {
        accId = new Set<Id>();
        accList = new List<Account>();
        accMap = new Map<Id,Integer>();
        Set<Id> accOld = new Set<Id>();
        Map<Id,Decimal> accMapOld = new Map<id,Decimal>();
        
        for (Contact c : Trigger.new)
        {
            accId.add(c.AccountId);
        }
        
        for (Account a : [Select Id,Name,Number_of_Active_Contacts__c from Account where id IN :accId])
        {
            accMap.put(a.Id, a.Number_of_Active_Contacts__c);    
        }
        
        for (Contact c : Trigger.Old)
        {
            accOld.add(c.AccountId);
        }
        
        for (Account a : [Select Id,Name,Number_of_Active_Contacts__c from Account where id IN :accOld])
        {
            accMapOld.put(a.Id, a.Number_of_Active_Contacts__c);    
        }
        
        
        
        for (Contact c : Trigger.New)
        {
            if (c.Stage__c == 'Active')
            {
                if (c.AccountId == Trigger.oldMap.get(c.Id).AccountId)
                {
                    Account a = new Account (Id = c.AccountId,  Number_of_Active_Contacts__c = accMap.get(c.AccountId) + 1);
                    accList.add(a);
                }
                
                else
                {
                    Account a = new Account (Id = c.AccountId,  Number_of_Active_Contacts__c = accMap.get(c.AccountId) + 1);
                    accList.add(a);
                    
                    Account b = new Account (Id = Trigger.oldMap.get(c.Id).AccountId,  Number_of_Active_Contacts__c = accMapOld.get(Trigger.oldMap.get(c.Id).AccountId) - 1);
                    accList.add(b);
                }
            }
        }
        
        update accList;
        
    }
    
}