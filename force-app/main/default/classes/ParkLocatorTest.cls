@isTest
public class ParkLocatorTest 
{

    @isTest static void testCallout() 
    
    {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String Country = 'United States';
        
        List<String> result = ParkLocator.country(Country);
        
        List<String> parks = new List<String>();
         parks.add('Yosemite');
         parks.add('Yellow Stone');
         parks.add('Another Park');

        System.assertEquals(parks, result);
    }
}