public class DMLExample6 
{
    public list<accountwrapper> wrapper {set; get;}
    public DMLExample6()
    {
        list<account> accs= [select id, name, phone, industry, rating from account];
        wrapper = new list<accountwrapper>();
        for(account a:accs)
        {
            accountwrapper aw= new accountwrapper();
            aw.acc=a;
            aw.flag=false;
            wrapper.add(aw);
        }
    }
    public void deleterecords()
    {
       list<account> acclist = new list<account>() 	;
        for(accountwrapper aw:wrapper)
        {
            if(aw.flag==true)
            {
                acclist.add(aw.acc);
            }
        }
        delete acclist;
       list<account> accs= [select id, name, phone, industry, rating from account];
        wrapper = new list<accountwrapper>();
        for(account a:accs)
        {
            accountwrapper aw= new accountwrapper();
            aw.acc=a;
            aw.flag=false;
            wrapper.add(aw);
        }
        
    }
    
}