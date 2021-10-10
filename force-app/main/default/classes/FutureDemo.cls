public class FutureDemo {
    
    public void invokeFutureCall()
    {
        futureMethod1();
    }
    
    @future
    public static void futureMethod1()
    {
        system.debug('Inside future method 1.');
    }

}