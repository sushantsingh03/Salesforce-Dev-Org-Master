public class MyOpportunityListController {
    
    //get the list of Opportunities based on the search value
    
    @AuraEnabled
    public static List<Opportunity> fetchOpportunity (String searchKeyword)
    {
        List<Opportunity> returnList = new List<Opportunity>();
        
        //If the search value is null then return all Opps else search accordingly
        
        String searchKey;
        
        if (searchKeyword == NULL)
        {
            searchKey = null;
        }
        
        else
        {
            searchKey = searchKeyword;
        }
        
        returnList = [Select id, name, Account.Name, CloseDate, Amount from Opportunity Where Name LIKE :searchKey LIMIT 20];
        
        return returnList;
        
        
    }

}