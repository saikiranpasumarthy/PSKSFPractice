public class rejectDoublebookings 
{
	public static void rejectbookingtwice(list<Session_Speaker__c> newsession)
    {
        for(Session_Speaker__c sessobj : newsession)
        {
            Session__c newsess= [select id, Session_Date__c from Session__c where id=:sessobj.Session__c ];
            
            list<Session_Speaker__c> conflicts=[select id from Session_Speaker__c where Speaker__c =:sessobj.Speaker__c
                                                and session__r.Session_Date__c =:newsess.Session_Date__c ];
            if(!conflicts.isEmpty())
            {
                sessobj.addError('the speaker is already booked at that time');
            }
        }
        
    }
    
}    
    
    
//*******************************************************************************************************************    
    /**        
        Session_Speaker__c[] sessionspeaker = new List<Session_Speaker__c>();        
        sessionspeaker=[select session__r.Name, session__r.Session_Date__c, speaker__r.First_Name__c,
                           speaker__r.Last_Name__c,speaker__r.Email__c from Session_Speaker__c where id in :oldlist.keyset()];
        
        Session_Speaker__c[] newsession = new List<Session_Speaker__c>();  
        
        for(Session_Speaker__c check: oldlist.values())
        {
            if(check.session__r.Session_Date__c==newlist.get(check.Id).session__r.Session_Date__c)
            {
                system.debug('you have already enrolled for a session on thi day');
            }
            
            else
            {
                if(check.session__r.Session_Date__c!=newlist.get(check.Id).session__r.Session_Date__c)
            {
                Session_Speaker__c newses = new Session_Speaker__c();
                newses.session__r.Session_Date__c=newlist.get(check.id).session__r.Session_Date__c;
                 newses.session__r.Name=newlist.get(check.id).session__r.Name;
                newsession.add(newses);
                
            }
            }
        }
        upsert newsession;
        
    }
    */