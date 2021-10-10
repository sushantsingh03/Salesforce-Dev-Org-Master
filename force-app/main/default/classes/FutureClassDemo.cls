public class FutureClassDemo {
    
    public void invokeFutureMethods ()
    {
        futureClass1();
        futureClass2();
        futureClass3();
    }
    
    @future (callout=true)
    public static void futureClass1()
    {
        system.debug('Inside future class 1');
    }
    
    @future
    public static void futureClass2()
    {
        system.debug('Inside future class 2');
    }

    @future
    public static void futureClass3()
    {
        system.debug('Inside future class 3');
    }

}