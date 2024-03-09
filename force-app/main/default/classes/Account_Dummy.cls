@isTest

public class Account_Dummy 
{
	public static void create()
        {
            Account a1 = new Account(Name ='Testing1', Phone ='000-1111');
            Account a2 = new Account(Name ='Testing1', Phone = '20-12333' );
            List<Account> acc = new List<Account>();
            acc.add(a1);
            acc.add(a2);
            insert acc;
        }
}