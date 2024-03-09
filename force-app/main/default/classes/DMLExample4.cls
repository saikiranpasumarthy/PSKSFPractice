public class DMLExample4 
{
    public list<accountwrapper> accounts {set; get;}
    public string searchText 			 {set; get;}
    public DMLExample4(ApexPages.StandardController controller)
    {
        accounts = new list<accountwrapper>();
    }
    public void search()
    {
        accounts = new list<accountwrapper>();
        list<account> accs = [select id, name,phone, industry, ownership from account where industry=:searchtext];
        
        for(account a: accs)
            {
                accountwrapper aw = new accountwrapper();
                aw.acc=a;
                aw.flag=false;
                accounts.add(aw);
            }
        
    }
    
    public void updateRecords()
    {	
        list<account> acclist = new list<account>();
        for(accountwrapper aw: accounts)
        {
            if(aw.flag==true)
            {
                aw.acc.ownership='Private';
                acclist.add(aw.acc);
            }
        }
        update acclist;
    }
        
}