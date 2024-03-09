public class SOQL_Dynamic_Example 
{
    public string industry {set; get;}
    public string rating {set; get;}
    public list<account> accounts {set; get;}
    public void search ()
    {
        industry = industry.toUpperCase();
        string query = 'select name, industry, phone, rating from account';
        if( industry!='' && industry!=null && rating!='' && rating!=null )
        {
            query = query + ' where industry = \''+industry+'\' and rating = \''+rating+'\'';
            
        }
        else 
        {
            if( industry!='' && industry!=null)
            {
                query = query + ' where industry = \''+industry+'\' ';
            }
            else 
            {
                if( rating !='' && rating !=null)
                {
                    query = query +' where rating = \''+rating+'\' ';
                }
            }
        }
        accounts = database.query(query);
    }
    
}