@isTest
public class AnimalLocatorTest {
    
    @isTest
    static void testgetAnimalNameById()
    {
        //Set Mock Callout class
        //This causes the mock response to be sent
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String result = AnimalLocator.getAnimalNameById(1);
		System.debug(result);
        
        String expectedResult = 'chicken';
        
		system.assertEquals(result, expectedResult, 'The results are the same');        
    }

}