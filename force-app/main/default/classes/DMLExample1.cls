public class DMLExample1 
{
    public string name 		 {set; get;}
    public string phone		 {set; get;}
    public string industry 	 {set; get;}
    public string ownership	 {set; get;}
    public string rating 	 {set; get;}
    public decimal amount	 {set; get;}


public PageReference save()
{
    Integer count = [select count() from Account where name=:name];
    if (count>0)
    {
		apexpages.Message msg = new apexpages.Message(apexpages.Severity.ERROR,'duplicate records exixts')        ;
        apexpages.addMessage(msg);
        return null;
    }else {
    account acc = new account ();
    acc.Name = name;
    acc.Phone = phone;
    acc.Industry = industry;
    acc.Ownership = ownership;
    acc.AnnualRevenue= amount;
    acc.Rating='hot';
    insert acc;
    PageReference p = new PageReference('/'+acc.Id);
        return p; }
    	
}
    
    public void reset()
{
    name=null;
    phone =null;
    industry=null;
    rating=null;
    ownership=null;
    amount=null;
    
    	
}
        
}