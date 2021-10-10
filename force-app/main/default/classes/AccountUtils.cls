public class AccountUtils {
    
    public static List<Account> accountsByState (String state)
    {
        List<Account> resultset = [Select id,name from Account where BillingState = :state];
        return resultSet;
    }

}