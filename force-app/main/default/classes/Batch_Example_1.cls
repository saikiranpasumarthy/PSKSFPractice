global class Batch_Example_1 implements database.Batchable<sobject>
{
	global database.QueryLocator start (database.BatchableContext bc)
    {
        string query = 'select id, name, ownership from account';
        return database.getQueryLocator(query);
    }
    
    global void execute (database.BatchableContext bc, List<account> la)
    {
        for(account a:la)
            {
                a.Ownership = 'public';
            }
        update la;
    }
    
    global void finish (database.BatchableContext bc)
    {
        
    }
}