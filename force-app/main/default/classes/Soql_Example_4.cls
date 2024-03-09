public class Soql_Example_4 
{
    public List<account> accs {set;get;}    
    Public string searchtext {set;get;}
   
    public void get_records()
    {
         System.debug('====Search Fired====');
        if((searchtext!=' ') || (string.isNotEmpty(searchtext)))
        {
            String query;
            query = 'select id, name, phone, industry from account where industry like \'%'+searchtext+'%\'';
            accs= database.query(query);
            System.debug('====Size :'+accs.size());
        }
        else
        {
           	accs=[select id, name, phone, industry from account]; 
        }
    }
}