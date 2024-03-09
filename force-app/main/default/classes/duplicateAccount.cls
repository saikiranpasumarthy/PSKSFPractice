public class duplicateAccount
{
	public static void oldacc (list<Account> acc, list<account> old1) 
    {
        for(account a: acc)
        {
            for(account b: old1)
            {
                if(b.Name==a.Name)
                {
                     a.name.addError('You Cannot Create the Duplicate Account');
                }
                else
                {
                    insert a;
                }
            }
        }
    }
}