global class Batch_Example_2 implements database.Batchable<sobject>
{
    global database.QueryLocator start (database.BatchableContext bc)
    {
        string query = 'select id, stagename, closedate from opportunity';
        return database.getQueryLocator(query);
    }

    global void execute (database.BatchableContext bc, list<opportunity> ops)
    {
        for(opportunity op: ops)
        {
            op.StageName='closed won';
            op.CloseDate=system.today();
        }
        update ops;
    }
    global void finish (database.BatchableContext bc)
    {
        
    }
}