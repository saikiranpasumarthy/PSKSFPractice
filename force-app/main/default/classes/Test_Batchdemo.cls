@isTest
public class Test_Batchdemo 
{
	static testmethod void testMe()
    {
        Account_Dummy.create();
        Batch_demo b = new Batch_demo();
        Test.startTest();
        	Id jobid = Database.executeBatch(b);
        Test.stopTest();
        
        List<Account> accs = [Select id, rating from account];
        for (account a: accs)
            {
                System.assertEquals('Warm', a.Rating);
            }
        
    }
}