public class QueueableDemo implements System.Queueable {
    
    public void execute(System.QueueableContext context)
    {
        system.debug('Inside the execute method of Queueable');
        
        List<Account> accList = new List<Account>([Select id,name from Account Limit 50]);
        system.debug('Account List - ' +accList);
    }

}