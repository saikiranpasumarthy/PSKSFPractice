global class Batch_Example_4 implements database.Batchable<sobject>	
{
    
    global map<id, List<opportunity>> optmap;
    global Batch_Example_4()
    {
        optmap = new map<id, List<opportunity>>();
    }
    
	global database.QueryLocator start (database.BatchableContext bc)
    {
        string query = 'select ownerid, id, stagename  from opportunity';
        return database.getQueryLocator(query);
    }
    
    global void execute (database.BatchableContext bc, List<opportunity> scope)
    {
        for(opportunity op:scope)
            {
                if(optmap.containsKey(op.ownerid))
                {
                    list<opportunity> ops = optmap.get(op.OwnerId); 
                    ops.add(op);
                    optmap.put(op.OwnerId, ops);
                }
                else
                {
                    list<opportunity> ops = new list<opportunity>();
                    ops.add(op);
                    optmap.put(op.OwnerId, ops);
                }
            }
        
       
    }
    
    global void finish (database.BatchableContext bc)
    {
        set<id> userids = optmap.keySet();
        list<user> users = [select id, email from user where id in :userids];
        list<messaging.Email> emails = new list<messaging.Email>();
        for(user u: users)
        {
            messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
            string[] toadd = new string[]{u.email};
            msg.setToAddresses(toadd);
            msg.setSubject('optylist');
            string body = '';
            list<opportunity> optylist = optmap.get(u.id);
            for(opportunity op: optylist)
            {
                body = body + op.Name;
            }
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        messaging.sendEmail(emails);
        
    }
}