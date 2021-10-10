trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    List<Task> addTask = new List<Task>();
    
    for(Opportunity opp : trigger.new)
    {
        if(opp.StageName=='Closed Won')
        {
            addTask.add(new Task(WhatId=opp.id, 
                                Subject = 'Follow Up Test Task'));
        }
        
    }
    
    if(addTask.size()>0)
        {
            insert addTask;
        }

}