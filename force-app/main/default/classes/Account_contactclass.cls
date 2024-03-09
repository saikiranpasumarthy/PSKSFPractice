public class Account_contactclass 
{
	public static void afterinsetm(List<account> accnew)
    {
        list<contact> conlist = new List<contact>();
        //set<id> newids = accnew.keySet();
        //Map<id, List<contact>> cm=new Map<id, List<contact>>([select id, lastname from contact where id in :newids]);
        //Map<id, contact> cold=new Map<id, contact>([select id, lastname, accountid from contact where id in :newids]);
       
        for(account newacc: accnew )
        {
            contact cnew = new contact();
            cnew.LastName= newacc.Name;
            cnew.AccountId=newacc.Id;
            conlist.add(cnew);   
        }
        insert conlist;
        
    }
}