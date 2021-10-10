trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
 
	if (trigger.isBefore && trigger.isInsert)
    {
        OpportunityTriggerHandler.handleBeforeInsert(trigger.new);
    }
    
    if (trigger.isBefore && trigger.isUpdate)
    {
        OpportunityTriggerHandler.handleBeforeUpdate(trigger.new);
    }
    
    if (trigger.isAfter && trigger.isInsert)
    {
        OpportunityTriggerHandler.handleAfterInsert(trigger.new);
    }

    if (trigger.isAfter && trigger.isUpdate)
    {
        OpportunityTriggerHandler.handleAfterUpdate(trigger.new,trigger.oldMap);
    }

}