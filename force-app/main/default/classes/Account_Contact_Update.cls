public class Account_Contact_Update 
{
    public Account acc {set;get;}
    public List<Contact> con {set;get;}
    
    public Account_Contact_Update(Apexpages.StandardController controller)
        {
            List<String> fields = new List<String>{'Name','Phone','Industry','Rating'};
            controller.addFields(fields);
            acc=(Account)controller.getRecord();
        }
    
    public pagereference invoke(){
        List<contact> con = [select id, email from contact where accountid=:acc.id];
        List<string> emails = new List<string>();
        for(Contact c:con)
            {
                emails.add(c.email);
            }
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setToAddresses(emails);
        msg.setSubject('Update contact details');
        msg.setPlainTextBody('Dear customer, update con details');
        Messaging.Email[] mails = new Messaging.Email[]{msg};
        Messaging.sendEmail(mails);
        pagereference p = new pagereference('/'+acc.id);
        return p;
    }
}