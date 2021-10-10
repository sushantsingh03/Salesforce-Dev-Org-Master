trigger AccountTrigger on Account (before insert, before update, after insert, after update, before delete) {
    
    if(trigger.isBefore && trigger.isInsert)
    {
        system.debug('This is inside before insert block');
        AccountTriggerHandler.handleBeforeInsert(Trigger.new);
    }
    
    if (trigger.isUpdate)
    { 
        if (trigger.isBefore)
        {
            for (Account acc : Trigger.new)
            {
                //acc.CountTest__c = acc.CountTest__c+1; */
            }
            system.debug('This is inside before update block');
            AccountTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old);
            
            /*
             * 
             * for (Account acc : trigger.new)
            {
                System.debug('New Account Name is : ' +acc.Name);
                //System.debug('Old Account Name is : ' +trigger.oldMap.get(acc.Id).Name);          
            }
            
            for (Account acc1 : Trigger.old)
            {
                System.debug('Old Account Name is : ' +acc1.Name);
            }
            */         
        }
        
        if (trigger.isAfter)
        {
            
            AccountTriggerHandler.handleAfterUpdate(trigger.new);
        }
        
    }
    
    if (trigger.isBefore && trigger.isDelete)
    {
        AccountTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
    }
}