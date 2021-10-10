public class BeerSearchAuraService {
    
    
    
    @AuraEnabled
    public static List<Beer__c> searchBeer (String beerName)
    {
        String likeBeer = '%' +beerName+ '%';
        String query='';
        if (beerName != null)
        {
        query = 'Select Id, Name from Beer__c where Name LIKE :likeBeer LIMIT 12';
        }
        else
        {
            query = 'Select Id, Name,Alcohol__c,Brewery_Id__c,Beer_Code__c,Brewery_Name__c,Tags__c,Total_Quantity__c,Remaining_Quantity__c from Beer__c LIMIT 12';
        }
        List<beer__c> beerList = Database.query(query);
        return beerList;
    }

}