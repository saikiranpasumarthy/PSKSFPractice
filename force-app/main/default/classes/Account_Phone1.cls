public class Account_Phone1 
{
	public static void beforeupdatem(Map<id, account> oldacc, Map<id, account> newacc)
    {
        set<id> aids = oldacc.keyset();
        List<contact> cons = [select id,AccountId,name,Phone from contact where AccountId in:aids];
        
        for(contact updc: cons)
        {
            
            updc.Phone=newacc.get(updc.AccountId).Phone;
           //cons.add(updc);
        }
        update cons;
    }
}