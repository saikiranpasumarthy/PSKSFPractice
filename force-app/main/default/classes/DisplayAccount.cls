public class DisplayAccount
{
    public account[] myacc {set; get;}
    
    string query = 'select name from account';
    
    public DisplayAccount()
    {
        myacc = [select name, industry from account];
        }
}