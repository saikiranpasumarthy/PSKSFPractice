global class batchClassone implements database.Batchable<sObject>

{
   public String query;
	global database.QueryLocator start (Database.BatchableContext bc)
    {
        query = 'select id,ownership from Account';
        return database.getQueryLocator(query);
    }
    
    global void execute (database.BatchableContext bc, list<account> scope)
    {
        for(account a :scope)
        {
            a.ownership='public';
        }
        
        update scope;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }
}