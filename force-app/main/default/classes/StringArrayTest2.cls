public class StringArrayTest2 {
    
    public static List<String> generateStringArray2(Integer n)
    {
        List<String> arrayElement = new List<string>();
        for(integer i=0;i<n;i++)
        {
            arrayElement.add('Test ' +i);
            System.debug(arrayElement[i]);
        }
        return arrayElement;
        
    }

}