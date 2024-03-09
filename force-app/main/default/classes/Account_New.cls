public class Account_New 
{
    Public Account acc {set;get;}
    Public Contact con {set;get;}
    Public Opportunity opp {set;get;}
    
    Public Account_New(Apexpages.StandardController controller)
    { 
        acc = (Account)controller.getRecord();
        con = new Contact();
        opp = new Opportunity();
	}
    
    public pagereference create()
    {
        Pagereference p;
         Integer count = [Select count() from account where name=:acc.name];
        if(count > 0)
        {
            Apexpages.Message ermsg = new Apexpages.Message(Apexpages.Severity.ERROR, 'duplicate found');
            apexpages.addMessage(ermsg);
        }
        else
        {
            insert acc;
            con.AccountId = acc.Id;
            opp.accountid = acc.Id;
            insert con;
            insert opp;
            p = new pagereference('/'+acc.Id);            
        }
        return p;
        
    }
}