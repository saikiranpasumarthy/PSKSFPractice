global class batchClasstwo implements database.Batchable<sobject>
{
    public string query;
	global database.QueryLocator start (database.BatchableContext bc)
    {
        return database.getQueryLocator(query);        
    }
    
    global void execute (database.BatchableContext bc, list<Opportunity> opps)
    {
        for(opportunity op: opps)
        {
            op.Amount = op.Amount+10;
            op.closedate=system.today();
        } 
        update opps;
    }
    
    global void finish (database.BatchableContext bc)
    {
        
    }
}

// select id,Amount,closedate from opportunity
// for(opportunity op: opps){op.Amount=Amount+10;op.closedate=system.today()}};
//