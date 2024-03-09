public class trgToUpdtField 
{
	public void updtvalue(list<account> acc)
    {
        for(account a:acc)
        {
            if(a.Hello__c!='world')
            {
                a.Hello__C='world';
            }
        }
    }
}