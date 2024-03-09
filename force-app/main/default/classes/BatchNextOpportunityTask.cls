public class BatchNextOpportunityTask implements Database.Batchable<sObject>, Database.Stateful, Schedulable {
    
    List<task> newtask = new List<task>();
    
    
    public void execute(SchedulableContext SC) {
        Database.executeBatch( new BatchNextOpportunityTask() );
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query =  'Select ID, CreatedDate, (SELECT Id, Status FROM Tasks) from Opportunity where CreatedDate < TODAY';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Opportunity> scope){
        
        //system.debug('scope.size = '+scope.Tasks.size());
        
        for (Opportunity opp : scope){
            
            if (opp.Tasks.size() == 0 && opp.stagename=='Prospecting') {
                task t=new task(
                    whatid=opp.id, 
                    Status = 'Active',
                    Subject = 'Follow Up Test Task',
                    ActivityDate = system.today()
                );
                newtask.add(t); 
            }
            
        } insert newtask;
    } 
    
       public void finish(Database.BatchableContext bc){
     // can add here any email notification code  
    }    
}