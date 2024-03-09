public class RandomContactFactory 
{
	public static List<contact> generateRandomContacts(Integer num, String Lname)
    {
        list<contact> lcons = new List<contact>();
        
        for(Integer i=0;i<num;i++)
        {
            contact c = new contact();
            c.FirstName = lname+i;
            lcons.add(c);
        }
        system.debug('cons' +lcons);
        return lcons;
	
    }
}