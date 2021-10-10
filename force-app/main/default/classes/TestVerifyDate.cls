@isTest
public class TestVerifyDate {
    
    @istest public static void myTest1()
    {
        Date date1 = date.newInstance(2019,12,14);
    	Date date2 = date.newInstance(2019,12,15);
        Date date3 = Verifydate.CheckDates(date1, date2);
        system.assertEquals(date2, date3);
    }
    
    @isTest public static void myTest2()
    {
        Date date4 = date.newInstance(2019,12,14);
    	Date date5 = date.newInstance(2020,01,15);
        Date date6 = Verifydate.CheckDates(date4, date5);
        system.assertEquals(date.newInstance(2019, 12, 31), date6);
    }
    
}