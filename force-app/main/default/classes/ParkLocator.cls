public class ParkLocator {
    
    public static List<String> country (String Country)
    {
       ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
       
        return parkservice.byCountry(country);
        
    }

}