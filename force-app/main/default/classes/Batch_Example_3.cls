global class Batch_Example_3 implements database.Batchable<sobject>, Database.stateful
{
    global static Integer count=0;
    global Integer size=0;
    
	global database.QueryLocator start (database.BatchableContext cxt)
    {
        string query = 'select id, name from opportunity ';
            return database.getQueryLocator(query);
    }
    
    global void execute (database.BatchableContext cxt, list<opportunity> ops)
    {
        for (opportunity op: ops )
        {
           count= count+1;
            size=size+1;
            
        }
    }
    
    global void finish (database.BatchableContext cxt)
    {
        account acc = new account();
        acc.Name = 'count ' +count+ 'size '+size;
        
        insert acc;
    }
}