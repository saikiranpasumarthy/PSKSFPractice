public class Soqltest1 
{
    public String s = '';
    public List<String> selected;
    public Soqltest1()
    {
        selected = new List<String>{'Name', 'Phone', 'Industry','Ownership','Type'};
         
    }
    
    public Soqltest1(String d)
    {
        this.s = d;
    }
    public String y = 'kirantestfield1'; 
	public List<Account> aq = [select Id,Name,Industry ,(select lastName,firstName from Contacts__r) from Account where Name =:y];
    public List<Contact> cons = [ select lastName,firstName from Contact limit 1 ];
    public List<Account> findAll(){       
        String query = 'Select Id';
        for(String s :selected)
        {
			query = query+','+s;            
        }
        query = query + ' from Account';
        return Database.query(query);
		}
    
    
}