global class ScheduleApexDemo implements Schedulable {
    
    global void execute (SchedulableContext sc)
    {
        system.debug('In the execute method of the Schedulable Apex');
        
        // we can call a batch apex class from inside a scheduled apex class
        // 
        //StatefulDemo sd = new StatefulDemo();
		//Database.executeBatch(sd, 10);
	
        List<Contact> conList = new List<Contact>([Select id,Name from Contact LIMIT 3]);
        
        for (Contact c : conList)
        {
            c.lastName = 'Updated by Schedulable Apex - ' + c.lastName;
        }
        
        update conList;
    }

}

/* Calling of this class - 
 * 
 * ScheduleApexDemo sd = new ScheduleApexDemo();
	String cronExp = '* * * 27 1 ?';
	String jobId = system.Schedulable('Schdule Job Demo ',cronExp,sd);
 */