@isTest
public class TestRestrictContactByName 
{
    public testmethod static void testcontactlname()
    {
        Contact c = new Contact(lastname='INVALIDNAME');
        insert c;
        List<contact> lcon = [select lastname from contact where lastname = 'INVALIDNAME'];
        SYSTEM.assertEquals(0, lcon.size());
	}
    
}