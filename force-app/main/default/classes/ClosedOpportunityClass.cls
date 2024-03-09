public class ClosedOpportunityClass 
{
    public static void ClosedOpp(List<Opportunity> newops)
    {
        List<task> newtsk = new List<task>();
        
        for(Opportunity op: newops)
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
}