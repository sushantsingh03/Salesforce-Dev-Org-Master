public class StringArrayTest {
    
    public static List<String> generateStringArray(integer n)
    {
        List<String> testArray = new List<String>();
        for (integer i=0;i<n;i++)
        {
            testArray.add('Test '+i);
            System.debug(testArray[i]);
        }
        
        return testArray;

        	
    }

}