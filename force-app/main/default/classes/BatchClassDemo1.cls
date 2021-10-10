global class BatchClassDemo1 implements Database.Batchable<sObject> {
    
    private integer magicNum = 0;
    
   	global Database.QueryLocator start (Database.BatchableContext bc)
    {
        //return database.getQueryLocator(List<SObject> query)
        return database.getQueryLocator('Select id, Name from Account');
    }
    
    global void execute (Database.BatchableContext bc, List<Account> scope)
    {
        system.debug('In the execute method');
        for (Integer i = 0; i <5; i++)
        {
            magicNum = i;
        }
    }
    
    global void finish (Database.BatchableContext bc)
    {
        system.debug('In the finish method');
        system.debug('Magic Number : ' +magicNum);
    }

}