public class Acc_Opp_class
{
	public static void Opp_before(List<account> accs)
    {
        List<Opportunity> opnew = new list<Opportunity>();
        
        for(account a: accs)
        {
            Opportunity opp = new Opportunity(id=a.Name);
            opp.IsPrivate=true;
            opnew.add(opp);
            
        }
        update opnew;
    }
}