public class SOQL_Example_9 
{
    public List<account> accs {set;get;}
    public SOQL_Example_9()
    {
        accs = [select name, industry, (select lastname, firstname from contacts), (select name, stagename from opportunities) from account where id = '0010o00002CmBSZ'];
    }
}