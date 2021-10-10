global class StatefulDemo implements Database.Batchable<sObject>, Database.Stateful {
    
    private integer magicNum = 0;
    
   	global Database.QueryLocator start (Database.BatchableContext bc)
    {
        //return database.getQueryLocator(List<SObject> query) This is the syntax
        system.debug('In the Start method');
        return database.getQueryLocator('Select id, Name from Account LIMIT 100');
    }
    
    global void execute (Database.BatchableContext bc, List<Account> scope)
    {
        system.debug('In the execute method');
        for (Integer i = 0; i <= 5; i++)
        {
            magicNum++;
        }
    }
    
    global void finish (Database.BatchableContext bc)
    {
        system.debug('In the finish method');
        system.debug('Magic Number : ' +magicNum);
    }

}