public class Schedule_Example2 implements schedulable
{
	public void execute(schedulablecontext cxt)
    {
        list<opportunity> ops = [select id,stagename from Opportunity where stagename='Prospecting' and createdDate=TODAY];
        
        for(opportunity op: ops)
        {
            op.stagename = 'closed won';
        }
        update ops;
        
    }
}