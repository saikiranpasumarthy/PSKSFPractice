global class batchClassthree implements database.Batchable<sobject>, Database.stateful
{
	public integer count =0;
    public static integer size = 0;
    public string query;
    global batchClassthree(string q)
    {
        query=q;
    }
    
    global database.QueryLocator start(database.BatchableContext bc)
    {
        return database.getQueryLocator(query);
    }
    
    global void execute (database.BatchableContext bc, list<account> scope)
    {
        for(account a: scope)
        {
            count = count + 10;
            size= size+10;
        }
               
    }
    
    global void finish(database.BatchableContext bc)
        {
            List<String> param1 = new list<string>{'pasumarthysaikiran@gmail.com'};
            account a =new account();
            a.Name = 'count'+count+ ': size' +size;
            messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
            msg.setToAddresses(param1);
            msg.setSubject('batchclassthree');
            msg.setSenderDisplayName('kiran');
            msg.setPlainTextBody(size + 'Processing of the latest approved modifications has completed.\''+ count +
                                 '\' \nView the results via the TAL Batch Updates tab.');
                                     
           insert a;
        }
    
}