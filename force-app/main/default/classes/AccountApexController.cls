public class AccountApexController 
{
	@AuraEnabled    
    public static List<account> getAccounts()
    {
        list<account> accs = [select Id, name from account limit 10];
        return accs;
    }
}