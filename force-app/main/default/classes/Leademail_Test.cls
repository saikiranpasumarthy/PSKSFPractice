public class Leademail_Test 
{
	public void emailchange(List<lead> ld)
    {
        List<String> toadd = new List<String>();
        for(Lead l: ld)
        {
            toadd.add(l.Email);
        }
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
       	msg.setToAddresses(toadd);
        msg.setSubject('Testing Lead');
        msg.setPlainTextBody('Testing lead mail');
        Messaging.Email[] emails = new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
            
    }
}