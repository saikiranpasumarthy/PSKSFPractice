@isTest
public class Test_leademail 
{
	@isTest
    static void create()
    {
        Lead l = new lead();
        l.Email = 'abc@xyz.com';
        l.LastName = 'kiran';
        l.Company = 'syntel';
        insert l;
    }
    @isTest
    static void testme()
    {
        create();
        Lead l = [select id, firstname from lead limit 1];
        l.FirstName = 'sai';
        update l;
        Integer count = limits.getEmailInvocations();
        System.debug(count);
        System.assertEquals(1, count);
    }
}