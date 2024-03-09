public class DMLExample2 
{
    public Account acc 		{set; get;}
    public Opportunity opty {set; get;}
    
    public DMLExample2()
    {
        acc= new Account();
        opty= new Opportunity();
    }
    public PageReference save()
    {
        insert acc;
        opty.AccountId =acc.id;
        insert opty;
        pagereference p = new pagereference('/'+acc.id);
        return p;       
        
    }
     public void reset()
    {
         acc= new Account();
        opty= new Opportunity();  
        
    }
}