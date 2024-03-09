public class ContactApexController 
{
	
    @AuraEnabled
    public static list<contact> getContacts(Id recordId)
    {
        list<contact> cons = [select id, FirstName, LastName, Email, Phone
                             from contact where AccountId = :recordId];
        return cons;
    }
}