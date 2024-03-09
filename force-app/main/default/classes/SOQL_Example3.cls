public class SOQL_Example3 
{
    public List<Account> accs {set;get;}
    public List<SelectOption> so {set;get;}
    public List<string> selected {set;get;}
    
    public SOQL_Example3()
    {
        selected = new List<string>();
        List<String> fields = new List<String>{'Name', 'phone','rating','industry','ownership','type'};
        so = new List<SelectOption>();
        
        for(string s:fields)
        {
            SelectOption op = new SelectOption(s,s);
            so.add(op);
        }
    }
    
    public void getAll()
    {
        String query = 'select id';
        for(String s:selected)
        {
            query = query+','+s;
        }
        query = query+ ' from Account';
        accs = Database.query(query);
    }
}