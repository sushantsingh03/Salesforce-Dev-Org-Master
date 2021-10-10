public class AnimalLocator {
    
    public static String getAnimalNameById (Integer idNumber)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idNumber);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        String responseStr = '';
        
        //If the request was sent successfully get the response
        if (response.getStatusCode() == 200)
        {
            // Deserialize the JSON string into collections of primitive data types.
    		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
    		//{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}
            
    		 Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            
           	responseStr = string.valueof(animals.get('name'));
                
         }
		
         return responseStr;
	}
    
}