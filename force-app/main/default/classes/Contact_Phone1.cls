public class Contact_Phone1 
{
	public static void beforeupdatem(Map<id, contact> newcon, Map<id, contact> oldcon)
    {
        Set<Id> oldkeys = oldcon.keySet();
        list<contact> conlist = new list<contact>();
        for(id cupd: oldkeys)
        {
            contact oldc = oldcon.get(cupd);
            contact newc = newcon.get(cupd);
            if(oldc.MobilePhone!=newc.MobilePhone)
            {
                newc.HomePhone=oldc.MobilePhone;
            }
               
                
                }
        
    }
}