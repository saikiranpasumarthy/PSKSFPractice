public class Mixed_DML_Example 
{
	public void call_me()
    {
        future_call();
        account acc = new account();
        acc.Name='Testing999';
        acc.Industry='Education';
        acc.Phone='1111';
        acc.Rating='Hot';
        insert acc;
    }
    @future
    public static void future_call()
    {
        profile p = [SELECT Id FROM Profile WHERE Name='Chatter Free User' ];
        UserRole r = [select id, name from UserRole where name='COO'];
        
       User u = new User(alias ='abcxyz1', email='abc1@xyz.com', 
            emailencodingkey='UTF-8', lastname='kiran123' ,
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='KIRAN@SALESFORCE.COM');
        insert u;
    }
}