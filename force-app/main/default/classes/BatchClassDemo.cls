public class BatchClassDemo implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select id,Name from Account LIMIT 2');
        //it will not hit exception even if query hits 1 lakh records
    }
    
    public void execute(Database.BatchableContext bc, List<Account> subListFromStartMethod)
    {
        //process the batch of records
        for (Account acc : subListFromStartMethod)
        {
            acc.name = 'Updated by Batch Apex - ' + acc.Name;
        }
        
        update subListFromStartMethod;
    }
    
     public void finish(Database.BatchableContext bc)
    {
        system.debug('The batch is completed and we are in finish method');
    }
}