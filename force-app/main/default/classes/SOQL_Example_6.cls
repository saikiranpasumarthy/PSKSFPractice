public class SOQL_Example_6 
{
    public List<Account_Wrapper> accounts {set;get;}
    
    public SOQL_Example_6()
    {
        List<account> accred = [select id, name, phone, industry from account limit 5 offset 5];        
		accounts = new List<Account_Wrapper>();
        for(account a : accred)
        {
            Account_Wrapper aw = new Account_Wrapper();
            aw.acc = a;
            aw.flag=false;
            accounts.add(aw);
        }
    }    
}