global class Inbound_Example_1 implements messaging.InboundEmailHandler
{
	public messaging.InboundEmailResult handleInboundEmail(messaging.InboundEmail email, messaging.InboundEnvelope env)
    {
        messaging.InboundEmailResult result = new messaging.InboundEmailResult();
        
        try 
        {
            contact con = [select id, name from contact where email =:email.fromAddress limit 1];
            Case c=new Case();
            c.subject=email.subject;
            c.Status='New';
            c.origin='Email';
            c.Priority='Low';
            c.contactId=con.Id;
            c.Description=email.plainTextBody;
            insert c;
            result.success= true;
            
        }
        catch(exception e)
        {
            result.success=false;
        }
        return result;
    }
}