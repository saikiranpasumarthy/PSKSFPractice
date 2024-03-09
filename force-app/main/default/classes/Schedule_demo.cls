public class Schedule_demo implements Schedulable
{
	public void execute(SchedulableContext sc)
    {
        List<Account> accs = [Select id from Account where createddate =TODAY];
        delete accs;
    }
}