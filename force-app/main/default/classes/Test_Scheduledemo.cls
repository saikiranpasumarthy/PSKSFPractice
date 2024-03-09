@isTest
public class Test_Scheduledemo 
{
	@isTest
    public static void testMe()
        {
            Account_dummy.create();
            String cron = '0 30 10 15 6 ?';
            Schedule_demo sd = new Schedule_demo();
            Test.startTest();
            	Id sid = System.schedule('sdjob', cron, sd);
            Test.stopTest();           
            CronTrigger ct = [Select id, cronExpression from cronTrigger where id=:sid];
            System.assertEquals(cron, ct.CronExpression);
            Integer count = [select count() from Account where createddate = TODAY];
            system.assertEquals(0, count);            
        }
}