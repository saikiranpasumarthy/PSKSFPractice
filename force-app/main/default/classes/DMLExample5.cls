public class DMLExample5 
{
    public List<accountwrapper> accounts {set; get;}
    public List<Selectoption> options   {set; get;}
    public string selected              {set; get;}
    public DMLExample5()
    {
		options =  new List<Selectoption>();
        Selectoption op = new Selectoption('none', '-none-');
        Selectoption op1 = new Selectoption('ALL', 'ALL');
        Selectoption op2 = new Selectoption('THIS_WEEK', 'this week');
        Selectoption op3 = new Selectoption('LAST_WEEK', 'last week');
        options.add(op);
        options.add(op1);
        options.add(op2);
        options.add(op3);
        
        
    }
    
    public void search()
    {
        accounts = new List<accountwrapper>();
        
        if(selected!='none')
            {
                string query = 'select id, name, phone, industry, ownership from account';
                if(selected!='ALL')
            {
                query = query + ' where createddate='+selected;
            }
                list<account> accs = database.query(query);
                for(account a:accs)
                {
                    accountwrapper aw = new accountwrapper();
                    aw.acc=a;
                    aw.flag=false;
                    accounts.add(aw);
                    
                }
            }
        
    }
    
    public pagereference updaterecords()
    {
        user u = [select id from user where firstname='Johnny'];
        list<account> ac = new list<account>();
        for(accountwrapper aw:accounts)
            {
                if(aw.flag==true)
                {
                    aw.acc.ownerid=u.id;
                    ac.add(aw.acc);
                    
                }
            }
        update ac;
        // /001?fcf=00B0o00000CCMlB
        pagereference pgrf = new pagereference('/001?fcf=00B0o00000CCMlB');
        return pgrf;
    }
}