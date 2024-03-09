trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) 
{	
    //ClosedOpportunityClass.ClosedOpp(trigger.new);
   
        List<task> newtsk = new List<task>();
        
        for(Opportunity op: trigger.new)
        {
            if(op.StageName=='Closed Won')
            {
                Task t = new Task();
                t.Subject='Follow Up Test Task';
                t.WhatId=op.Id;
                t.Status='Open';
                t.Priority='Normal';
                newtsk.add(t);
                
            }
            
        }
        insert newtsk;
}