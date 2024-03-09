@isTest
public class Test_AccTrgr 
{
	@isTest
    static void testMe()
    {
        Account a = new Account();
        a.Name = 'sai';
        a.Phone = '123';
        insert a;
        Account a1 = [Select id, ownership, rating from account where id =: a.Id];
        System.assertEquals('Public', a1.Ownership);
        system.assertEquals('Hot', a1.Rating);
    }
}