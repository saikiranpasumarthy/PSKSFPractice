global class scheduleBatch implements Schedulable 
{
	global void execute(SchedulableContext ctx)
    { 
        batchClassone bone = new batchClassone();
         
        id bonejob = database.executebatch(bone);
        
        batchClassthree bthree = new batchClassthree('SELECT Industry FROM Account WHERE isDeleted=false LIMIT 10');
        
           id bthreejob = database.executebatch(bthree);
    }
}