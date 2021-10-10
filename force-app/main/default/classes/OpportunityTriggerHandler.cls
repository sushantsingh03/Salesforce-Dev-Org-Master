public with sharing class OpportunityTriggerHandler {
    
    public static void handleBeforeInsert (List<Opportunity> oppList){

        updateAccountRating(oppList);
    }
    
    public static void updateAccountRating (List<Opportunity> opptyList)
    {
        Set<Id> accountId = new Set<Id>();
        List<Account> accList = new List<Account>();
        List<Account> accListToUpdate = new List<Account>();
        
        for (Opportunity opp : opptyList)
        {
            if (opp.StageName == 'Closed Won')
                accountId.add(opp.AccountId);
        }
        
        accList = [Select Id,Rating from Account where id IN :accountId];
        
        for (Account acc : accList)
        {
            if (acc.Rating != 'Hot')
            {
                acc.Rating = 'Hot';
                accListToUpdate.add(acc);  
            }
        }
        
        update accListToUpdate;
    }
    
    
    public static void handleBeforeUpdate(List<Opportunity> oppList){
        
        updateAccountRatingOpp(oppList);
        
    }
    
    public static void updateAccountRatingOpp (List<Opportunity> oppList)
    {
        //system.debug('Hello');
        Set<Id> accountId = new Set<Id>();
        List<Account> accList = new List<Account>();
        List<Account> accListToUpdate = new List<Account>();
        
        for (Opportunity opp : oppList)
        {
            if (opp.StageName == 'Closed Won')
                accountId.add(opp.AccountId);
        }
        
        accList = [Select Id,Rating from Account where id IN :accountId];
        
        for (Account acc : accList)
        {
            if (acc.Rating != 'Hot')
            {
                acc.Rating = 'Hot';
                accListToUpdate.add(acc);  
            }
        }
        
        update accListToUpdate;
    }
    public static void handleAfterInsert(List<Opportunity> oppList)
    {
        updateAccountAmount(oppList,null, true, false);
        
    }

    public static void handleAfterUpdate(List<Opportunity> oppList, Map<id,Opportunity> oldMapOpp)
    {
        updateAccountAmount(oppList,oldMapOpp, false, true);
    }

    public static void updateAccountAmount(List<Opportunity> oppNewList,Map<id,Opportunity> oldMapOpp,Boolean isAftertInsert, Boolean isAfterUpdate)
    {
        //Account empty list
    List<Account> accList = new List<Account>();
    
    //to store the Account id's of the related accounts 
    Set<id> accId = new Set<Id>();
    
    //map to store account id's and the related Opportunity record
   	Map<Id,Opportunity> mapAccOpp = new Map<Id,Opportunity> ();
        
    
    // get the account id's of the related accounts in this transaction and add it to the set & filling in the created map
    for (Opportunity opp : oppNewList)
    {
        accId.add(opp.AccountId);
        mapAccOpp.put(opp.AccountId, opp);
    }
    
    //writting the business logic
    
    for (Account acc : [Select id,Total_Opportunity_Amount__c from Account where id In :accId])
    {
        //checking if the Opportunity amount has changed and is higher than the previous amount
        
        Opportunity opp = mapAccOpp.get(acc.Id);
        
        if (isAfterUpdate && (opp.Amount != oldMapOpp.get(opp.Id).amount))
        {
            
           Decimal newAmount = opp.Amount - oldMapOpp.get(opp.Id).amount;
        	acc.Total_Opportunity_Amount__c = acc.Total_Opportunity_Amount__c + newAmount;
            
            //adding the Account record to the list created
            accList.add(acc);
        }
        
        else if (isAftertInsert)
        {
            if(acc.Total_Opportunity_Amount__c != NULL)
            {
                acc.Total_Opportunity_Amount__c = acc.Total_Opportunity_Amount__c + opp.Amount;
            }
            else
            {
                acc.Total_Opportunity_Amount__c = opp.Amount;
            }
                
            
            accList.add(acc);
        }      
        
    }
    
    if(accList.size()>0)
    {
    	update accList;    
    }
        

    }


}