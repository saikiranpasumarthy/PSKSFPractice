public class Acc_Triggertest 
{
	public static void rateChange(List<Account> acc)
    {
        for(account a : acc)
        {
            a.ownership = 'Public';
            a.Rating = 'Hot';
        }
    }
}