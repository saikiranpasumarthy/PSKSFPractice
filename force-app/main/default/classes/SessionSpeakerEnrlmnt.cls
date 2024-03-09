public class SessionSpeakerEnrlmnt 
{
	public static void sendemailmsg(Map<id,Session_Speaker__c> newlist)
    {
        Session_Speaker__c[] sessionspeaker = new List<Session_Speaker__c>();
           
        sessionspeaker=[select session__r.Name, session__r.Session_Date__c, speaker__r.First_Name__c,
                           speaker__r.Last_Name__c,speaker__r.Email__c from Session_Speaker__c where id in :newlist.keyset()];
        
        for(Session_Speaker__c listss: newlist.values())
        {
            if(listss.speaker__r.Email__c != null)
            {
                String address = listss.speaker__r.Email__c;
				String subject = 'Speaker Confirmation';
                String body = 'TDear' + listss.speaker__r.First_Name__c +',\nyour session"' + listss.session__r.Name
                    + '" on ' + listss.session__r.Session_Date__c + ' is confirmed.\n\n' +'Thanks for speaking at the conference :) ! ';               
                EmailManager.sendMail(address, subject, body);

            }
        }
    }
}