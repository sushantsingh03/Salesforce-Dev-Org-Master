public class Spoonacular {
    
    private static final String SPOONACULAR_API='https://api.spoonacular.com';
    private static final String API_KEY='a384f3e6dbd64d74915c18cafd3f8aaf';

    
    public static void getRandomRecipe()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/random?apiKey=' +API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('Response Code - ' +response.getStatusCode());
        if(response.getStatusCode() == 200) {
            system.debug('Response - ' +response.getBody());
        }
    }
    
    public static void getRecipe(String recipeId)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('Response Code - ' +response.getStatusCode());
        if(response.getStatusCode() == 200) {
            system.debug('Response - ' +response.getBody());
        }
    }
    
    public static void getRecipeByIngredients(String ingrediants)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + '/recipes/findByIngredients?apiKey='+API_KEY+ '&ingredients='+ingrediants);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('Response Code - ' +response.getStatusCode());
        if(response.getStatusCode() == 200) {
            system.debug('Response - ' +response.getBody());
        }
    }
    
}