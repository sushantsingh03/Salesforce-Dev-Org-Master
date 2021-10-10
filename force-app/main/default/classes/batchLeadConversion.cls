global class batchLeadConversion implements Database.Batchable<sObject> {
    /**
        
	*/
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        system.debug('In start method');
        
        String query = 'SELECT Id,Name,LeadSource,OwnerId,Account.website,AccountId,Account.name,Account.BillingStreet,Account.BillingCity,Account.BillingCountry,Account.BillingPostalCode, Account.BillingState FROM Opportunity Where Account.AccountNumber=\'CD656092\' LIMIT 1' ;
            
        
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList) {
       
        // process each batch of records
		system.debug('In execute method');
        
        
        Map<id, Task> tasksOnAccounts = new Map<Id, Task>();
        List<Task> taskOnOppty = new List<Task>();
        List<Task> tasksAddToLeads = new List<Task>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        List<Lead> leadslist = new List<Lead>();
        Set<id> accId =  new Set<id>();
        Map <Id, Contact> accountContactMap = new  Map <Id, Contact>();
        
        
        for (Opportunity opp : oppList)
        {
            accId.add(opp.AccountId);
        }
        
        for (Task t : [Select id, subject, AccountId from Task where AccountId In : accId])
        {
            tasksOnAccounts.put(t.AccountId, t);
        }
        
        /*for (Task t : [Select id, subject from Task where AccountId In : accId])
        {
            taskOnAccount.add(t);
        }
        */
        
        for (Contact c : [Select id, name,firstName, lastName,email,accountId,phone,MobilePhone,title, department from Contact where accountId In : accId])
        {
            accountContactMap.put(c.accountId, c);
        }
        
        
            for(Opportunity oppty : opplist) 
                
            {
                
                //updating Opportunity
                //oppty.Lead_created_for_this_Opportunity__c = true;
                //oppToBeUpdated.add(oppty);
                
                
                
                Contact con = accountContactMap.get(oppty.AccountId);
                //oppty.Lead_created_for_this_Opportunity__c	= true;
                
                Task t = tasksOnAccounts.get(oppty.AccountId);
                taskOnOppty.add(t);
             	
                Lead leadFromOpp = new Lead ();
                
                //setting global values for Lead
                leadFromOpp.Status ='New';
                //leadFromOpp.Lead_Domicile__c='Global';
                //leadFromOpp.Is_Created_from_Opportunity__c = True;
                
                //fields coming from Contact Level
                
                if (con != null)
                {
                    leadFromOpp.firstName = con.firstName;
                    leadFromOpp.lastName = con.lastname;
                    //leadFromOpp.Email = con.Email;
                    leadFromOpp.Email = 'sushantsingh.0340@gmail.com';
                    leadFromOpp.phone = con.phone;
                    leadFromOpp.MobilePhone = con.MobilePhone;
                    //leadFromOpp.Job_Seniority__c = con.Job_Seniority__c;
                    //leadfromopp.Job_Function1__c = con.Job_Function1__c;
                    leadfromopp.Title = con.Title;
                    //leadFromOpp.Department__c = con.Department;
                    
                }
                
                //fields coming on Lead from Opportunity level
                
                //leadFromOpp.Oppportunity_ID__c = oppty.id;
                leadFromOpp.OwnerId = oppty.OwnerId;
                leadFromOpp.website = oppty.Account.website;
                leadFromOpp.Company=oppty.AccountId;
                //leadFromOpp.Confidentiality_Type__c=oppty.Confidentiality_Type__c;
                
                                                
                //fields coming on lead from Account level
                
                //Potential_Opportunity_Product_s__c = oppty.Product_Name_s__c,  - bad picklist
                leadFromOpp.Street = oppty.Account.BillingStreet;
                leadFromOpp.City = oppty.Account.BillingCity;
                leadFromOpp.State = oppty.Account.BillingState;
                leadFromOpp.PostalCode = oppty.Account.BillingPostalCode;
                leadFromOpp.Country = oppty.Account.BillingCountry;
                //leadFromOpp.GICS_Plus_Sector__c = oppty.Account.GICS_Plus_Sector__c;
                //leadFromOpp.GICS_Plus_Industry_Group__c	 = oppty.Account.GICS_Plus_Industry_Group__c;		
                //leadFromOpp.GICS_Plus_Industry__c = oppty.Account.GICS_Plus_Industry__c;
                //leadFromOpp.GICS_Plus_Sub_Industry__c = oppty.Account.GICS_Plus_Sub_Industry__c;
                //leadFromOpp.rrpu__Alert_Message__c = oppty.Account.rrpu__Alert_Message__c;
                //leadFromOpp.Ratings_Department_Picklist__c = oppty.Account.Primary_Ratings_Department__c;
                //leadFromOpp.Prospect_Tier__c = oppty.Account.Prospect_Tier__c;
                    
                leadslist.add(leadFromOpp);
                							
                
            }
            
        try {
        	// insert Lead record
        	
			system.debug(leadslist);
           	Database.SaveResult[] srList =  database.insert(leadslist, true) ;
            //update oppToBeUpdated;
            
            for (Database.SaveResult sr : srList)
            {
            	for (Task t : taskOnOppty)
                    {
                        Task taskOnLead = t.clone(false, false, false, false);
                        taskOnLead.WhoId = sr.getId();
                        tasksAddToLeads.add(taskOnLead);
                        
                    }

			}
            
            Database.insert(tasksAddToLeads, true);
            
        }
        
        catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
    	// execute any post-processing operations
  }
}