public class Schedule_Example implements schedulable 
{
	public void execute(schedulablecontext cxt)
    {
        list<account> lp = [select id, name from account where createddate=last_week];
        delete lp;
        
    }
}