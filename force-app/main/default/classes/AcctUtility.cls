public class AcctUtility 
{
	public static void mainProcessing()
    {
        try{
        insertAccount();
        }
        catch (AcctException ae)
        {
            system.debug('Message: ' +ae.getMessage());
            system.debug('Cause: ' +ae.getCause());
            system.debug('Line Number: ' +ae.getLineNumber());
            
        }
    }
    
    public static void insertAccount()
    {
        try {
        Account a=new Account(Name='JohnnyKiran');
        insert a;
        }
        
        catch(DMLException de)
        {
            throw new AcctException('account can not be created becaouse the required field name is missing', de);
        }
    }

}