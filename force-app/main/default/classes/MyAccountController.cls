public class MyAccountController {
    
    public list<Account> accountList {get;set;}
    
     /*
      * public list<Account> accountList;
      * 
      * public list<Account> getAccountList()
     {
         return accountList;
     }
    
    public void setAccountList(List<Account> accList)
     {
         this.accountList = accList;
     }

	*/
    
    public MyAccountController()
    {
        accountlist = [Select id,name from Account limit 100];
    }

}